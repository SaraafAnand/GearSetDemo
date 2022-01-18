trigger OpportunityTrigger on Opportunity (before insert,after Update) {
    if(trigger.isBefore && trigger.isInsert){
        OpportunityHandler.opportunityStageDateUpdate(trigger.new);
    }
    if(trigger.isAfter && trigger.isUpdate){
        OpportunityHandler.opportunityTask(trigger.oldMap ,trigger.newMap);
    }
}