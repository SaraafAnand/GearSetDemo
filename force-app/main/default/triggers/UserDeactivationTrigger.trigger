trigger UserDeactivationTrigger on User (before insert,after update) {
if(trigger.isAfter && trigger.isUpdate){
        UserDeactivation.User_afterUpdate();
  } 
}