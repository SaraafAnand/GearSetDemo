global class AccountEmail implements Database.Batchable<sObject> {
    List<Id> accIds=new List<Id>();
    //fetch Ids from trigger.old to constructor
    global AccountEmail(List<Id> ids){
        accIds=ids;
    }
    global Database.QueryLocator start(Database.BatchableContext qc){
        return Database.getQueryLocator('select id,ownerid,(Select id,email,LastName from Contacts) from Account where id in:accIds');
    }
    global void execute(Database.BatchableContext qc , List<Account> accounts1){
         map<id,List<String>>cmap=new map<id,list<String>>();
        List<String> conNames=new List<String>();
  
        for(Account a:Accounts1){
            if(a.contacts.size()>0){
             a.adderror('Account With Contact Can Not Be Deleted');  
             System.debug('contact Size=====>>>'+a.contacts.size());
             }
            for(contact c:a.contacts){
                conNames.add(c.LastName);
                System.debug('contact Name:'+a.contacts.size());
              }
            cMap.put(a.ownerId,conNames);
            System.debug('Keys of cMap===>>'+cMap.keySet());
        }
        list<user> ulist=[Select id,email from user where id in:cmap.keySet()];
         for(user u:ulist){
            System.debug('Userid==>>'+u.Id);
           Messaging.singleEmailMessage email1=new Messaging.singleEmailMessage();
           email1.setToAddresses(new String[] {'u.email'});
        
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             String names;
       	email1.setSubject('Account Names List');
            for(String n:cMap.get(u.Id)){
                names= names+'Contactname::'+n;
                System.debug('Email Names===>>>>'+names);
            }
        email1.setHTMLBody( names) ;
           Messaging.sendemailResult[] r = Messaging.sendemail(new Messaging.singleEmailmessage[]{email1});
             System.debug('Succeded');
    }
}
    global void finish(Database.BatchableContext qc){
        
    }
}