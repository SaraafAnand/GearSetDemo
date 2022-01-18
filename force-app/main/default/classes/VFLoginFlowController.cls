public class VFLoginFlowController {
    public boolean flag {set;get;}
    
     public Id getUserId(){
        return userInfo.getUserId();
    }
    public PageReference FinishLoginFlowStartUrl() {
     User u = [SELECT Id , Terms_Conditions_Last_Accepted__c FROM user WHERE Id=:userInfo.getUserId()];
        //do stuff
        System.debug('user==>>'+u);
        if(flag && u.Terms_Conditions_Last_Accepted__c == null){
        System.debug('update Condition');
      u.Terms_Conditions_Last_Accepted__c = System.now();
        update u;
        }
        else if(flag == false ){
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL,'Authorization needed');
    ApexPages.addMessage(myMsg);
        }
        //finish the login flow and send you to the startUrl (account page in this case)
        return Auth.SessionManagement.finishLoginFlow();
    }


    public PageReference FinishLoginFlowHome() {
        //do stuff
        
        //finish the login flow and send you the default homepage
        return Auth.SessionManagement.finishLoginFlow();
    }
}