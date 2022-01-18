public class DocuSign_ImplicitGrant {
    public String envelop {set;get;}
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
        System.JSONGenerator js=JSON.createGenerator(true);
        /*  js.writeStartObject();
                js.writeFieldName('documents');
                js.writeStartArray();
                js.writeStartObject();
            js.writeStringField('documentBase64', 'FILE1_BASE64');
            js.writeStringField('documentId', '1');
            js.writeStringField('fileExtension', 'pdf');
            js.writeStringField('name','NDA.pddocumentIdf');
            js.WriteEndObject();
            js.writeEndArray();
            js.writeStringField('emailSubject', 'Please sign the NDA');
            js.writeFieldName('recipients');
            js.writeStartObject();
            js.writeFieldName('signers');
            js.writeStartArray();
            js.writeStartObject();
            js.writeStringField('email','anandsaraaf365@gmail.com');
            js.writeStringField('name','Anand Saraaf');
            js.writeStringField('recipientId','1');
            js.writeStringField('routingOrder":','1');
            js.writeFieldName('tabs');
            js.writeStartObject();
            js.writeFieldName('dateSignedTabs');
            js.writeStartArray();
            js.writeStartObject();
            js.writeStringField('anchorString', 'signer1date');
            js.writeStringField('anchorYOffset', '-6');
            js.writeStringField('fontSize', 'Size12');
            js.writeStringField('name', 'Date Signed');
            js.writeStringField('recipientId', '1');
            js.writeStringField('tabLabel', 'date_signed');
            js.writeEndObject();
            js.writeEndArray();
            js.writeFieldName('fullNameTabs');
            js.writeStartArray();
            js.writeStartObject();
            js.writeStringField('anchorString', 'signer1sig');
            js.writeStringField('anchorYOffset', '-6');
            js.writeStringField('fontSize', 'Size12');
            js.writeStringField('name', 'Full Name');
            js.writeStringField('recipientId', '1');
            js.writeStringField('tabLabel', 'Full Name');
            js.writeEndObject();
            js.writeEndArray();
            js.writeFieldName('signHereTabs');
            js.writeStartArray();
            js.writeStartObject();
            js.writeStringField('anchorString', 'signer1sig');
            js.writeStringField('anchorUnits', 'mms');
            js.writeStringField('anchorXOffset', '0');
            js.writeStringField('anchorYOffset', '0');
            js.writeStringField('name', 'Please sign here');
            js.writeStringField('optional', 'false');
            js.writeStringField('recipientId', '1');
            js.writeStringField('scaleValue', '1');
            js.writeStringField('tabLabel', 'signer1sig"');
            js.writeEndObject();
            js.writeEndArray();
            js.writeEndObject();
            js.writeEndObject();
            js.WriteEndArray();
            Js.writeEndObject();
            js.writeStringField('Status','sent');
            js.writeEndObject();
            envelop=js.getAsString(); */
        js.writeBlob(file);
        envelop=js.getAsString(); 
    }
    public void UploadFile() {
        convertFile();
        Http p= new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://demo.docusign.net/restapi/v2/accounts/4130580/envelopes');
        String bcontent = EncodingUtil.base64Encode(file);
        String contentType = '\r\n--myBoundary'+'\r\n'+'Content-Type:application/octet-stream'+ '\r\n'+
            'Content-Transfer-Encoding: base64'+'\r\n'+'Content-Disposition:attachment; '+'filename=\"contract.pdf\";'+
            'documentid=1 '+'\r\n\r\n\r\n';
        String cheader = '\r\n--myBoundary'+'\r\n'+' Content-Type: application/json'+ '\r\n'+' Content-Disposition: form-data'+ '\r\n'+'\r\n';
        System.debug('request body => '+envelop);
        String envEOF = '\r\n'+'--myBoundary--';
        request.setBody(cheader+''+envelop+'\r\n'+contentType+'\r\n'+bcontent+'\r\n'+envEOF);
        System.debug('Request Body = '+cheader+''+envelop+'\r\n'+contentType+'\r\n'+bcontent+'\r\n'+envEOF);
        request.setHeader('content-length', String.valueOf(bcontent.length()));
        request.setBody(cheader+''+envelop+'\r\n'+contentType+'\r\n'+bcontent+'\r\n'+envEOF);
        System.debug('Request Body = '+cheader+''+envelop+'\r\n'+contentType+'\r\n'+bcontent+'\r\n'+envEOF);
        request.setMethod('POST');
        request.setHeader('Accept','application/json'); 
        request.setHeader('X-DocuSign-Authentication','{ "Username":"anandsaraaf365@gmail.com","Password":"anandov","IntegratorKey":"f3d26819-ee25-47e2-910b-6af92347ec3c"}');
        request.setHeader('Content-Type', 'multipart/form-data;boundary=myBoundary');
        HttpResponse response=p.send(request);
        document_Request=response.getBody();
        System.debug('response'+response);
        
    }
}