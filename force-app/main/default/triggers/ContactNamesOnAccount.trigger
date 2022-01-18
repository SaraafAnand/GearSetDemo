trigger ContactNamesOnAccount on Contact (after update, after insert) 
{    
   String names;
   Set<id> accIdList = new Set<id>();
   
   for(Contact con : Trigger.new)
   {
    accIdList.add(con.accountid);
   }

   List<Account> accUpdateList = new List<Account>();
   for(Account acc : [Select id, name, Contact_Names__c,(Select Id, name, lastname  From Contacts) From Account Where Id In : accIdList])
   {
       for(Contact con : acc.contacts)
       {
        if(con.lastname != null)
        {
            names = names + ', ' + con.lastname;
        }
        //acc.name=null;
        acc.Contact_Names__c = names;
    }    
     accUpdateList.add(acc);
   }    
   try{
   update accUpdateList;}
   catch(exception e){
   
   }
}