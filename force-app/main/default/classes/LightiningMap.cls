public class LightiningMap {
@auraEnabled
    public Static Map<String,String> getMap(){
        Map<String,String> myMap=new Map<String,String>();
        myMap.put('key1', 'A');
        myMap.put('key2', 'B');
        myMap.put('key3', 'C');
    return myMap;
    }
}