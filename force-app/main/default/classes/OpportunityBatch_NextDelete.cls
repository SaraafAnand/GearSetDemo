/* Author:S.Anand
* Version:40.0
* Requirement:write a batch apex to delete all the opportunities which are going to be closed in the next month.
* CreatedDate:04/10/2017
*/
global class OpportunityBatch_NextDelete implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.Batchablecontext bc){
        // fetch all the records of opprotunites where the close date is going to be next month
        return Database.getQueryLocator('select id, closedate from Opportunity where CloseDate=NEXT_MONTH');
    }
    //Delete all the opportunities in the scope 
    global void execute(Database.BatchableContext bc,List<Opportunity> opportunites){
                 delete opportunites;        
    }
    global void finish(Database.BatchableContext bc){
        
    }
}