/* Author:S.Anand
* Version:40.0
* Requirement:write a batch apex to delete all the opportunities which are going to be closed in the Last month.
* CreatedDate:04/10/2017
*/
global class OpportunityBatch_assign implements Database.Batchable<sObject> {
  // query all opportunites form the opportunity object
    global Database.QueryLocator start(Database.BatchableContext bc){
        
       return Database.getQueryLocator('select ownerid,id from Opportunity');
    }
    // assign each opportunity from opportunities to wilson
    global void execute(Database.BatchableContext bc,List<Opportunity> opportunities){
       user newUser=[select id from user where alias=:'wils']; 
        List<Opportunity> opportunityList=new List<Opportunity>();
        for(Opportunity newOpportunity:opportunities){
            newOpportunity.ownerid=newUser.id;
            opportunityList.add(newOpportunity);
        }
        update opportunityList;
       }
       global void finish(Database.BatchableContext bc){
           
       }                                                                
}