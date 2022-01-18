/* Author:S.Anand
 * Version:40.0
 * Requirement:write SOQL query to display Account,Task,Opportunity,case,event records in VF pages
 * CreatedDate:03/10/2017
*/
public class AccountChildDisplay {
    public List<Account> accounts{set;get;}
     public List<Opportunity> OpportunityList{set;get;}
     public List<Task> Tasks{set;get;}
     public List<Case> CaseList{set;get;}
     public List<event> events{set;get;}
    public AccountChildDisplay(){
       // fetch all the accounts and their childs task,Opportuinites,events,cases using soql query 
      accounts=[select name,id,industry from account limit:3];
        System.debug(accounts.size());
     Tasks =[select id,status from task limit:3];
       OpportunityList=[select id,stagename,closedate from Opportunity limit:3]; 
       caseList=[select status,origin,id from case limit:3];
       events=[select id,subject,type from event limit:3];
    system.debug('===>>>'+accounts);
    }
    
}