/* Author:S.Anand
* Version:40.0
* Requirement:This class handles multiple Contact triggers in  form of methods
* CreatedDate:04/10/2017
*/
public class ContactHandler {
 //whenever contact is deleted , delete the corresponding account records.   
    public static void ContactsAccount_Delete(List<contact> contactList){
        set<Id> IdList=new set<Id>();        
        for(Contact deleteContact :contactList){
            IdList.add(deleteContact.AccountId);
        }
        
        List<Account> accounts=[select id,name from account where id in:IdList];
        
        delete accounts;
    }
    // Whenever a new contact Inserted create a Event
    public static void ContactEvent(List<contact> contactList){
        user eventUser=[select id from user where username='wilsonov@gmail.com'];
        List<event> eventList =new List<event>();
        for(contact eventContact:contactList){
            Event eventCreate= new Event();
            eventCreate.OwnerId=eventUser.id;
            system.debug('EventOwnerId===>>>'+eventCreate.OwnerId);
            eventCreate.StartDateTime=system.today();
            eventCreate.EndDateTime=system.today()+10;
            eventCreate.Subject='Event Edited';
            eventList.add(eventCreate);
            System.debug('EventDetails===>>>'+eventCreate);
        }
        insert eventList;
    }
    
}