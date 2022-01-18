trigger Leadtrigger on Lead (before insert) {
    LeadHandler.leadRating_Update(trigger.new);
}