public class Account_Assigning {
//   @future
    public static void afterUpdate(List<user> users){
        user u=[Select id from user where username='wilsonov@gmail.com'];
        list<Account> acclist=new list<Account>();
        list<id>ids=new list<id>();
    //    list<user> users=[select id from user];
        for(user ur:users){
            if(ur.isActive==false){
                ids.add(u.id);
               System.debug('Deactive user ====>>>'+u.id);
                }
            }
         acclist=[Select id from Account where ownerid=:ids];
         System.debug('Accountlist'+acclist.size());
                for(Account a:acclist){
                    a.ownerid=u.id;
           System.debug(a.ownerid);
        }
         update acclist;
    }

}