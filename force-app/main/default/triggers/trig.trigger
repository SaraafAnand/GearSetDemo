trigger trig on Account (before insert) {

    for(account acc:trigger.new){
      //  String profileId=[select id,name from profile  where name='System Administrator'].Id;
        String username=[select id,name,profile.name from user where id=:UserInfo.getUserId()  LIMIT 1].profile.name;
        if(username !='System Administrator'){
      acc.rating='Hot';
        }
    }
}