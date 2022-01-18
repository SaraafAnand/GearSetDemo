/* * Author : S.Anand
   * CreatedDate : 12/11/2017
   * Version :1.0
   * Requirement: Implement Payment GateWay using Salesforce
*/

public class approvedPaypalController {

    public approvedPaypalController() {
        payPalApproved();
    }

    public List<Paypal__c> paypalApprovedList { get; set; }

    public void payPalApproved() {
        paypalApprovedList = new List<Paypal__c>();
        paypalApprovedList = [SELECT id, email__c,amount__c, status__c FROM Paypal__c LIMIT 250 FOR UPDATE];
    }
    
    public void pay() {
        // This is the killer method call:
        if(makePayment())
        {
            for(Paypal__c pp: paypalApprovedList)
            {
                if(pp.status__c == 'Unpaid') {
                    pp.status__c = 'Sent';
                }
            }
            update(paypalApprovedList);
        }  
    }
    
    public boolean makePayment() {
        PaypalProcessor p = new PaypalProcessor();
        boolean payResult;
        if(Test.isRunningTest())
        {
            payResult= true;    
        }
        else
        {
            payResult = p.processNewPayments();
        }
        if(payResult)
        {
            apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Success'));
            return true;
        }
        else
        {
            apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Failure'));
            return false;
        }
    }

}