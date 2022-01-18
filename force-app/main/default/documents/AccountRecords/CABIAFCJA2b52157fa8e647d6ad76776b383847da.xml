trigger AccountEmailTrig on Account (before delete) {
    if(trigger.IsBefore && trigger.IsDelete){
        List<Id> ids= new List<Id>();
      List<Account> accDelList=[select id from Account where id in:trigger.old]; 
        for(Account a:accDelList){
            ids.add(a.Id);
        }
        AccountEmail ae=new AccountEmail(ids);
        Database.ExecuteBatch(ae);
    }
}