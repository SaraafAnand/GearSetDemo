trigger ContactTrigger on Contact (After delete,After insert) {
    if(trigger.isAfter && trigger.isDelete){
ContactHandler.ContactsAccount_Delete(trigger.old);
    }
    if(trigger.isAfter && trigger.isInsert){
ContactHandler.ContactEvent(trigger.new);
    }
}