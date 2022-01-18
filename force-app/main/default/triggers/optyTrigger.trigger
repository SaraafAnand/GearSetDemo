trigger optyTrigger on Opportunity (after update) {
    if(trigger.IsAfter && trigger.Isupdate){
        // Fetch the opportunity with opportunity Line Items in Map which  contains product code as 'GC1040','GC1020'  
        Map<id,opportunity> optyProd=new Map<id,opportunity>([select Id, (select product2Id from opportunityLineItems  where productCode In ('GC1040','GC1020'))from opportunity where Id in:trigger.oldMap.keyset()]);
        EmailTemplate et=[Select id from EmailTemplate where name = 'Sales: New Customer Email' limit 1];
        List<ID> updatedOpty=new List<Id>();       
        System.debug('optyprod=====>>>'+optyprod.keySet());
        for(Id key:trigger.oldMap.keyset()){
            // oldOpty is to fetch the opportunity record that has old version of values before updating
            Opportunity oldOpty=trigger.oldMap.get(key);
            // newOpty is to fetch the opportunity record that has new version of values after updating
            Opportunity newOpty=trigger.newMap.get(key);
            System.debug('aaa'+optyProd.get(key).opportunityLineitems);
            // conditions to check to check record update, stagename and opportunityLine items associated with the corresponding opportunity         
            if((oldOpty.StageName !=newopty.StageName) && newopty.StageName=='closed won' && (optyProd.get(key).opportunityLineitems.size()>0)){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
              // Send email to the owner of the record Id
                mail.setTargetObjectId(oldopty.OwnerId);
                mail.setTemplateId(et.Id);
                mail.setReplyTo('anandov@mail.com');
                mail.setSenderDisplayName('Anand');
               

                mail.setBccSender(false);
                mail.setSaveAsActivity(False);
                mail.setUseSignature(false);
                Messaging.SendEmailResult[] results=Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                if (results[0].success) 
                {
                    System.debug('The email was sent successfully.');
                } 
                else 
                {
                    System.debug('The email failed to send: ' + results[0].errors[0].message);
                }
            }
        }
        
    }
}