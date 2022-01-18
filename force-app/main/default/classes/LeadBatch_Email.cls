/* Author:S.Anand
 * Version:40.0
 * Requirement:Write a batch apex to fetch all the leads and update their lead source as email
 * CreatedDate:04/10/2017
*/

global class LeadBatch_Email implements Database.Batchable<sObject> {
    //get all the records from the lead object
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select id,Leadsource from lead');
    }
    global void execute(Database.BatchableContext bc , List<lead> Scope){
        List<Lead> LeadList=new List<Lead>();
        // for each lead in queried in the above step update their leadsource as email
        for(Lead updateLead:Scope){
          updateLead.LeadSource='Email';
            system.debug('===>>>>LeadSource'+updateLead.LeadSource);
            LeadList.add(updateLead);
        }
        update LeadList;
    }
    global void finish(DataBase.BatchableContext bc){
        
    }
}