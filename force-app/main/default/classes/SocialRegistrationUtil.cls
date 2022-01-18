public class SocialRegistrationUtil {
    public Static List<contact> validateContact(String email){
      List<contact> conList;
    System.debug('email==>'+email);
    try{
      conList = [SELECT Id, FirstName, LastName, Email, AccountId
      FROM Contact
      WHERE Email = :email 
      LIMIT 1];
    }
    catch(exception e){

    }
    System.debug('conList>>'+conList);
    if(!conList.isEmpty()){
      return conlist;
    } else {
      return null;
    }

  }

}