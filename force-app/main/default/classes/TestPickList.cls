public class TestPickList {

@AuraEnabled
     public Static List<String> getPickListValues(){
          List<String> pickListValuesList= new List<String>();
        List<String> pickMap = new List<String> () ;
              List<String> pickMap1= new List<String>()  ;
        List<String> strList = new list<String>{'QLE_Type__c','Opportunity_Type__c'};
 Schema.DescribeFieldResult  fieldResult = Opportunity.QLE_Type__c.getDescribe();
            
                    List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
		 System.debug('Map===>'+pickMap);
                for( Schema.PicklistEntry pickListVal : ple){
           System.debug('puickMap===>'+pickMap);
                         pickListValuesList.add(String.valueOf(pickListVal.getValue()));
            }
		return pickListValuesList;
     } 
@AuraEnabled
     public Static List<String> getPickListValues1(){
          List<String> pickListValuesList1= new List<String>();
        List<String> pickMap = new List<String> () ;
              List<String> pickMap1= new List<String>()  ;
        List<String> strList = new list<String>{'QLE_Type__c','Opportunity_Type__c'};
 Schema.DescribeFieldResult  fieldResult = Opportunity.Opportunity_Type__c.getDescribe();
            
                    List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
		 System.debug('Map===>'+pickMap);
                for( Schema.PicklistEntry pickListVal : ple){
           System.debug('puickMap===>'+pickMap);
                         pickListValuesList1.add(String.valueOf(pickListVal.getValue()));
            }
		return pickListValuesList1;
     } 
         
    
}