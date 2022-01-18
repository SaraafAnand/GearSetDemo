/* Author:S.Anand
* Version:40.0
* Requirement:This class handles multiple Account triggers in  form of methods
* CreatedDate:04/10/2017
*/
public class AccountHandler {
    // create a trigger on account which will set the ownership as public 
    public Static void accountOwnership_update(List<Account> accountList){
        //Updating the ownership for every record in trigger.new
        for(Account Account_new:accountList){
            Account_new.Ownership='public';
            system.debug('OwnerShip====>>'+Account_new.Ownership);
        }
    }
    //whenever an account name is modified send an email notification to the contact of an Account.  
    public static void accountEmail(Map<id,Account> oldMap, Map<id,Account> newMap){
        set<Id> updateId=new set<Id>();
        List<Messaging.SingleEmailMessage> mails= new List<Messaging.SingleEmailMessage>();
        //Iterating each id in old map and getting old and new account records to compare the names
        for(Id oldId:oldMap.keySet()){
            Account accOld=oldMap.get(oldId);
            system.debug('Oldaccount===>>'+accOld);
            Account accNew=newMap.get(oldId);
            system.debug('newaccount===>>'+accNew);
            if(accOld.Name!=accNew.Name){
                updateid.add(oldId);
                System.debug('updateIDList size:'+updateid.size());
            }
        }
        /* fetching email and contact details from contact object form the ids that are  
in updateid set*/ 
        List<contact> conList=[select email,Lastname from contact where accountid in:updateid];
        System.debug('contactlist===>>>'+conList.size());
        // iterate each contact from the above list and send the email to corresponding       
        for(Contact emailContact:conList){
            System.debug('Contactdetails===>>'+emailContact);
            Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
            List<String> sendto =new List<String>();
            sendto.add(emailContact.email);
            mail.setToAddresses(sendTo);
            mail.setReplyTo('anandov@gmail.com');
            String body= 'DearYour account name has been modified';
            mail.setHtmlBody(body);
            mails.add(mail);
        }
        Messaging.sendEmail(mails); 
        system.debug('Email===>>>'+mails);
    }
    // when the rating of an account is modified to Hot, share the record with wilson using apex based sharing rules
    public Static void accountShare_update(List<Account> accounts ){
        User u=[select id from user where alias='wils'];
        List<AccountShare> accountShare_List= new List<AccountShare>();
        for(Account accountUpdate:accounts){
            system.debug('AccountDetails==>>>'+accountUpdate);
            if(accountUpdate.rating=='Hot'){
                AccountShare accountShares= new AccountShare();
                accountShares.OpportunityAccessLevel='Edit';
                accountShares.UserOrGroupId=u.id;
                accountShares.AccountAccessLevel='Edit';
                accountShares.RowCause='Manual';
                system.debug('Shares===>>>'+accountShares);
                accountShare_List.add(accountShares);
            }
        }	
        insert accountShare_List;
    }
    // Whenever new account is created submit the record for approval
    public Static void accountApproval(List<Account> accountList) {
    user u=[select id,lastname from user where username='wilsonov@gmail.com'];
    system.debug('username==>'+u.LastName);
    //created a for loop to perform approval process for all records in trigger.new
    for(account accounts:accountList){
        System.debug('AccountId===>>'+accounts.id);
        // Created an approval request for the account
        Approval.ProcessSubmitRequest req1 =  new Approval.ProcessSubmitRequest();
        req1.setComments('Submitting request for approval.');
      req1.setObjectId(accounts.id);
        // Submited on behalf of a specific submitter
        req1.setSubmitterId(u.Id);
        // Submit the record to specific process and skip the criteria evaluation
        req1.setProcessDefinitionNameOrId('Test');
        req1.setSkipEntryCriteria(true);
        // Submit the approval request for the account
        Approval.ProcessResult result = Approval.process(req1);
        System.debug('result====>>'+result);
    }

}
    
    //Whenever account phone is updated change account new phone to contact other phone     
    public static void accountPhone_Update(Map<id,Account> oldMap , Map<id,Account> newMap){
        List<id> idList =new List<id>();
        /*from each id in the old Map getting the old and new accounts to compare the account names
thereby if account is updated adding the keyvalue to idList*/
        for(Id accountid:oldMap.keySet()){
            system.debug('accountIds====>>>'+accountid);
            Account accountOld=oldMap.get(accountid);
            Account accountNew=newMap.get(accountid);
            if(accountOld.Phone!=accountNew.Phone ){
                system.debug('oldphone===>>>'+accountOld.Phone);
                system.debug('newPhone===>>>'+accountNew.Phone);
                idList.add(accountOld.Id);
            }
            // fetching the contact details from the accounts for each id in idList
            List<contact> contactList =[select name,accountId,Id,otherPhone from contact where accountId in:idList];
            List<Contact> contactUpdate=new List<contact>();
            for(Contact account_Contact:contactList)
            {
                Account oldAccount=oldMap.get(account_Contact.AccountId);
                Account newAccount=newMap.get(account_Contact.AccountId);
                account_Contact.otherphone=newAccount.phone;
                system.debug('contactOtherPhone===>>>'+account_Contact.otherphone);
                system.debug('AccountPhone===>>>'+newAccount.phone);
                contactUpdate.add(account_Contact);
            }
            update contactUpdate;
        }
        
        
    }
    // for every new account create a new contact
    public static void accountInsert_Contact (List<Account> accountList){
        List<contact> contactList =new List<contact>();
        // for each account in trigger.new a new contact is being created
        for(Account account1: accountList){
            contact contactInsert = new contact();
            contactInsert.LastName= account1.Name;
            contactInsert.AccountId=account1.Id;
            contactList.add(contactInsert);
            system.debug('NewContact===>>'+contactInsert);
            system.debug('NewContact===>>'+account1);
        }
        insert contactList;
    }
}