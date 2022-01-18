public class ClassController {
    @Auraenabled public String developerName {set;get;}
    @Auraenabled public Integer developerAge {set;get;}
    @Auraenabled public List<Account> developerAccounts {set;get;}
    @Auraenabled
    public static classController callme(){
       ClassController clCont=new ClassController();
    clCont.developerName='Sanjay';
    clCont.developerAge= 6;
    clCont.developerAccounts=[select name from Account Limit 5];
        return clCont;
    }
}