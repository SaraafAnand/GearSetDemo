public class Heroku {

    Public void goopportunities( ){
    
            String restAPIURL = 'https://superman-caves.herokuapp.com/opportunities';
            HttpRequest httpRequest = new HttpRequest();  
            httpRequest.setMethod('GET');   
            httpRequest.setEndpoint(restAPIURL);  
            
            Http http = new Http(); 
            HTTPResponse res = new HTTPResponse();  
            
            res = http.send(httpRequest);  
            System.debug('reuslt'+res);
    }
}