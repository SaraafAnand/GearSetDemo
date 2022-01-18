trigger Rollup_Trigger on Opportunity (after insert,after Update,after Delete) {
    list<id> accid=new list<id>();
   //Take the contextvariables for after insert
    if(trigger.isAfter&&trigger.isInsert){
    for(opportunity op:trigger.new){
        accid.add(op.AccountId);
    }
        }
    // Take the contextvariable for after update
    if(trigger.isAfter&&trigger.isupdate){
    for(opportunity op1:Trigger.new){
        accid.add(op1.AccountId);
        }
    }
    //Take the context variables for after Delete
    if(trigger.isAfter&&trigger.isDelete){
        for(opportunity op2:Trigger.old){
        accid.add(op2.AccountId);
        }
        
    }
    //Fetch the Account alongwith opportunity fields and update the totalAmount 
    list<Account> accs=[Select id,Total_Pipeline__c,(Select id,Amount from opportunities)from Account where id in:accid];
       for(account a:accs){
           decimal sum=0;
           for(opportunity op3:a.opportunities){
               sum=sum+op3.Amount;
           }
           a.Total_Pipeline__c=sum;
       }
    update accs;
}