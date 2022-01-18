public class DyanmicJson {
public class MyClass {
public Integer attr1;
public String attr2;
public Decimal attr3;
}
    
    public static void Test(){    
MyClass c = new MyClass();
//c.attr1=1;
//c.attr3=3.2;
//c.attr2='hello';

String s = JSON.serialize(c);
Map<String,Object> obj =  (Map<String,Object>) JSON.deserializeUntyped(s);
        obj.put('attr1',1);
        obj.put('attr2','Hello');
        obj.put('attr3',4);
system.debug(obj.keyset());
        for(string key:obj.keyset()){
            
    system.debug(obj.get(key)+'::kEY:::'+kEY);
        }
        }
}