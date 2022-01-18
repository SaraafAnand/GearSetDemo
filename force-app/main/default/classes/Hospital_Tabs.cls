public class Hospital_Tabs {
    private String selectedTab;
    Public  Patient__c   patient{set;get;}
    Public  prescription__c   prescription{set;get;}
    Public  Revisit__c   Revisit{set;get;}
    public String patientName {set;get;}
    public String caseType {set;get;}
    public String drug {set;get;}
    public String dose {set;get;}
    public String appointment {set;get;}
    public Hospital_Tabs(){
        selectedtab='Patient';
    }
    public Boolean getdisabledTab1(){
        return selectedTab !='Patient';
    }
    public Boolean getdisabledTab2(){
      return selectedTab != 'prescription';
    }
    public Boolean getdisabledTab3(){
      return selectedTab !='Revisit';
    }
    public void enableTab1(){
        selectedTab='Patient';
    }
    
    public void enableTab2(){
        selectedTab='Prescription';
    }
    
    public void enableTab3(){
        selectedTab='Revisit';
    }
    public String getselectedTab(){
        return selectedTab;
    }
    public PageReference save(){
        patient=new Patient__c();
        patient.name=patientName;
        patient.caseType__c=caseType;
        insert patient;
        prescription=new prescription__c();
        prescription.Name='xyz';
        prescription.Dose__c=Dose;
        prescription.patient__c=patient.Id;
        insert prescription;
        revisit=new Revisit__c();
        revisit.name='pqr';
        revisit.patient__c=patient.Id;
        insert revisit;
        pagereference pr = new pagereference('/' + patient.id);
        return pr;
    }
}