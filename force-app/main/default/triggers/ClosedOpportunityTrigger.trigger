trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    List<Task> taskList=new List<Task>();
    for(opportunity opty:trigger.new){
        if(opty.StageName=='Closed Won'){
            String userId = UserInfo.getUserId();

Task t = new Task();
t.OwnerId = userId;
t.Subject = 'Follow Up Test Task';
t.Status = 'Open';
t.Priority = 'Normal';
t.WhatId = opty.Id;
taskList.add(t);
        }
    }
insert taskList;
}