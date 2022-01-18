public class HttpSMS {
    @future(callout=true)
    
    public static void sendSms(){
        List<String> phones=new List<string>{'918639176156'}; 
       Http p=new Http();
        HttpRequest request=new HttpRequest();
        String endpoint='https://control.msg91.com/api/sendhttp.php?';
        endpoint=endPoint+'authkey=173968A8rT7b8&';
        for(Integer i=0;i<phones.size();i++){
            if(i==0){
              endpoint=endpoint+phones[i];
            }
            else{
               endpoint=endpoint+','+phones[i]; 
            }
        }
        endpoint=endpoint+'&message=Registration is success&sender=satishmyla&route=4';
        request.setEndPoint(endpoint);
        request.setMethod('GET');
        HttpResponse response =p.send(request);
        String result=response.getBody();
        System.debug('====Status===='+result);
    }
}