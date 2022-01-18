trigger LeadAssignTrigger on Lead (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        LeadAssign.leadInsert(trigger.new);
    }

}