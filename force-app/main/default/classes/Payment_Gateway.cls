public class Payment_Gateway {
    public String result{set;get;}
    public Payment_Gateway(){
        Http p=new Http();
        payment__c pay=[select consumerSecret__c,ConsumerKey__c from payment__c where name=:'payu'];
        HttpRequest request =new HttpRequest();
        request.setEndPoint('https://secure.payu.com/pl/standard/user/oauth/authorize');
        request.setMethod('POST');
        String body='grant_type=trusted_merchant';
        body=body+'&client_id='+pay.consumerSecret__c;
        body=body+'&client_secret='+pay.consumerkey__c;
        request.setBody(body);
        System.debug(body);
        HttpResponse response=p.send(request);
        result=response.getBody();

}

}