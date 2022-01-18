public class AccountProcessor {
@future    
    public static void countContacts(List<Id> AccountId){
       List<Account> accList=[select id,name,Number_of_Contacts__c,
                                (select id from contacts) from Account where id in :AccountId];
        for(Account acc:accList){
        if(acc.contacts.size()>0){
            acc.Number_of_Contacts__c=acc.contacts.size();
         }  
        }
        update accList;
    }
}