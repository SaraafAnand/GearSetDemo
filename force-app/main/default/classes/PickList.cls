public class PickList {
    Public List<selectOption> startMonth {Set;get;}
    Public List<selectOption> startYear {Set;get;}
    Public List<selectOption> endMonth {Set;get;}
    Public List<selectOption> endYear {Set;get;}
    Public Opportunity op{set;get;}
    Public List<Account> accounts{set;get;}
    Public String selectedMonth1 {set;get;}
    Public String selectedMonth2 {set;get;}
    Public String selectedYear1 {set;get;}
    Public String selectedYear2 {set;get;}
    public string  selStage{set;get;}
    public integer i=0;
    public Integer M1 {set;get;}
    public Integer Y1 {set;get;}
    public Integer M2 {set;get;}
    public Integer Y2 {set;get;}
    public  PickList(ApexPages.StandardController controller){
        op=new Opportunity();
        StartMonth=new List<selectOption>();
        startMonth.add(new selectOption('','-None-'));
        startMonth.add(new selectOption('1','Jan'));
        startMonth.add(new selectOption('2','Feb'));
        startMonth.add(new selectOption('3','Mar'));
        startMonth.add(new selectOption('4','April'));
        startMonth.add(new selectOption('5','May'));
        startMonth.add(new selectOption('6','june'));
        startMonth.add(new selectOption('7','july'));
        startMonth.add(new selectOption('8','Aug'));
        startMonth.add(new selectOption('9','sept'));
        startMonth.add(new selectOption('10','Oct'));
        startMonth.add(new selectOption('11','Nov'));
        startMonth.add(new selectOption('12','Dec'));
 
       endMonth=new List<selectOption>();
        endMonth.addAll(startMonth);
        
       startYear=new List<SelectOption>();
        startYear.add(new selectOption('','-None-'));
        startYear.add(new selectOption('2010','2010'));
        startYear.add(new selectOption('2011','2011'));
        startYear.add(new selectOption('2012','2012'));
        startYear.add(new selectOption('2013','2013'));
        startYear.add(new selectOption('2014','2014'));
        startYear.add(new selectOption('2016','2016'));
        startYear.add(new selectOption('2017','2017'));
        startYear.add(new selectOption('2018','2018'));
        startYear.add(new selectOption('2019','2019'));
        startYear.add(new selectOption('2020','2020'));
        startYear.add(new selectOption('2021','2021'));
        startYear.add(new selectOption('2022','2022'));
        endYear=new List<selectOption>();
        endYear.addAll(startYear);
    }
    public void get(){
   
    accounts=[select id,name from Account];
    }
    
    public void check(){
        System.debug('===>>>>>'+op.StageName);
        if(i!=0){
    
            accounts.clear();
       
      }
        Y2=integer.valueOf(selectedYear2);
        system.debug('endYear'+Y2);
        Y1=integer.valueOf(selectedYear1);
        system.debug('startYear'+Y1);
        M1=integer.valueOf(selectedMonth1);
        system.debug('StartMonth'+M1);
        M2=integer.valueOf(selectedMonth2);
        system.debug('endMonth'+M2);
        if(Y2<Y1){
            get();
        }
        if(Y2==Y1){
            System.debug('EntryPoint1');
            if(M2<=M1){
                System.debug('EntryPoint2');
                get();
            }
            else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter value'));
            }
        }
        if(Y2>Y1){
          system.debug('entry point');  
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter value'));
        }
 
        i++;
    }
}