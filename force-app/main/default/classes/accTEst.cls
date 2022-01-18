@IsTest
public class accTEst {

    public Static testMethod void rate(){
        Profile p = [SELECT Id FROM Profile WHERE Name='Force.com - Free'];
      User u2 = new User(Alias = 'User123', Email='newuser123@testorg.com',
         EmailEncodingKey='UTF-8', LastName='Testing123', LanguageLocaleKey='en_US',
         LocaleSidKey='en_US', ProfileId = p.Id,
         TimeZoneSidKey='America/Los_Angeles', UserName='newuser12@testorg.com');
         System.runAs(u2) {
         account acc=new account();
             acc.Name='Anand';
             insert acc;
             String ac=[select id,rating from account where id=:acc.Id].rating;
             System.assertEquals('Hot',ac);
         }

    }
}