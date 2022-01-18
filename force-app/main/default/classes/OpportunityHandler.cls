/* Author:S.Anand
 * Version:40.0
 * Requirement:This class handles multiple Opportunity triggers in  form of methods
 * CreatedDate:04/10/2017
*/
public class OpportunityHandler {
    //  create a  new trigger on opportunity which will set the stage name is prospecting and close date is 15 days from today
    public static void opportunityStageDateUpdate(List<Opportunity> opportunityList){
        //Iterating trigger.new records and updating stageName,closeDate,type
        for(Opportunity updateOpportunity:opportunityList){
            updateOpportunity.stageName='prospecting';
            system.debug('updatedStageName===>'+updateOpportunity.stagename);
            updateOpportunity.closeDate=system.today()+15;
            system.debug('updatedStagename===>'+updateOpportunity.closeDate);
            updateOpportunity.Type='New customer';
            system.debug('updatedStagename===>'+updateOpportunity.closeDate);
        }
    }
    //whenever an opportunity name is modified , create a task to the owner of the record
    public static void opportunityTask(Map<Id,Opportunity> oldOpportunity_Map,Map<Id,Opportunity> newOpportunity_Map){
        List<Task> tasks=new List<Task>();
        /* from oldOpportunityMap getting the keys and iterating and checking if old record name is equal to new record name
            if not it creates a task*/
        for(Id ids:oldOpportunity_Map.keyset()){
            Opportunity oldOpportunity=oldOpportunity_Map.get(ids);
            Opportunity newOpportunity=newOpportunity_Map.get(ids);
            //compare old record name with new record name form the triggerMap
            if(oldOpportunity.Name!=newOpportunity.Name){
                // creating a task for the new updated record
                Task taskCreate = new Task();
                taskCreate.WhatId=newOpportunity.Id;
                taskCreate.Subject='Name modified';
                taskCreate.Priority='High';
                taskCreate.Status='Not Started';
                taskCreate.Description='New work';
                 tasks.add(taskCreate);
                system.debug('TaskDetails==>>>'+taskCreate);
            }
        }
        insert tasks;
    }
}