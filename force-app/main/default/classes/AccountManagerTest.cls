@Istest(SeeAllData=true)
public class AccountManagerTest {
    

    
    @IsTest
    public static void testaccountmanager() {
        RestRequest request = new RestRequest();
        request.requestUri = 'https://anandovlightning-dev-ed.my.salesforce.com/services/apexrest/Accounts/0017F00000TWlGy/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
		system.debug('test account result = '+ AccountManager.getAccount());


        
    }
    

}