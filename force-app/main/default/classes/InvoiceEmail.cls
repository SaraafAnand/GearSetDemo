/*Author:S.Anand
* Version:1.0
* Requirement:1.Create a custom button sendEmail on invoice detail page
              2.2.when we click on button , Email should be sent to the manager of the user who prepared Invoice record.
* CreatedDate:08/11/2017
*/ 
public class InvoiceEmail{
  
    public InvoiceEmail(ApexPages.StandardController controller){
}
 //below apex mail is called on click of emailbutton
    public  Void send(){
        User Email_manager=[select name,id,email from User where username='anandsaraaf@gmail.com'];
        EmailTemplate templateId = [Select id from EmailTemplate where name = 'LineEmail'];
List<Messaging.SingleEmailMessage> mails= new List<Messaging.SingleEmailMessage>();
Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
			mail.setTargetObjectId(Email_manager.id);       
            mail.setTemplateID(templateId.id);
        	mail.setSaveAsActivity(false);
            mails.add(mail);        
        Messaging.sendEmail(mails);
        System.debug('mailsent=====>>'+mails);
    }
}