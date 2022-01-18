public class seibel_ToSalesforce {

    public void Token(){
//String endpoint='https://<OAuthServer>/api/oauth/tokeninfo';
        String url=' http://jaber-Pc:2869/siebel-rest/v1.0/workspace/MyWorkspace/SIS Account List Applet ';
        Http p = new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        request.setHeader('Content-type','application/json');
        request.setHeader('Authorization','Basic');
        HttpResponse result=p.send(request);
        
    }
}