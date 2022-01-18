trigger EmailCaseAssaignment on Case (Before insert) {
{
    if(trigger.isBefore){
        if(trigger.isInsert){
             list<id> CaseAccountIds=new list<id>();
            for(case c:trigger.new)
        {
            CaseAccountIds.add(c.AccountId);
             system.debug('AccountId'+c.AccountId);
        }
   Map<id,Account> accMap=new Map<id,Account>([select id,
                           (select id,stagename,name from opportunities where stagename='closed won' order by lastmodifieddate desc limit 1),
                                (select id,AccountId from cases ) from Account where id in :CaseAccountIds ])  ;       
             System.debug('accountMap'+accMap); 
            for(case c:trigger.new){
                if(c.origin=='email'&& c.status=='new'){
                 C.Opportunity__c =accMap.get(c.AccountId).opportunities[0].Id;
                    System.debug('Done');
                }
            }
}
}
}
}