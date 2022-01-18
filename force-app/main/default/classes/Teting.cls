public class Teting {
    public Teting(){
         List<Account> acc=[select name,rating from account where name=:'Srikanth'];
      
            system.debug(acc[0].Name);
            system.debug(acc[0].Rating);
        
    }
}