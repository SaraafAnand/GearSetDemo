public class accountSearch {
   // @AuraEnabled 
   // public Static  Map <String, String> labelToAPIName {set;get;}
    @AuraEnabled
    
    public static Map<Id,String> getAccounts(){
        Map<string,schema.RecordTypeInfo> rtByName=Schema.Sobjecttype.Account.getRecordTypeInfosByName();
        //List<String> recordNames=string.valueOf(d)
        Map<Id,String> recMap=new Map<Id,String>();
        System.debug('AccountrecTypes====>>>'+rtByName);
        for(String s:rtByName.keyset()){
           Id devRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get(s).getRecordTypeId(); 
            recMap.put(devRecordTypeId,s);
        }
        return recMap;
        
    }
    public accountSearch(){
    }
    @AuraEnabled   
    public static List<Account> searchAcc(string param){
         Map <String, String> labelToAPIName = new Map <String, String> ();
labelToAPIName.put('RecordType','RecordTypeId');
labelToApIName.put('BillingCountry','BillingCountry');        
Map<String, Schema.SObjectField> fieldsMap = Schema.SObjectType.Account.fields.getMap();
for (Schema.SObjectField field : fieldsMap.values())
{
  // System.debug('label'+field.getDescribe().getLabel()+'*********Api**********'+field.getDescribe().getName());
    labelToAPIName.put(field.getDescribe().getLabel(), field.getDescribe().getName());
}

String APINAME = labelToAPIName.get('RecordTypeID');
        System.debug('APINAME'+APINAME);
        System.debug('param+++++++++'+param);
 
      //  Id devRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get(wc.RecordTypeId).getRecordTypeId();
        
        String query='select Name,AccountNo__c,BillingCountry,startDate__c,endDate__c,Description,Industry from Account Where ';
        Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(param);
        System.debug('Map*************'+m.keySet()+'====>>>>'+m.values());
      Integer i=0;
        for(String S:m.keySet()){
            if(i==0 && !(labelToAPIName.get(s)=='StartDate__c' ||labelToAPIName.get(s)=='EndDate__c')){
            query=query+labelToAPIName.get(s)+'=\''+m.get(s)+'\''; 
                i++;
                System.debug('query at IF I(0) AND  NO DATE@@@@@@@@@@@@'+query);
                }
            else if(i==0 && (labelToAPIName.get(s)=='StartDate__c' ||labelToAPIName.get(s)=='EndDate__c')){
                query=query+labelToAPIName.get(s)+'='+m.get(s); 
                i++;
                System.debug('query at ELSE IF I(0) AND DATE'+query);
            }
            else if(i>0 && !(labelToAPIName.get(s)=='StartDate__c' ||labelToAPIName.get(s)=='EndDate__c')){
			query=query+' AND '+labelToAPIName.get(s)+'=\''+m.get(s)+'\'';
                System.debug('query at ####### I>0 NO DATE'+query);
            }
            else{
               query=query+' AND '+labelToAPIName.get(s)+'='+m.get(s);
                System.debug('query at ELSE'+query); 
            }
            
        }
       System.debug('final Query'+query);
        List<Account> accList=Database.query(query);
    System.Debug('Accounts=============>>>'+accList );
            return  accList ;
        
    }
    public class wrapperClass{
        @AuraEnabled
        public String RecordType {set;get;}
        @AuraEnabled
        public String ParentAccountNo {set;get;}
        @AuraEnabled
        public String AccountNo {set;get;}
        @AuraEnabled
        public String BillingCountry {set;get;}
        @AuraEnabled
        public String StartDate {set;get;}
        @AuraEnabled
        public String EndDate {set;get;}
    }
}