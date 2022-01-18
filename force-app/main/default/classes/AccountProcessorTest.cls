@IsTest
private class AccountProcessorTest {
   @IsTest 
    private static void testCountContacts(){
        account acc=new account( name='xyz');
        insert acc;
        contact con=new contact(lastname='qwe',accountId=acc.id);
        insert con;
            account acc1=new account( name='pqr');
        insert acc1;
        contact con1=new contact(lastname='abc',accountId=acc1.id);
        insert con1;
        List<Id> idList=new List<Id>();
        idList.add(acc1.Id);
        idLIst.add(acc.Id);
        Test.startTest();
        AccountProcessor.countContacts(idList);
        Test.stopTest();
        Account ac=[select id,Number_of_Contacts__c from account where id=:acc.id];
        System.assertEquals(1, ac.Number_of_Contacts__c);
    }
}