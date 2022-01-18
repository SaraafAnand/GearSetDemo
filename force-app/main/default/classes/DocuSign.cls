public class DocuSign {
    public String result {set;get;}
    public  String code {set;get;}
    public Integration__c clientId {set;get;} 
    public String result_Token {set;get;}
    public pageReference requestToken(){
    clientId=[select clientid__c,clientSecret__c from Integration__c where name='docusign'];
        String uri='https://ap5.salesforce.com/apex/Docusign_Callback';
        String url='https://account-d.docusign.com/oauth/auth?response_type=code';
        url=url+'&scope=signature&client_id='+clientId.clientid__c;
        url=url+'&state=a39fh23hnf23';
        url=url+'&redirect_uri='+uri;
        System.debug('endpoint'+url);
        pageReference p= new pageReference(url);
        return p;
    }
    public void readCode(){
       code= ApexPages.currentPage().getParameters().get('code');
    }
    public  void request_Token(){
  Integration__c  clientId1=[select clientid__c,clientSecret__c from Integration__c where name='docusign'];
        system.debug('clientId'+clientId1.clientid__c);
        system.debug('clientSecret'+clientId1.clientSecret__c);
        try {
        Http p= new Http();
       HttpRequest request = new HttpRequest();
        String url='https://account-d.docusign.com/oauth/token?';
        url=url+'&grant_type=authorization_code';
        url=url+'&code='+code;
      String  b=clientId1.clientid__c+':'+clientId1.clientSecret__c;
        System.debug('b==>>'+b);
          String header=EncodingUtil.base64Encode(Blob.valueof(b));
        System.debug('header==>>'+header);
        request.setMethod('POST');
        request.setEndpoint(url);
        request.setTimeout(10000);
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setHeader('Authorization', 'Basic '+header);
        request.setHeader('Content-Length', String.valueOf(header.length()));
           HttpResponse response=p.send(request);
        result_Token= response.getBody();
        System.debug('result=====>>>'+result_Token);
        }
        catch(System.CalloutException e){
            System.debug('exception'+e);
        }
    }
}