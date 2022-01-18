public class pickList_Lightning {
@AuraEnabled
    public Static List<String> getselectOptions(sObject obj,String field){
        System.debug('object====>>'+obj);
        System.debug('field====>>'+field);
        List<String> options = new List<String>(); //new list for holding all of the picklist options
     
      Schema.sObjectType sobject_type = obj.getSObjectType(); //grab the sobject that was passed
      Schema.DescribeSObjectResult sobject_describe = sobject_type.getDescribe(); //describe the sobject
      Map<String, Schema.SObjectField> field_map = sobject_describe.fields.getMap(); //get a map of fields for the passed sobject
      List<Schema.PicklistEntry> pick_list_values = field_map.get(field).getDescribe().getPickListValues(); //grab the list of picklist values for the passed field on the sobject
      for (Schema.PicklistEntry a : pick_list_values) { //for all values in the picklist list
                  
            options.add(a.getValue()); //add the value and label to our final list
      }
        System.debug('options====>>>'+options);
      return options; //return the List
}
}