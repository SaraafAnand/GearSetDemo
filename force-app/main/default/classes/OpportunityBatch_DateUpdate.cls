/* Author:S.Anand
 * Version:40.0
 * Requirement:create a batch apex to update all the opportunities closed date as  15 days from today
 * CreatedDate:04/10/2017
*/
global class OpportunityBatch_DateUpdate implements Database.Batchable<sObject>  {
    // all the Opportunity records are queried below
    global Database.QueryLocator start(Database.Batchablecontext bc){
        String query ='select name,id,closedate from Opportunity';
        return Database.getQueryLocator(query);
    }
    // for all the Opportunities queried in the above step update the date
    global void execute(Database.BatchableContext bc , List<Opportunity> scope){
        List<Opportunity> opportunityList=new List<Opportunity>();
        //fetch each opportunity from the scope and update the date
        for(Opportunity opportunityUpdate:scope){
           opportunityUpdate.closeDate=system.today()+15;
            System.debug('CloseDate===>>>>'+opportunityUpdate.closeDate);
            opportunityList.add(opportunityUpdate) ;
        }
        update opportunityList;
    }
    global void finish(Database.BatchableContext bc){
        
    }

}