trigger Accounttrigger on Account (before insert,after update,after insert) {
  /*  if(trigger.isBefore && trigger.isInsert){
        AccountHandler.accountOwnership_update(trigger.new);
    }*/
    if(trigger.isAfter && trigger.isUpdate){
        System.debug('In Update');
       // AccountHandler.accountEmail(trigger.oldmap,trigger.newmap);
       	List<String> strList = FieldsUpdateUtility.fetchUpdatedSobjectRecords(trigger.new,trigger.oldMap,new List<String>{'Name','Rating'},50);
    	//System.debug('In Update====><>>'+strList);
    } 
   /* 
    if(trigger.isAfter && trigger.isInsert){
        AccountHandler.accountApproval(trigger.new);
    }
    if(trigger.isAfter && trigger.isUpdate){
        AccountHandler.accountPhone_Update(trigger.oldMap,trigger.newMap);
    } 
    if(trigger.isAfter && trigger.isInsert){
        AccountHandler.accountInsert_Contact(trigger.new);
    } 
     /*if(trigger.isAfter && trigger.isUpdate){
        AccountHandler.accountShare_Update(trigger.new);
    } */
    
    if(trigger.isAfter && trigger.isInsert){
       
     System.debug('acc0000');
        for(Account acc: [SELECt Id FROM ACCOUNT WHERE Id in : trigger.newMap.keySet()]){
           System.debug('acc1111');
            acc.IsPartner = true;
            update acc;
            System.debug('acc'+acc);
        }
    }
}