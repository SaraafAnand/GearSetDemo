/* Author:S.Anand
* Version:40.0
* Requirement:contains multiple triggers in form of methods
* CreatedDate:30/10/2017
*/


public class Invoice_InvoiceLineItems {
    // when ever new Invoice line item is created change ownership to invoice owner
    public static void afterInsert(List<InvoiceLineItems__c> invoiceItemsList){
        //Query the invoice id from invoiceLineitems
        invoiceItemsList=[select id,ownerid,Invoice__r.ownerid from InvoiceLIneItems__c];
        List<InvoiceLineItems__c> invoiceList = new List<InvoiceLineItems__c>();
        // change the owner id to invoice ownerid
        for(InvoiceLineItems__c lineItems:invoiceItemsList){
            system.debug('beforeId'+lineItems.OwnerId);
            lineItems.OwnerId=lineItems.Invoice__r.ownerid;
            system.debug('afterId'+lineItems.OwnerId);
            invoiceList.add(LineItems);
        } 
    update invoiceList;
    }
    
}