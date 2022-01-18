/*
 * @Author :Aditya Parashar
 * Version :1.0
 * Created Date:12/02/2018	
 * Requirement :create a vf page to insert account record in database .After saving record it should redirect to your 
                custom VF Page which displays info like your account is inserted successfully.      
 */
public class Acc_record_VF_3 {
    Public Account a			{set;get;}
    public String name	  		{set;get;}
    public string phone			{set;get;}
    public String rating		{set;get;}
    public String industry		{set;get;}
    public Acc_record_VF_3(){
        a = new Account();
    }
    public PageReference save(){
        try{
            a.name=name;
            a.Phone=phone;
            a.Rating=rating;
            a.Industry=industry;
            insert a;
            
            ApexPages.Message msg = new ApexPages.Message(Apexpages.Severity.INFO,'Record saved Succefully');
            ApexPages.addMessage(msg);
              
        } catch(exception e){
            ApexPages.Message msg1 = new ApexPages.Message(Apexpages.Severity.ERROR,'Record Not saved');  
            ApexPages.addMessage(msg1);
        }a=null;
        return null;
    }
    public PageReference cancel(){
        PageReference p = new PageReference('/001/o');
        return p;
    }

}