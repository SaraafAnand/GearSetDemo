global class AccountBatch implements Database.Batchable<sObject>{
	
	public String query = 'Select id from Account' ;
	
	public Integer total = 0;
	
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}
 
   	global void execute(Database.BatchableContext BC, List<sObject> scope) {
		doCall();
		total += scope.size();
		//your magic ....
 
	}
	
	global void finish(Database.BatchableContext BC) {
 
		system.debug('Total record processed:' + total);
		
	}
    public void docall(){
        System.debug('Called');
    }
}