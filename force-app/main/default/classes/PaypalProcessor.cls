/* * Author : S.Anand
   * CreatedDate : 12/11/2017
   * Version :1.0
   * Requirement: Implement Payment GateWay using Salesforce
*/
public class PaypalProcessor {
    /*
     *  The entry point of the processor, call from page controller, or schedule from trigger with @future annotation
     */
    public Boolean processNewPayments() { 
        List<Paypal__c> paymentBatch = [SELECT Id, Name, email__c, amount__c,
                                            CurrencyIsoCode__c, date__c
                                            FROM Paypal__c
                                            WHERE status__c = 'unpaid' LIMIT 250];
  
        Boolean success = processSOAPPayments(paymentBatch);
        
        return success;
    }

    /* 
     * This function collects a HTTPRequest object and sends it to PayPal
	 * It then interprets the response, updates the payments as appropriate and returns success boolean.
	 *
	 * Param: A list of custom payment records as provided by processNewPayments
	 * Returns: A boolean, whose value is dependant on the response from PayPal
     */
    public static Boolean processSOAPPayments(List<Paypal__c> paymentBatch) {
    
        String result;
        String error = '';
   
        Http http = new Http();
    
        HttpResponse response;
  
        try {
            // If this method is called in a testing context, then respond with a sample output.
            // This is necessary as http requests cannot be sent from test methods.
            if(Test.isRunningTest()) {
                // If a test is being run, get the response from the page parameters
                response = new HttpResponse();
                response.setBody(ApexPages.currentPage().getParameters().get('SOAPResponse'));
            } else {
                HttpRequest req = generateRequest(paymentBatch);
                response        = http.send(req);
            }
            
            // Digest the response:
            String rawResponse = response.getBody();
            
            XmlStreamReader reader = response.getXmlStreamReader();
            
			// Navigate through the response
            while(reader.hasNext())
            {
                if (reader.getEventType() == XmlTag.START_ELEMENT)
                {
                    // Find the ACK element
                    if (reader.getLocalName() == 'Ack')
                    {
                        reader.next();
                        if (reader.getEventType() == XmlTag.characters)
                        {
                            result = reader.getText();
                        }
                    }
                    // Find any error messages
                    if (reader.getLocalName() == 'LongMessage')
                    {
                        reader.next();
                        if (reader.getEventType() == XmlTag.characters)
                        {
                            error = reader.getText();
                        }
                    }
                }
                reader.next();
            }

            // If the result is success, mark the payments as 'Sent' and log the time against them.
            if (result.equals('Success'))
            {  
                Datetime paidTime = Datetime.now();
          
                for (Paypal__c payment: paymentBatch)
                {
                    payment.date__c  = paidTime;
                    payment.status__c        = 'sent';
                }
              
                update paymentBatch;
        
                return true;
            } else {
                // If the result ISN'T success, sort out a useful message
                system.debug('Failed for ' + error);
            }
        } catch (Calloutexception e) {
            system.debug(e.getMessage());
        }
    
		// If we did not return "True" above, the process must have failed
        return false;
    }
    
	/*
	 * This function generates the HttpRequest object, and requires your PayPal API credentials to do so.
	 * Params: The list of custom payment records to process
	 * Returns: A fully populated HttpRequest object
	 */
    public static HttpRequest generateRequest(List<Paypal__c> paymentBatch) {
    
        // Set the PayPal credentials from your PayPal account API settings page
        String purl = 'sandbox.paypal.com';
        String user = 'a9397981943-facilitator_api1.gmail.com';
        String pass = 'D5SWAG95PXGZUS4X';
        String sign = 'AcefQ6UBaP4MKFRbTfIGiMQqAxpgA1PoTjhnKlLxrPAYF2OPstrc6s28';
        
        HttpRequest req = new HttpRequest();
  
        // SOAP API URL
        String url = 'https://api-3t.' + purl + '/2.0';
  
		// Have the XML message generated
        String soapRequestBody = generateMsgBody(paymentBatch, user, pass, sign);
  
        // Set the headers
        req.setEndpoint(url);
        req.setMethod('POST');
        req.setHeader('Content-length', soapRequestBody.length().format());
        req.setHeader('Content-Type', 'text/xml;charset=UTF-8'); 
        req.setBody(soapRequestBody);  
        req.setHeader('Host','api-aa.' + purl);
        // Increase the timeout header to the max
        req.setTimeout(60000);
  
        return req;
    }
  
    /*
     * This function builds the actual XML body string for the HTTP request.
	 * Params: The list of payment records to insert.
	 *		   The PayPal API username, password and signiture
	 * Returns: An XML formatted string
     */
    public static String generateMsgBody(List<Paypal__c> paymentBatch, String user, String pass, String sign)
    {
        // Build the request string. There are java/php/asp APIs for this, but in Apex, I have done it by hand.
        String soapRequestBody;
        soapRequestBody  = '<soap:Envelope xmlns:soap=\'http://schemas.xmlsoap.org/soap/envelope/\' xmlns:xsi=\'http://www.w3.org/2001/XMLSchema-instance\' xmlns:xsd=\'http://www.w3.org/2001/XMLSchema\'>';
        soapRequestBody += '<soap:Header><RequesterCredentials xmlns="urn:ebay:api:PayPalAPI"><Credentials xmlns="urn:ebay:apis:eBLBaseComponents">';
        soapRequestBody += '<Username>' + user + '</Username><ebl:Password xmlns:ebl="urn:ebay:apis:eBLBaseComponents">' + pass + '</ebl:Password><Signature>' + sign + '</Signature>';
        soapRequestBody += '</Credentials></RequesterCredentials></soap:Header>';
        soapRequestBody += '<soap:Body>';
        soapRequestBody += '<MassPayReq xmlns="urn:ebay:api:PayPalAPI">';
        soapRequestBody += '<MassPayRequest xmlns="urn:ebay:apis:eBLBaseComponents">';
        soapRequestBody += '<Version xmlns="urn:ebay:apis:eBLBaseComponents">84.00</Version>';
        soapRequestBody += '<EmailSubject xsi:type="xs:string">Payment from Greenlight</EmailSubject>';
        soapRequestBody += '<ReceiverType recieverinfocode="EmailAddress"/>';
		// Iterate through the payment record list and insert their details.
        for(Paypal__c paymentObj: paymentBatch)
        {
            soapRequestBody += '<MassPayItem xsi:type="ebl:MassPayItemType">';
            soapRequestBody += '<ReceiverEmail>' + paymentObj.email__c + '</ReceiverEmail>';
            soapRequestBody += '<Amount currencyID="' + paymentObj.CurrencyIsoCode__c + '">' + paymentObj.amount__c + '</Amount>';
            soapRequestBody += '<UniqueId>' + paymentObj.Id + '</UniqueId>';
            soapRequestBody += '<Note>Payment Ref: ' + paymentObj.Name + '</Note>';
            soapRequestBody += '</MassPayItem>';

        }
        soapRequestBody += '</MassPayRequest></MassPayReq>';
        soapRequestBody += '</soap:Body></soap:Envelope>';
        
        return soapRequestBody;
    }
}