/* Author:S.Anand
* Version:40.0
* Requirement:When a new Account is created ,check for the duplicate based on name,industry,phone. using trigger
a.if a duplicate record is found then throw error message
b.if duplicate record is not found ,
1.check rating :
If rating is hot --- system administrator should be owner
if rating is not hot---wilson should be the owner of the record
2.If annualrevenue is more than 50Laks then create Wilson as AccountTeamMember
* CreatedDate:17/10/2017
*/
trigger accountTrig_Error on Account (before insert,before delete,after insert ) {
    List<Account> accs=[select name,industry,phone,rating from Account];
    User uAdmin=[select id from user where alias=:'Asara'];
    User uWils=[select id from user where alias=:'anan'];
    List<AccountTeamMember> acTeams=new List<AccountTeamMember>(); 
    if(trigger.isBefore && trigger.isInsert){
        
        // Iterate each account from trigger.new
        for(Account acc:trigger.new){
            //For each account checking if there are any duplicates on name,Industry,phone and adding error message 
            for(Account acComp:accs){
                if((acComp.name==acc.Name)&&(acComp.Industry==acc.Industry)&&(acComp.phone==acc.Phone)){
                    acc.adderror('Duplicates found');
                }
                // If no duplicates are found checking if the rating is hot if so assigning the record adminstrator
                if(acc.rating=='Hot'){
                    acc.OwnerId=uAdmin.id;
                }
                // If rating is not hot assign the record to wilson      
                if(acc.rating!='Hot'&& acc.Rating!=Null && acc.Rating!=''){
                    acc.OwnerId=uWils.id;
                } 
            }
        }
    }    
            // created list to store accountteambers.
    list<AccountTeamMember>Accountteam = new list<AccountTeamMember>();
    // created trigger context variables
    if(trigger.isafter && trigger.isinsert){
        system.debug('Entry');
        // for loop to create accountteammember for trigger.new accounts.
        for(account Accounts1:trigger.new){
            system.debug('Accounts1.name:'+Accounts1.name);
            if(Accounts1.AnnualRevenue>5000000){
            AccountTeamMember member1 = new AccountTeamMember();
            member1.accountid=Accounts1.id;
            member1.accountaccesslevel='edit';
            member1.teammemberrole='manager';
            member1.userid=uAdmin.id;
            Accountteam.add(member1);
            }
        }
        // insert account team member
        insert Accountteam;
        system.debug('Accountteam:'+Accountteam);
    }
       
    
    //Before Delete Send email to account owner mail with list of contacts
    if(trigger.isBefore && trigger.isDelete){
        system.debug('Entering into before del trigger');
        List<Account> acList=[select id, name,(select id,Lastname from contacts) from Account];
        System.debug('AccountList===>>'+acList.size());
        Map<Id,List<String>> acMap=new Map<Id,List<String>>();
        List<String> conNames=new List<String>();
        for(Account a:Trigger.old){
            for(Account a1:acList){
                if(a1.contacts.size()>0){
                    a.addError('Contains'+a.contacts.size()+'contacts');
                } 
            }
            
        }
        /* Here we are getting the account from which is in  Trigger.old  */  
        List<Account> accDeleteList=[select id,ownerid, name,(select id,Lastname from contacts) from Account where id in:Trigger.old];
        System.debug('Account Deleting List====>>>'+accDeleteList);
        // for each in account in above List get the corresponding contact names and put in Map 
        for(Account acc: accDeleteList){
            System.debug('Account Details in Delete List===>>'+acc);
            for(contact c:acc.contacts){
                system.debug('===>>>ContactLastName:'+c.LastName);
                conNames.add(c.LastName);
            }
            acMap.put(acc.ownerId, conNames);       
        }
        System.debug('==>>>>>Id in accountMap'+acMap.keySet());
        String Names;
        List<user> userList=[select id,email,name from user where id in:acMap.keySet()];
        System.debug('==>>>>>UsersListsize'+userList.size());
        for(User u:userList){
            system.debug('Useremail:=======>>>>'+u.email);
            system.debug('UserName:'+u.Id);
            Messaging.Singleemailmessage mail = new Messaging.Singleemailmessage();
            System.debug('user Email====>>'+u.Email);
            String[] x= new String[]{u.Email};
            mail.setToAddresses(x);
            mail.setSubject('Private Account records for Deletion' );
            // Fetch the List of Names from user ID
            for(String s:acMap.get(u.id)){
                system.debug('NameList====>>>'+s);
                names=names+'Contactname:'+s;
                system.debug('Name====>>>'+names);
            }
            mail.setplainTextBody(names);
            System.debug('Name List===>>>'+names);
            system.debug('====>>> sendEmail - mail : ' + mail);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            System.debug('Succeded');
        }
    }
}