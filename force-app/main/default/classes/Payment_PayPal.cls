/* * Author : S.Anand
   * CreatedDate : 12/11/2017
   * Version :1.0
   * Requirement: Implement Payment GateWay using Salesforce
*/
public class Payment_PayPal {
    public String xml {set;get;}
    public String result {set;get;}
    public Payment_PayPal(){
        paymentRequest();
    }
    public void paymentRequest(){
        Http httpObject = new Http();
HttpRequest req = new HttpRequest();
String url = 'https://api-3t.sandbox.paypal.com/2.0/';
string un = 'a9397981943-facilitator_api1.gmail.com';
string pw = 'D5SWAG95PXGZUS4X';
string sig = 'AcefQ6UBaP4MKFRbTfIGiMQqAxpgA1PoTjhnKlLxrPAYF2OPstrc6s28';
string soapXML='Here soapXMl is the request String in XML format';
req.setBody(soapXML);
req.setEndpoint(url);
req.setMethod('POST');
req.setHeader('Content-length', '1753' );
req.setHeader('Content-Type', 'text/xml;charset=UTF-8'); 
req.setHeader('SOAPAction','');
HttpResponse res = httpObject.send(req);
xml = res.getBody();
        System.debug('xmlString'+xml);
XmlStreamReader reader = res.getXmlStreamReader();
//result = readXMLResponse(reader,'Ack');
        
    }   
}