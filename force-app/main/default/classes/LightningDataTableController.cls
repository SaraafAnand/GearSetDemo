public class LightningDataTableController{
    @AuraEnabled
    public static List<Contact> fetchAccountContacts(String contactId) { 
        List<Contact> lstContact=new List<Contact>();
        lstContact=[select id ,Name,Email,Phone from contact where accountid=:contactId];
        return lstContact;
    }
}