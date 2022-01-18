/* Author:S.Anand
* Version:40.0
* Requirement:write a batch apex to delete all the contacts of the accounts which are created in the last month.
* CreatedDate:04/10/2017
*/
global class AccountChild_Delete implements Database.Batchable<sObject> {
    //fetch all the contacts from the account object
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id,name,(select id,name from contacts) from Account where CreatedDate=LAST_MONTH');
    } 
    //for each account if contact size is greater than zero then delete the contact
    global void execute(Database.BatchableContext bc,List<Account> accounts){
        
        List<Contact> contactList=new List<Contact>();
        for(Account newAccount:accounts){
            if(newAccount.contacts.size()>0){
                for(Contact newContact: newAccount.contacts){
                    contactList.add(newContact);
                    system.debug('contactList'+contactList);
                }
            }
        }
        delete contactList;
        System.debug('Size of Con List'+contactList.size());
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}