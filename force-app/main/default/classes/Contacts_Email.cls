public class Contacts_Email {
    public List<ConWrapper> wrapList {set;get;}
   // public List<contact> conList{set;get;}
  //  public Boolean flag {set;get;}
    public  Contacts_Email(ApexPages.StandardController controller){
        wrapList=new List<ConWrapper>();
    String  accId=ApexPages.currentPage().getParameters().get('id');
        contactSearch(accId);
    }
    public void contactSearch(String id){
 List<contact> conList=[select lastName, email from contact where accountid=:id];
        for(Contact c: conList){
           conWrapper cw=new conWrapper();
            cw.con=c;
            cw.flag=false;
            wrapList.add(cw);
        }
    }
    public void sendEmail(){
        List<String> to_Adresses=new List<String>();
        for(ConWrapper cw:wrapList){
            if(cw.flag==true && cw.con.Email !=Null){
              to_Adresses.add(cw.con.Email);  
            }
        }
         List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(to_Adresses);
        mail.setSubject('URGENT BUSINESS PROPOSAL');
       mail.plainTextBody = 'This is the message body.';
        mails.add(mail);
        Messaging.sendEmail(mails);
        Messaging.SendEmailResult[] results = Messaging.sendEmail(mails);
if (results[0].success) {
    System.debug('The email was sent successfully.');
} else {
    System.debug('The email failed to send: '
          + results[0].errors[0].message);
}
    }
    
    public class ConWrapper{
        public Contact  con {set;get;}
        public Boolean flag {set;get;}
    } 
}