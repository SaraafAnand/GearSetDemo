/* * Author : S.Anand
   * CreatedDate : 12/11/2017
   * Version :1.0
   * Requirement: Implement Payment GateWay using Salesforce
*/
public class Payment_payu {
public String response_Result{set;get;}
public String payment_Result{set;get;}
public String payout_result{set;get;}    
    public HttpResponse response {set;get;}    
    // Get a access Token
    public void paymentResponse(){
        Http p=new Http();
        HttpRequest request =new HttpRequest();
       request.setEndPoint('https://private-anon-121095da5b-payu21.apiary-mock.com/pl/standard/user/oauth/authorize');
      //   request.setEndPoint('https://secure.payu.com/pl/standard/user/oauth/authorize&grant_type=client_credentials&client_id=306311&client_secret=5efcf01b3505e59205e7ea547c0ea300');
        request.setMethod('POST');
        request.setHeader('Content-Type','application/x-www-form-urlencoded');
      String body='&grant_type=client_credentials';
        body=body+'&client_id=306372';
        body=body+'&client_secret=73009aa540e20e0b7109b92888676f0c';
        request.setBody(body); 
System.debug('body==>>>'+body);
        HttpResponse response=p.send(request);
        response_Result=response.getBody();
            }
    
    // Create a Payment
    public void payment(){
        Http p=new Http();
        HttpRequest request =new HttpRequest();
       request.setEndPoint('https://private-anon-613ebdd9ff-payu21.apiary-mock.com/api/v2_1/payouts');
        request.setMethod('GET');
      
        request.setHeader('Authorization','Bearer 3e5cac39-7e38-4139-8fd6-30adc06a61bd');
        request.setHeader('Content-Type','application/x-www-form-urlencoded');
System.JSONGenerator js=JSON.createGenerator(true); // true  : It is pretty print format
        js.writeStartObject();
        js.writeStringField('\\ shopId','122553 \\');
        js.writeFieldName('payout');
        js.writeStartObject();
        js.writeNumberField('\\ amount',3200 );
        js.writeFieldName('\\');
        js.writeEndObject();
        js.writeFieldName('\\');
        js.writeEndObject();
    String    body=js.getAsString();
        request.setBody(body); 
        HttpResponse response=p.send(request);
        payment_Result=response.getBody();
            }
   
   // payment Checkout
    public void payout(){
        Http p=new Http();
        HttpRequest request =new HttpRequest();
       request.setEndPoint('https://secure.payu.com/api/v2_1/payouts/2DVZMPMFPN140219GUEEE000P01AFAFA');
        request.setMethod('GET');
      
        request.setHeader('Authorization','Bearer 3e5cac39-7e38-4139-8fd6-30adc06a61bd');
                HttpResponse response=p.send(request);
        payout_result=response.getBody();
            }
   
   
}