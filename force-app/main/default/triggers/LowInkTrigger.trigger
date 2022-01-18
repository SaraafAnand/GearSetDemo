trigger LowInkTrigger on Low_Ink__e (after insert) {
    // List to hold all cases to be created.

    
    // Get queue Id for case owner
  //  Group queue = [SELECT Id FROM Group WHERE Name=' Low_Ink__e' LIMIT 1];
       
    // Iterate through each notification.
    for (Low_Ink__e event : Trigger.New) {
       
      Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
// Set recipients to two contact IDs.
// Replace IDs with valid record IDs in your org.
message.toAddresses = new String[] { 'anandov@gmail.com' };

message.subject = event.Serial_Number__c;
message.plainTextBody = event.Serial_Number__c;
Messaging.SingleEmailMessage[] messages = 
    new List<Messaging.SingleEmailMessage> {message};
         Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
if (results[0].success) {
    System.debug('The email was sent successfully.'+ results);
} else {
    System.debug('The email failed to send: '
          + results[0].errors[0].message);
}
        
   }
    
    // Insert all cases corresponding to events received.
  

}