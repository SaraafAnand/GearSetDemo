public class AccountChild_List {
    public List<AccountChild_Wrapper> wrapperList {set;get;}
    public AccountChild_List(){
        wrapperList=new List<AccountChild_Wrapper>();
        getAccountList();
    }
    public void getAccountList(){
        // Query all the contacts,Opportunites from account that are  to be displayed in list */ 
   List<Account> accountList=[select name,(select LastName, email from contacts),(select Name,StageName,CloseDate from Opportunities) from Account];
       system.debug('AccountListsize====>>'+accountList.size());
        //for each account generated in the above List iterating contacts and Opportunites to add them int wrapper//
        for(Account account1:accountList){
            system.debug('AccountDetails====>>'+account1);
            // create a new wrapper to store the child object details
            AccountChild_Wrapper singleWrapper = new AccountChild_Wrapper();
            // Assign the account name to accountObject in the wrapper
            singleWrapper.accountWrapper=account1;
            if(account1.contacts.size()>0){
         /*for each contact  in the accountList  assign the last name fetched from account List
          to the  contacts wrapper of accountchild wrapper */
             singleWrapper.contactsWrapper=new List<contact>();
                // Iterating the contacts queried from the above accountList
                for(contact contact1:account1.contacts){
                    system.debug('Contacts Details:====>>'+contact1);
                    // Iterating contacts from the wrapper list of contacts
                       singleWrapper.contactsWrapper.add(Contact1);
                
            }
            if(account1.opportunities.size()>0){
             singleWrapper.opportunitiesWrapper=new List<opportunity>();
                for(opportunity opportunity1:account1.opportunities){
               singleWrapper.opportunitiesWrapper.add(opportunity1);
                    System.debug('OpportuntiyDetails:====>>>'+Opportunity1);
                }   
            }
            wrapperList.add(singleWrapper);
        }   
    }
}
}