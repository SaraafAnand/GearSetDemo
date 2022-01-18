public class Docusign_Envelope {
    private string UserId = '4e57cb62-3dcd-4ba0-86cc-3f7c7deebb11';
    private string Password ='anandov';
    private string IntegratorsKey ='5936c4f5-b116-4e82-ad04-1f7d55e0f876';
    public  transient Blob file {set;get;} 
    public String envelopeId {set;get;}
    
    public void create(){
        Soap_DocusignWsdl.APIServiceSoap request= new Soap_DocusignWsdl.APIServiceSoap();
        // build credential xml to add to http header
       String auth = '<DocuSignCredentials><Username>'+ userId 
            +'</Username><Password>' + password 
            + '</Password><IntegratorKey>' + integratorsKey 
            + '</IntegratorKey></DocuSignCredentials>';
        System.debug('Setting authentication to: ' + auth);
            
        request.inputHttpHeaders_x = new Map<String, String>();
        request.inputHttpHeaders_x.put('X-DocuSign-Authentication', 
            auth);
 
        Soap_DocusignWsdl.Envelope envelope = new Soap_DocusignWsdl.Envelope();
        envelope.subject='Testinpurpose';
        envelope.EmailBlurb='Sending this to test the Soap APi Call' ;
        envelope.AccountId='5936c4f5-b116-4e82-ad04-1f7d55e0f876';
        Soap_DocusignWsdl.Document document = new Soap_DocusignWsdl.Document();
        document.ID = 1;
        document.pdfBytes = EncodingUtil.base64Encode(file);
        document.Name = 'Contract';
        document.FileExtension = 'pdf';
        envelope.Documents = new Soap_DocusignWsdl.ArrayOfDocument();
        envelope.Documents.Document = new Soap_DocusignWsdl.Document[1];
        envelope.Documents.Document[0] = document;
    Soap_DocusignWsdl.Recipient recipient_ToSign = new Soap_DocusignWsdl.Recipient ();
        recipient_ToSign.Id =1;
        recipient_ToSign.Type_x = 'Signer';
        recipient_ToSign.RoutingOrder = 1;
        recipient_ToSign.userName='S' + ' ' + 'Anand';
        recipient_ToSign.Email='anandsaraaf365@gmail.com';
        recipient_ToSign.RequireIDLookup = false;      
        
        envelope.Recipients = new Soap_DocusignWsdl.ArrayOfRecipient();
        envelope.Recipients.Recipient = new Soap_DocusignWsdl.Recipient[1];
        envelope.Recipients.Recipient[0] = recipient_ToSign;
        try {
            Soap_DocusignWsdl.EnvelopeStatus es 
            = request.CreateAndSendEnvelope(envelope);
            envelopeId = es.EnvelopeID;
        } catch ( CalloutException e) {
            System.debug('Exception - ' + e );
            envelopeId = 'Exception - ' + e;
        }
      
    }
}