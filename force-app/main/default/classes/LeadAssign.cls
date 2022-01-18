public class LeadAssign{
    public static void leadInsert(List<Lead> leads){
        //query all the users form user object
        List<user> userList=[select id,name,LeadCount__c from user where isActive=true];
        List<Id> userId=new List<Id>();
      //  List<Lead> leads=[select id,ownerid from lead];
        Map<Id,Decimal> leadMap=new Map<Id,Decimal>();
        system.debug('===>>>userListSize:'+userList.size());
        //for each user in the above list add each user id in the userId List
        for(user user1:userList){
      
            userId.add(user1.Id);
        }
        // Query the lead records with owner ids equals to list of user ids fetched from userList
        List<Lead>  leadList=[select id,name,ownerid from Lead where ownerid in:userId];
        system.debug('LeadListSize'+leadList.size());
        /* for user in the user List and for each lead record in lead List check if ownerid is equlas to userid if so
update the leaTdcount of that user */
        List<user> users=new List<user>();
        for(User user2:userList){
            if(user2.Name !='Automated Process'){
              system.debug('==>>>userName:'+user2.Name);
            for(Lead lead1:leadList){
                if(user2.id==lead1.ownerid){
                    System.debug('BeforeCount:===>>'+user2.LeadCount__c);
                    if(user2.LeadCount__c==Null ||user2.LeadCount__c==0){
                        user2.LeadCount__c=1;
                        System.debug('AfterCount:===>>'+user2.LeadCount__c);
                    }
                    else{
                    user2.LeadCount__c=user2.LeadCount__c+1;
                    System.debug('AfterCount:===>>'+user2.LeadCount__c);
                        }
                    
                }
                else{
                    user2.LeadCount__c=0;
                    System.debug('LeadCount'+user2.LeadCount__c);
                }
            
            }
            leadMap.put(user2.Id, user2.LeadCount__c);
            System.debug('MapSize'+leadMap.size());
            users.add(User2);
        }
            }
        update users;
        /*Now lead map contains id as keys and leadcount as values fetch all leadcount values and sort it to get smaller value
so as to assign record to user associated with that value */
        system.debug('xyz');
        List<Decimal> countValues=leadMap.values();
        System.debug('countValuesSize:'+countValues.size());
        countValues.sort();
        System.debug('count');
        Decimal minValue=countValues[0];
        system.debug('MinimumValue'+minValue);
        // Minimum value lies at 0 index in the above sorted list
       if(minValue==Null){
             minValue=0;
            }
       System.debug('Null Update Min'+minValue);
        List<Id> idList=new List<Id>();
        for(Lead lead2:leads){
            System.debug('oooo');
            for(Id key:leadMap.keySet()){
                if(leadMap.get(key)==minValue){
                   System.debug(leadMap.get(key)); 
                    lead2.ownerid=key;
                    system.debug('lead2.ownerid');
                    idList.add(lead2.ownerid);
                }
            }
        }      // Update the lead count of the user to whom reocrd is assigned
        system.debug('idListSize:====>>'+idList.size());
        user updateUser=[select id,LeadCount__c from user where id=:idList[0]];
        
        if(updateUser.LeadCount__c==Null){
            updateUser.LeadCount__c=1;
        }
        updateUser.LeadCount__c=updateUser.LeadCount__c+1;
        System.debug('Updated LeadCount'+updateUser.LeadCount__c);
        
     
       
    }
}