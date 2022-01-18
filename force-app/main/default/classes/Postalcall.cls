public class Postalcall {
    public static void post(String Postoffice){
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        String endpoint='http://postalpincode.in/api/postoffice/'+Postoffice;
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        Map<Object,String> jsonMap=new Map<Object,String>();
        HttpResponse response=p.send(request);
        String jsonString =response.getBody();
        System.JSONParser jp=JSON.createParser(jsonString);
        while(jp.nextToken()!=null){
           jsonMAp.put(jp.getCurrentToken(),jp.getText());
            }
        for(Object k:jsonMap.keySet()){
            system.debug(k+':'+jsonMap.get(k));
            
        }
    }

}