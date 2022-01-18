global class Task10_Oct4 implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
       return Database.getQueryLocator('select id,name,(select id,name from Opportunities) from Account where CreatedDate=LAST_N_DAYS:15');
    } 
    global void execute(Database.BatchableContext bc,List<Account> acc){
        List<Opportunity> opList=new List<Opportunity>();
        for(Account a:acc){
            if(a.Opportunities.size()>0)
                for(Opportunity c: a.Opportunities){
                    opList.add(c);
                }
        }
    delete opList;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}