public class OverLayPopUp {
@AuraEnabled
    public Static List<Account> getAccounts(){
        return [SELECT Id,Name,Rating,Industry FROM Account];
    }
}