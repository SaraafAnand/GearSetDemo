global class userDeact implements Database.Batchable<sObject>
{
global Set<Id> userIds;
global Id    activeUserId;
global userDeact(Set<Id> deactUsers ){
System.debug('deactUsersSize'+deactUsers);
this.userIds=deactUsers;
User u=[select id,email from user where username='anandov@gmail.com'];
activeUserId=u.Id;

}
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        System.debug('userIds'+userIds);
        String query = 'SELECT Id,LastName,ownerId FROM contact where ownerId in :userIds';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Contact> scope)
    {
    System.debug('Scope'+scope);
    List<contact> conList=new List<contact>();
        for ( Contact a : scope)
        {
           a.ownerId=activeUserId;
           conList.add(a);
        }
        // created one empty and one correct Account
        DataBase.SaveResult[] sr = Database.update(conList,false);
//iterate through each returned list
for(Database.saveResult srl:sr)
{
    if(srl.isSuccess())
    {
        system.debug('successfully updated contact. Id is :'+srl.getId());
    }
    else
    {
        for(DataBase.Error err:srl.getErrors())
        {
          system.debug('Following are the errors');
            system.debug(err.getStatusCode()+':'+err.getMessage());
            system.debug('following field affected'+err.getFields());
        }
    }
}  
    }  
    global void finish(Database.BatchableContext BC)
    {
    }
}