public class Payment_Gateway_Gopay {
 public String result{set;get;}
    public Payment_Gateway_Gopay(){
        Http p=new Http();
        payment__c pay=[select consumerSecret__c,ConsumerKey__c from payment__c where name=:'gopay'];
        HttpRequest request =new HttpRequest();
        request.setEndPoint('https://gw.sandbox.gopay.com/api');
        request.setMethod('POST');
        String body='grant_type=client_credentials';
        body=body+'&scope=payment-all';
      //  body=body+'&client_id='+pay.consumerSecret__c;
      //  body=body+'&client_secret='+pay.consumerkey__c;
        request.setBody(body);
        System.debug(body);
        HttpResponse response=p.send(request);
        result=response.getBody();
System.debug(result);
}

}