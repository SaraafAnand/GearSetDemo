public with sharing class Soap_SendToDocuSignController {
    private final Contract contract;
    public  transient Blob file {set;get;}
    public String fileType {set;get;}
    public String fileName {set;get;}
    public String envelopeId {get;set;}
    private String accountId = '5936c4f5-b116-4e82-ad04-1f7d55e0f876';
    private String userId = '4e57cb62-3dcd-4ba0-86cc-3f7c7deebb11';
    private String password = 'anandov';
    private String integratorsKey = 'f3d26819-ee25-47e2-910b-6af92347ec3c';
    private String webServiceUrl 
        = 'https://demo.docusign.net/api/3.0/dsapi.asmx';
 /*   
    public Soap_SendToDocuSignController(ApexPages.StandardController controller)
    {
        this.contract = [select Id, CustomerSignedId, AccountId, ContractNumber 
        from Contract limit 1 ];
        envelopeId = 'Not sent yet';
        
        SendNow();
    } */

    public void SendNow()
    {
        DocuSignAPI.APIServiceSoap dsApiSend 
            = new DocuSignAPI.APIServiceSoap();
        dsApiSend.endpoint_x = webServiceUrl;

        //Set Authentication
        String auth = '<DocuSignCredentials><Username>'+ userId 
            +'</Username><Password>' + password 
            + '</Password><IntegratorKey>' + integratorsKey 
            + '</IntegratorKey></DocuSignCredentials>';
        System.debug('Setting authentication to: ' + auth);
            
        dsApiSend.inputHttpHeaders_x = new Map<String, String>();
        dsApiSend.inputHttpHeaders_x.put('X-DocuSign-Authentication', 
            auth);
 
        DocuSignAPI.Envelope envelope = new DocuSignAPI.Envelope();
        envelope.Subject = 'Please Sign this Contract: ';
        envelope.EmailBlurb = 'This is my new eSignature service,'+ 
            ' it allows me to get your signoff without having to fax, ' +
            'scan, retype, refile and wait forever';
        envelope.AccountId  = '5936c4f5-b116-4e82-ad04-1f7d55e0f876'; 
        

        // Render the contract;     

        // DocumentS
        DocuSignAPI.Document document = new DocuSignAPI.Document();
        document.ID = 1;
        document.pdfBytes = EncodingUtil.base64Encode(file);
        document.Name = 'Contract';
        document.FileExtension = 'pdf';
        envelope.Documents = new DocuSignAPI.ArrayOfDocument();
        envelope.Documents.Document = new DocuSignAPI.Document[1];
        envelope.Documents.Document[0] = document;
        
        DocuSignAPI.Recipient recipient = new DocuSignAPI.Recipient();
        recipient.ID = 1;
        recipient.Type_x = 'Signer';
        recipient.RoutingOrder = 1;
        recipient.Email ='anandsaraaf365@gmail.com';
        recipient.UserName = 'S' + ' ' + 'Anand';
            
        // This setting seems required or you see the error:
        // "The string '' is not a valid Boolean value. 
        // at System.Xml.XmlConvert.ToBoolean(String s)" 
        recipient.RequireIDLookup = false;      
      
        envelope.Recipients = new DocuSignAPI.ArrayOfRecipient();
        envelope.Recipients.Recipient = new DocuSignAPI.Recipient[1];
        envelope.Recipients.Recipient[0] = recipient;           
      /*  // Tab
        DocuSignAPI.Tab tab1 = new DocuSignAPI.Tab();
        tab1.Type_x = 'SignHere';
        tab1.RecipientID = 1;
        tab1.DocumentID = 1;
        tab1.AnchorTabItem = new DocuSignAPI.AnchorTab();
        tab1.AnchorTabItem.AnchorTabString = 'By:';

        
        DocuSignAPI.Tab tab2 = new DocuSignAPI.Tab();
        tab2.Type_x = 'DateSigned';
        tab2.RecipientID = 1;
        tab2.DocumentID = 1;
        tab2.AnchorTabItem = new DocuSignAPI.AnchorTab();
        tab2.AnchorTabItem.AnchorTabString = 'Date Signed:';
        
        envelope.Tabs = new DocuSignAPI.ArrayOfTab();
        envelope.Tabs.Tab = new DocuSignAPI.Tab[2];
        envelope.Tabs.Tab[0] = tab1;        
        envelope.Tabs.Tab[1] = tab2;        
         */
        System.debug('Calling the API');
        try {
            DocuSignAPI.EnvelopeStatus es 
            = dsApiSend.CreateAndSendEnvelope(envelope);
            envelopeId = es.EnvelopeID;
        } catch ( CalloutException e) {
            System.debug('Exception - ' + e );
            envelopeId = 'Exception - ' + e;
        }
      
    } 
}