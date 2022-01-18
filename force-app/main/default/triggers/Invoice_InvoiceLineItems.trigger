trigger Invoice_InvoiceLineItems on InvoiceLineItems__c (before insert,after insert) {
    if(trigger.isAfter && trigger.isInsert){
        Invoice_InvoiceLineItems.afterInsert(trigger.new);
    }
}