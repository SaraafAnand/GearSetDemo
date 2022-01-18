global class RentUpdateBatch implements Database.Batchable<sObject>,Database.Stateful {
    global Map<Id, String> errorMap {get; set;}
    global Map<Id, SObject> IdToSObjectMap {get; set;}
    global String myDt {get;set;}
    global RentUpdateBatch(){
        errorMap = new Map<Id, String>();
        IdToSObjectMap = new Map<Id, SObject>();
        Date d = System.today();
	Datetime myDt = datetime.newInstance(d.year(), d.month(),d.day());
	String myDate = myDT.format('yyyy-MM-dd');
 	System.debug('Date=========='+myDate);
    }
   global Database.QueryLocator start(Database.BatchableContext BC) 
    {
        String query = 'SELECT Id,Name,	CurrentDate__c,Current_Rent__c,proposal_Date__c,proposal_Rent__c FROM Student__c Where ';
        query=query+'proposal_Date__c='+myDt ;
        System.debug('query+++++++++++'+query);
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Student__c> scope) 
    {
        List<Student__c> stList=new List<Student__c>();
      //  List<Students__c> failedLst=new List<Student__c>();
        for(Student__c st : scope)
        {
            st.CurrentDate__c=Date.parse(myDt);
            st.Current_Rent__c=String.valueof(st.proposal_Rent__c);
            st.proposal_Date__c=Date.parse(myDt).addYears(1);
           // st.proposal_Rent__c=st.Current_Rent__c+3000;
            stList.add(st);
        }
         if(stList.size() > 0) {
            List<Database.SaveResult> dsrs = Database.Update(stList, false);
            Integer index = 0;
            for(Database.SaveResult dsr : dsrs){
                if(!dsr.isSuccess()){
                    String errMsg = dsr.getErrors()[0].getMessage();
                    errorMap.put(stList[index].Id, errMsg);
                    IdToSObjectMap.put(stList[index].Id, stList[index]);
                }
                index++;
            }
        }
   
       

       
    }
    global void finish(Database.BatchableContext BC)
   {
   }
}