@isTest
public class outlook_Test {
     @isTest 
   static void testContacts() {
        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());   
    
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock.
        outlook_class contact_test = new outlook_class();
        HttpResponse res = contact_test.getContacts();
        // Verify response received contains fake values
        String contentType = res.getHeader('authorization');
        System.assert(contentType == 'Bearer');
       String contentType1 = res.getHeader('Accept');
        System.assert(contentType1 == 'application/json');
        String actualValue = res.getBody();
        String expectedValue = '{"example":"test","access_Token":"xyz123"}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());
        
    }  
  @isTest 
    static void testCallout() {
        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());   
    
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock.
        outlook_class out_test = new outlook_class();
        HttpResponse res = out_test.getAccessToken();
        // Verify response received contains fake values
        String contentType = res.getHeader('Content-Type');
        System.assert(contentType == 'application/x-www-form-urlencodedkey');
        String actualValue = res.getBody();
        String expectedValue = '{"example":"test","access_Token":"xyz123"}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());
        
    }
  
}