public class Naresh {
@AuraEnabled
    public Static Account getAcc(Id accId){
        System.debug('accId'+accId);
      Account acc=[select id,Name,Industry from Account where id=:accId];
        System.debug('Acc=='+acc);
        return acc;
    }

}