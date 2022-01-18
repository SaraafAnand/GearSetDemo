public without sharing class UserTriggerHandler {
  
  public static void afterUpdate(Map<Id,user>oldUserMap,Map<Id,user>newUserMap){
    //Creating list of deactivated user names    
    Set<Id> deactivatedUsers = new Set<Id>();
    for(User newUser : newUserMap.values()){
      User oldUser = (User)Trigger.oldMap.get(newUser.Id);
      if((!newUser.isActive) && oldUser.isActive){
        deactivatedUsers.add(newUser.Id);        
      }
    }
    Set<Id> inactiveIds=UserTriggerHandler.Inactiveusers();
    deactivatedUsers.addAll(inactiveIds);
    System.debug('Deact'+deactivatedUsers);
    if(deactivatedUsers.size() > 0){
     System.debug('Deact'+deactivatedUsers);
        UserDeact  ud=new UserDeact(deactivatedUsers);
      Database.executeBatch(ud);

    }  
  }
  public  static set<Id> Inactiveusers(){
    Set<Id> inactiveIds=new Set<Id>();
    Set<Id> idsToUpdate=new Set<Id>();
    for(User u:[select id from user where isActive=False]){
    inactiveIds.add(u.Id);
    System.debug('InactiveId'+u.Id);
    }
    for(Contact con:[select id,ownerId from contact where ownerId in :inactiveIds]){

    idsToUpdate.add(con.ownerId);
    }
    return idsToUpdate;
    }
  
}