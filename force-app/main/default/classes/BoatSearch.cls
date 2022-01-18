public class BoatSearch {
    @AuraEnabled
    public Static List<BoatType__c> boatTypes(){
       List<BoatType__c> boatTypes=[select Name from BoatType__c ];
        System.debug('boatTypesSize'+boatTypes.size());
        return boatTypes;
    }
    public Static List<Boat__c> boats(String type){
        System.debug('type===>>'+type);
      // List<Id> boatTypeId=[select id from BoatType__c where name=:type];
    List<Boat__c> boatList=[select Name from Boat__c where BoatType__c=:type];
        System.debug('list===>>'+boatList);
       return boatList;
    }

}