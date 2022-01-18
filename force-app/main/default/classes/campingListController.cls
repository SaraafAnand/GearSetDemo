public class campingListController {
    @auraEnabled
    public static List<camping_Item__c> getItems(){
        return [select name,Quantity__c,price__c,packed__c from camping_Item__c];   
    }
   @auraEnabled
    public static camping_Item__c saveItem(camping_Item__c campItem){
        insert campItem;
        return campItem;
    }
}