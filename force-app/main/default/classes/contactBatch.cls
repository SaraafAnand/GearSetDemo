global class contactBatch implements Database.Batchable<sObject> {
global Id memRTId;

global void contactBatch(){
 memRTId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Member').getRecordTypeId();

}

global Database.QueryLocator start(Database.BatchableContext BC) {

 String query = 'SELECT Id,Phone,OtherPhone FROM contact';

 return Database.getQueryLocator(query);
 }
 
 global void execute(Database.BatchableContext BC, List<contact> scope) {

 for(Contact a : scope)
 {
 a.otherphone = a.phone;
 a.phone='';
 } 
List<Database.SaveResult> updateResults = Database.update(scope, false);
for(Integer i=0;i<updateResults.size();i++){
if(!updateResults.get(i).isSuccess()){
        // DML operation failed
        Database.Error error = updateResults.get(i).getErrors().get(0);
        String failedDML = error.getMessage();
        scope.get(i);//failed record from the list
        system.debug('Failed ID'+scope.get(i).Id+'======'+failedDML);
     }
}
 } 
 
 global void finish(Database.BatchableContext BC) {
 

 }
}