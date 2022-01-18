trigger RealTimeEvent on Case (after insert) {

   /*Message__e msg=new Message__e();
    msg.Discription__c='Your case was updated';
    msg.FromAddress__c='rampatnam7@gmail.com';
    EventBus.publish(msg);
    Message__e msg1=new Message__e();
    msg1.Discription__c='Your case was updated';
    msg1.FromAddress__c='rampatnam93@gmail.com';
    EventBus.publish(msg1);*/
    for(Case ev : trigger.new){
        List<Low_Ink__e> inkEvents = new List<Low_Ink__e>();
inkEvents.add(new Low_Ink__e(Printer_Model__c='XZO-5', Serial_Number__c='12345',
Ink_Percentage__c=0.2));
inkEvents.add(new Low_Ink__e(Printer_Model__c='MN-123', Serial_Number__c='10013',
Ink_Percentage__c=0.15));
        List<Database.SaveResult> results = EventBus.publish(inkEvents);
        for (Database.SaveResult sr : results) {
if (sr.isSuccess()) {
System.debug('Successfully published event.');
} else {
    for(Database.Error err : sr.getErrors()) {
System.debug('Error returned: ' +
err.getStatusCode() +
' - ' +
err.getMessage());
}
}
}
    }
    
    
    
}