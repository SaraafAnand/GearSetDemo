public class Docu_Check {
    public String result {set;get;}
    public String code {set;get;}
    public Blob file {set;get;}
    public String stringCsv{set;get;}
    public String fileType {set;get;}
    public String fileName {set;get;}
    public String jsonFile {set;get;}
    public Integration__c clientId {set;get;} 
    public String result_Token {set;get;}
    public  String document_Request {set;get;}
  
    public pageReference requestToken(){
    clientId=[select clientid__c,clientSecret__c from Integration__c where name='Docusign1'];
        String uri='https://ap5.salesforce.com/apex/Implicit_Callback';
        String url='https://account-d.docusign.com/oauth/auth?response_type=token&scope=signature';
        url=url+'&client_id='+clientId.clientid__c;
        url=url+'&redirect_uri='+uri;
        System.debug('endpoint'+url);
        pageReference p= new pageReference(url);
        return p;
    }
     public void readCode(){
       code= ApexPages.currentPage().getParameters().get('access_token');
         System.debug('Token====>>'+code);
    }
    
    public void convertFile(){
        String json= '{' +
            ''+
           '"emailsubject":"Agreement",'+ 
'"emailBlurb":"MSTSolutions is sending you this request for your electronic signature and enter or update confidential payment information.\n\nPlease review and electronically sign by following the link below.",'+
   '"templateId": "'+'templateID'+'",'+
   ' "envelopeIdStamping": "false",'+
   '"templateRoles": ['+
            '{'+ 
          '"roleName": "Signer 1",'+
            '"name": "'+'name'+'",'+
            ' "email": "'+'email'+'",'+
            '"recipientId": "1"'+
            '}'+
            '],'+
            '"status":"sent"'+
            '}';
        result=EncodingUtil.Base64Encode( Blob.valueOf( Json ) );
            UploadFile();
    }

     public void UploadFile() {
     
        Http p= new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://demo.docusign.net/restapi/v2/accounts/4130580/envelopes');
         request.setBody(result);
        request.setMethod('POST');
     //  request.setHeader('Content-Type', 'multipart/mixed; boundary=xyz');
    //    request.setHeader('Content-length', String.valueOf(result.length()));
        request.setHeader('X-DocuSign-Authentication','{ "Username":"anandsaraaf365@gmail.com","Password":"anandov","IntegratorKey":"f3d26819-ee25-47e2-910b-6af92347ec3c"}');
		request.setHeader('Accept','application/json');
           request.setHeader('Content-Type','application/json');
                HttpResponse response=p.send(request);
        document_Request=response.getBody();
        System.debug('response'+response);
        
    }
}