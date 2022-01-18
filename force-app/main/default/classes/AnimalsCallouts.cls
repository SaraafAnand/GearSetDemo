public class AnimalsCallouts {
    public static HttpResponse makeGetCallout(){
        Http p=new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
       
        HttpResponse response=p.send(request);
        String result=response.getBody();
        System.debug('result=======>>>>>>>>'+result);
       Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        List<Object> animals = (List<Object>) results.get('animal');
        for(object a:animals){
            System.debug('animals==>>>'+a);
        }
        return Response;
    }

}