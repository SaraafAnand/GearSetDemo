public class tstpopup {    
public Account ac{get{
Account a=[Select ID,Name from Account Limit 1];
return a;}
set;}
    public boolean displayPopup {get; set;}    
    public void closePopup() {       
        displayPopup = false;   
    }    
    public void showPopup() {       
        displayPopup = true;   
    }
     
  }