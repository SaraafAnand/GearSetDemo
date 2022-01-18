public class spinner {
@AuraEnabled
    public static List<contact> getContacts(){
        List<contact> conList=[select lastname from contact];
        return conList;
    }
}