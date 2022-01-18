trigger Email_Approval on Faculty__c (after update) {

    List<ProcessInstance> submitted_Approval =[SELECT Id,TargetObjectid, Status,(select id,actor.name from Workitems),(SELECT Id, StepStatus, Comments,Actor.Name FROM Steps) FROM ProcessInstance where TargetObjectId in:Trigger.new];
  System.debug('Sub-App'+submitted_Approval);
}