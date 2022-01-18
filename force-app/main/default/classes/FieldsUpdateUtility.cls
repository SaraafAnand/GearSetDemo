public class FieldsUpdateUtility {
    
    public static List<String> fetchUpdatedSobjectRecords(List<Sobject> newList,Map<Id,Sobject> oldMap,List<String> fieldsToValidate,Integer limitOfRec){
        List<String> listOfStrings = new List<String>();
        List<Sobject> listOfRec = new List<Sobject>();
        Map<Id,Sobject> mapOfObjects = new Map<Id,Sobject>();
        List<Id> oldKeys = new List<Id>(oldMap.keyset());
        List<Sobject> objValues = oldMap.values();
        for(Integer i=0;i<newList.size();i++){
        	Decimal modVal = math.mod(i,limitOfRec);
            listOfRec.add(newList[i]);
            mapOfObjects.put(oldKeys[i],objValues[i]);
            if(modVal == 0){
              	String jsString = fetchUpdatedRecords(listOfRec,mapOfObjects,fieldsToValidate);
                if(String.isNotBlank(jsString)){
                    listOfStrings.add(jsString);
               	}
                listOfRec.clear();
               	mapOfObjects.clear();
            }			  
        }
        return listOfStrings;
    }
    
    public Static String fetchUpdatedRecords(List<Sobject> newList,Map<Id,Sobject> oldMap,List<String> fieldsToValidate){
        Map<String,object> mapOfSobjects = new Map<String,object>();
        List<Sobject> recordList = new List<Sobject>();
        Map<Id,Sobject> sObjMap = new Map<Id,Sobject>();
        for(Sobject obj:newList){
            Sobject updatedRec;
            Sobject oldSobjectRec;
            Sobject oldRec = oldMap.get(String.ValueOf(obj.get('Id')));
            for(String fld:fieldsToValidate){
                System.debug('obj==>>'+JSON.serialize(obj));
                System.debug('obj fld Val :::'+obj.get(fld));
                System.debug('old Rec Val :::'+ oldRec.get(fld));
                if(obj.get(fld) != oldRec.get(fld)){
                    updatedRec.put(fld,obj.get(fld));
                    oldSobjectRec.put(fld,obj.get(fld));
                }
            }
            if(updatedRec <> null && oldSobjectRec <>null){  
                updatedRec.put('Id',obj.get('Id'));
                oldSobjectRec.put('Id',obj.get('Id'));
            	recordList.add(obj);
                sObjMap.put(String.ValueOf(obj.get('Id')),oldSobjectRec);
            }
        }
        if(!recordList.isEmpty() && !sObjMap.isEmpty()){
            mapOfSobjects.put('new List',recordList);
            mapOfSobjects.put('old Map',sObjMap);
        }
        return JSON.serialize(mapOfSobjects);
    }

}