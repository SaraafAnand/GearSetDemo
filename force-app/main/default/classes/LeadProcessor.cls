global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
     global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
        'select id, leadsource from lead'
        );
    }
     global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        for (Lead ld : scope) {
            ld.leadsource='Dreamforce';
        }
        update scope;
    }    
    global void finish(Database.BatchableContext bc){
     

}
 }