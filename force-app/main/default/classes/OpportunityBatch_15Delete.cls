/* Author:S.Anand
* Version:40.0
* Requirement:write a batch apex to delete all the opportunities which are going to be closed in the next month.
* CreatedDate:04/10/2017
*/
global class OpportunityBatch_15Delete implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.Batchablecontext bc){
        // fetch all the records of opprotunites where the close date is Last 15days
        return Database.getQueryLocator('select id, closedate from Opportunity where CreatedDate=LAST_N_DAYS:15');
    }
    //Delete all the opportunities in the scope 
    global void execute(Database.BatchableContext bc,List<Opportunity> opportunites){
                 delete opportunites;        
    }
    global void finish(Database.BatchableContext bc){
        
    }
}