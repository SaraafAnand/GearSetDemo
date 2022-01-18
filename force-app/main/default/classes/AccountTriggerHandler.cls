public class AccountTriggerHandler {
    public static void beforeUpdate(Map<Id,Account> oldMap,Map<Id,Account> newMap){
        List<Id> accIds=new List<Id>();
       
        for(Id key:oldMap.keySet()){
            Account old=oldMap.get(key);
            Account newAcc=newMap.get(key);
            if(old.phone!=newAcc.Phone){
                accIds.add(key);
            }
        }
        List<Contact> cons=[select id,accountId,homephone,otherphone from Contact where accountId in:accIds];
        for(Contact c:cons){
            Account a=newMap.get(c.accountId);
            Account b=oldMap.get(c.accountId);
            c.otherPhone=b.phone;
            c.homephone=a.phone;  
        }
        update cons;
    }
}