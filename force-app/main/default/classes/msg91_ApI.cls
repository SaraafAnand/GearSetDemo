public class msg91_ApI {
    @future(callout='true')
    public static void sendsms(String phone){
         Http p =new Http();
        HttpRequest request=new HttpRequest();
        String endpoint='http://api.msg91.com/api/sendhttp.php?';
        endpoint=endpoint+'authkey=J4y1BnCh54t4dcLJKgBt22yr&';
        endpoint=endpoint+'mobiles='+phone;
        endpoint=endpoint+'&message=Hi How are you&sender=Anand&route=4&country=0';
       system.debug(+endpoint);
        request.setEndpoint(endpoint);
        
       request.setMethod('GET');
        HttpResponse response=p.send(request);
        String result= response.getBody();
        System.debug('====Status==='+result);
    }

}