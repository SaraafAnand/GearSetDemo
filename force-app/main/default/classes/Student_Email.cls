/* Author:S.Anand
* Version:40.0
* Requirement:This class handles multiple student triggers in  form of methods
* CreatedDate:04/10/2017
*/

public class Student_Email {
    // Send email to the student if phone number is modified
    public static void afterUpdate_Email(Map<id,Student__c> oldMap,Map<id,Student__c> newMap){
        //Iterate the keys of oldMap to compare old and new phoneNumbers
        for(Id updatedStudentId:oldMap.keySet()){
            Student__c studentOld=oldMap.get(updatedStudentId);
            system.debug('OldStudent__c===>>'+studentOld);
            Student__c studentNew=newMap.get(updatedStudentId);
            system.debug('newStudent__c===>>'+studentNew);
       List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
            // Condition to check whether old phone number is equal to new phone number
            if(studentOld.phoneNumber__c !=studentNew.phoneNumber__c){
                system.debug('oldStudent__cNumber===>>'+studentOld.phoneNumber__c);
                system.debug('oldStudent__cNumber===>>'+studentNew.phoneNumber__c);
                // Sending email 
	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                List<String> toSend=new List<String>();
                toSend.add(studentNew.Email__c);
                mail.setToAddresses(toSend);
                mail.setPlainTextBody('your account number modified from'+studentOld.phoneNumber__c+'to'+studentNew.phoneNumber__c);
				mail.setReplyTo('anandov@gmail.com');
                mail.setSubject('Account phone number Modified');
                allmsg.add(mail);
  
            }
            Messaging.sendEmail(allmsg);
                   system.debug('Email===>>>'+allmsg);
        }
    }
    public static void deleteEmail(List<student__c> studentsList){
        List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
        for(student__c toDeleteStudent:studentsList){
            // Sending email 
	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                List<String> toSend=new List<String>();
                toSend.add(toDeleteStudent.Email__c);
                mail.setToAddresses(toSend);
                mail.setPlainTextBody('your registration with us has beeen removed');
				mail.setReplyTo('anandov@gmail.com');
                mail.setSubject('Student Account Deleted successfully');
                allmsg.add(mail);
  
        }
           Messaging.sendEmail(allmsg);
                   system.debug('Email===>>>'+allmsg);
    }
}