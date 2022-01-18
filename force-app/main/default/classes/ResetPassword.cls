public class ResetPassword {
    public string username{set;get;}
    public string newPassword{set;get;}
    public string reenterPassword{set;get;}
    public void save(){
      contact con=[select username__c,password__c,Resettted__c from contact where username__c=:username];
        if(con.password__c=='Reset'){
         System.debug('eee');
            if(newPassword==reenterPassword){
                     System.debug('rrrrr');
                con.Resettted__c=false;
                con.password__c=newPassword;
                update con;
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Password changed successfully'));
            }
            else{
                     System.debug('ccccccc');
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Passwords need to be matched'));
            }
        }
        else{
                 System.debug('qqqqqqqqqqq');
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'No permission to reset password'));
        }
    }
}