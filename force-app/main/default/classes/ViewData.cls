public class ViewData{
        @AuraEnabled public Id accountId{get;set;}
        @AuraEnabled public String accountName{get;set;}
        @AuraEnabled public List<picklistWrapper> siteList{get;set;}
        @AuraEnabled public List<timeValues> timeSlots{get;set;}
        
    public class timeValues{
        @AuraEnabled public Date scheduleDate{get;set;}
        @AuraEnabled public Integer lane{get;set;}
        @AuraEnabled public Integer duration {get;set;}
        @AuraEnabled public Time startTime{get;set;}
        @AuraEnabled public Time endTime{get;set;}  
    }
    public class picklistWrapper{
        @AuraEnabled public String label{get;set;}
        @AuraEnabled public String value{get;set;} 
    }
    public viewData(){
	//this.accountId = 'TESTACCID';
	this.accountName = 'TESTACCOUNTNAME';
	List<picklistWrapper> tlt = new List<picklistWrapper>();
	List<timeValues> pwl = new List<timeValues>();
	timeValues pw = new timeValues();
	pw.scheduleDate = System.today().addDays(4);
	pw.lane = 4;
	pw.duration = 40;
	pw.startTime =  Time.newInstance(18, 30, 2, 20) ;
	pw.endTIme =  Time.newInstance(19, 30, 2, 20)  ;
	pwl.add(pw);
	this.timeSlots = pwl;
	
	picklistWrapper tlw = new picklistWrapper();
	tlw.label = 'xyz';
	tlw.value = 'XYZ';
	tlt.add(tlw);
        this.siteList = tlt;
	}
	
}