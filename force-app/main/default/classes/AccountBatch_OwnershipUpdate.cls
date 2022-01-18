//fetch all Account records and update ownership as public
global class AccountBatch_OwnershipUpdate implements Database.Batchable<sObject> {
    //query the account records from account object
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id,ownership from account');
    }
    //for each account in the accountList update the ownership of the record
    global void execute(Database.BatchableContext bc , List<Account> scope){
        List<Account> accountList=new List<Account>();
        for(Account newAccount:Scope){
            newAccount.ownership='public';
            System.debug('updated ownership===>>>>>'+newAccount.ownership);
            accountList.add(newAccount);
        }
       system.debug('AccountList size=====>>>>'+accountList.size());
        update accountList;
    }
    global void finish(Database.BatchableContext bc){
        
    }
}