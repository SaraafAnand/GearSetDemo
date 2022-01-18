@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    
    global HTTPResponse respond(HTTPRequest req) {
        
        if(req.getEndpoint().endsWith('emailAddresses')){ 
            System.assertEquals(req.getEndpoint(),'https://graph.microsoft.com/v1.0/me/contacts?$select=displayName,surname,emailAddresses');
            System.assertEquals('GET', req.getMethod());
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setHeader('authorization','Bearer');
            res.setHeader('Accept','application/json');       
            res.setBody('{"example":"test","access_Token":"xyz123"}');
            res.setStatusCode(200);
            return res;
        }
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        else{
            System.assertEquals(req.getEndpoint(),'https://login.microsoftonline.com/common/oauth2/v2.0/token?');
            System.assertEquals('POST', req.getMethod());
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type','application/x-www-form-urlencodedkey');
            res.setBody('{"example":"test","access_Token":"xyz123"}');
            res.setStatusCode(200);
            return res;
        }
    }
}