public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer param1,String param2){
     List<Contact> lContactList = new List<Contact>();
        
        for(integer i=0; i<param1; i++)
        {
            Contact c = new Contact(LastName= param2, FirstName = param2 +i);
            lContactList.add(c);

        }    
        return lContactList;
    }
}