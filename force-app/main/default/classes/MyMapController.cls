public class MyMapController {
  @AuraEnabled
 public static map<String,String> getMyMap(){
  // create map  
   Map<String,String> Mymap = new Map<String,String>();
  // put value in Map
    Mymap.put('key1','Apple');
    Mymap.put('key2','Mango');
   return Mymap;
  }
}