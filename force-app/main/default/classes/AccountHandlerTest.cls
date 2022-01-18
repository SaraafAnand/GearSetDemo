@isTest
private class AccountHandlerTest {
    testmethod  static void testme(){
        Account acc= new Account();
        acc.Name='Ankit';
        insert acc;
        try{
            acc.Name='kumar';
            update acc;
        }
        catch(Exception e){
            system.debug(e);
        }
        
    }
}