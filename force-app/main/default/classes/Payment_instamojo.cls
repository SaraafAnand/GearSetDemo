/* * Author : S.Anand
   * CreatedDate : 12/11/2017
   * Version :1.0
   * Requirement: Implement Payment GateWay using Salesforce
*/


public class Payment_instamojo {
public String result{set;get;}
public String result1{set;get;}    
    
    public void authenitfication(){
        Http p=new Http();
        HttpRequest request =new HttpRequest();
    request.setEndPoint('https://test.payumoney.com/sandbox/payment/payment/chkMerchantTxnStatus?');

        request.setMethod('POST');
       
       String body='merchantKey=EJiEmdBV';
        
        body=body+'&merchantTransactionIds=TSN3000056599_2062014173214';
         request.setBody(body);
        request.setHeader('ContentType','application/x-www-form-urlencoded');
        request.setHeader('Authorization','bO348Yb22/80KKPHQfuE8yO5hxMT42RAN/0t/Msj/rg=');
        System.debug(body);
        HttpResponse response=p.send(request);
        result1=response.getBody();
        System.debug('result===>>>>'+result);
}
    public void paymentResponse(){
        Http p=new Http();
        HttpRequest request =new HttpRequest();
   //     request.setEndPoint('https://test.payumoney.com/payment/op/getPaymentResponse?');
        request.setEndPoint('https://test.payumoney.com/payment/op/getPaymentResponse?merchantKey=EJiEmdBV&merchantTransactionIds=396132-58876806');
        request.setMethod('GET');
     /*   String body='merchantKey=EJiEmdBV';
        body=body+'&merchantTransactionIds=396132-58876806';
        request.setBody(body);
 System.debug(body);*/
        request.setHeader('authorization', 'bO348Yb22/80KKPHQfuE8yO5hxMT42RAN/0t/Msj/rg=');
     request.setHeader('cache-control',' no-cache');
        
        
        HttpResponse response=p.send(request);
        result=response.getBody();
        System.debug('result===>>>>'+result);
        
    }
    public void paymentRequest(){
     Http p=new Http();
        HttpRequest request =new HttpRequest();
    request.setEndPoint('https://test.payumoney.com/payment/payment/createPayment?sourceReferenceId=testjaprefunda646475865');
//  request.setEndPoint('https://test.payumoney.com/payment/payment/createPayment?sourceReferenceId=testjaprefunda646475865&sourceReferenceId=testjaprefunda646475865&merchantKey=EJiEmdBV&merchantTransactionId=testjaprefunda456546p464646&totalAmount=5000&customerName=Sherlock&customerEmail=anandsaraaf365@gmail.com&productInfo=Shoes&paymentDate=10-12-2017&paymentMode=COD&paymentStatus=Success');
        request.setMethod('POST');
       
       String body='sourceReferenceId=testjaprefunda646475865';
        body=body+'&merchantKey=EJiEmdBV';
        body=body+'&merchantTransactionId=testjaprefunda456546p464646';
        body=body+'&totalAmount=5000';
        body=body+'&customerName=Sherlock';
        body=body+'&customerEmail=anandsaraaf365@gmail.com';
        body=body+'&productInfo=Shoes';
         body=body+'&paymentDate=10-12-2017';
         body=body+'&paymentMode=COD';
         body=body+'&paymentStatus=Success';
         request.setBody(body);
        System.debug(body);
        HttpResponse response=p.send(request);
        result1=response.getBody();
        System.debug('result===>>>>'+result);
    }   
}