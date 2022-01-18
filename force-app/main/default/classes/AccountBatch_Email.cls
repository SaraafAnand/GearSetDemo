/* Author:S.Anand
* Version:40.0
* Requirement:write a batch apex to group all the account records based on the owner and send an email to the list of accounts 
* CreatedDate:04/10/2017
*/
global class AccountBatch_Email implements Database.Batchable<sObject>,database.stateful{
     Map<id,List<Account>> accountMap ;
    public AccountBatch_Email() {
        accountMap=new Map<id,List<Account>>();
    }
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select name,id,ownerid from Account');
    }
    global void execute(Database.BatchableContext bc,List<Account> accounts){
        System.debug('AccountsSize'+accounts.size());
        for(Account newAccount:accounts){
            System.debug('Accounts Size===>>>>'+accounts.size());
            if(accountMap.containsKey(newAccount.OwnerId))
            {    
                system.debug('Account:====>>>>>'+newAccount);
                List<Account> accountList=accountMap.get(newAccount.OwnerId);
                 accountList.add(newAccount);
                System.debug('AccountListSize===>>>'+accountList.size());
                accountMap.put(newAccount.OwnerId, accountList);
                System.debug('AccountMap===>>'+accountMap.size());
            }
            else{
                List<Account> accountlist= new List<Account>();
                  accountlist.add(newAccount);
                accountMap.put(newAccount.ownerId, accountList);
                System.debug('AccountMap===>>'+accountMap.size());
            }
        }
    }
    global void finish(Database.BatchableContext bc){
		 Set<Id> keys=accountMap.keySet();
        System.debug('Keys:==>>>'+Keys);
        EmailTemplate template=[select id from emailTemplate where name='Sales:New Customer Email'];
        List<user> UserList=[select email,id from user where Id in: Keys];
        List<Id> id1=new List<Id>();
        for(User eachUser:UserList){
            id1.add(eachUser.Id);
       List<Account> accounts=accountMap.get(eachUser.id);
            Messaging.MassEmailMessage mails= new Messaging.MassEmailMessage();
            mails.setTemplateId(template.id);
            mails.setTargetObjectIds(id1);
            mails.setSaveAsActivity(false);
            List<Messaging.Email> Email= new List<Messaging.Email>();
            Email.add(mails);
            Messaging.sendEmail(Email);
        }
    }
}