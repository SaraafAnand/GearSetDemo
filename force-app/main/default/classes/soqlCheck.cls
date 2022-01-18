public class soqlCheck {

    public static void checkme(String name){
        try{
        Account acc=[select id from account where name=:name];
            
        }
        catch (exception e){
            
        }
    }
}