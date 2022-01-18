public class fileSharing {

    @AuraEnabled
    public Static List<ContentDocument> getFiles(){
        List<ContentDocument> contentDocList = new List<ContentDocument>();
        List<User> currentUser = [Select Id,contact.AccountId,ContactId From User Where Id =:userInfo.getUserId()];
        Set<Id> contentDocIds = new Set<Id>();
        for(ContentDocumentLink conDocLink : [SELECT ContentDocumentId, LinkedEntityId  FROM ContentDocumentLink  where LinkedEntityId ='0017F00001wlSViQAM' and LinkedEntity.Type='Account'
                                          AND ContentDocumentId IN(SELECT ContentDocumentId FROM ContentVersion WHERE isVisible__c = true)]){
        		contentDocIds.add(conDocLink.ContentDocumentId);                                          
           }
        for(ContentDocument conDoc :[SELECT Description,FileExtension,FileType,Id,ParentId,Title FROM ContentDocument WHERE Id IN:contentDocIds ]){
          	
            contentDocList.add(conDoc);  
        }
        System.debug('contentDocList:::'+contentDocList);
     return contentDocList;   
    }
}