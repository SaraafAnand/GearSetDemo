public class ldControllerV2 {
    
    //Lead-Informationen
    public Lead leadRecord{get;set;}
    Decimal leadLatitude ;
    Decimal leadLongitude ;
    
    //Account-Informationen
    public List<Account> acc {get;set;}
    String[] skills{get;set;}
    
    //Condition for a Method
    boolean hasCondition = false;
    
    //Map with Distances
   public Map<String, String> distances{get;set;}
    
    
    //String with Queries 
    String query = 'SELECT Id, Name, ShippingLatitude, ShippingLongitude, ShippingAddress, ShippingStreet, ShippingCity, ShippingState, Phone, Skills__c, Priority__c FROM Account WHERE RecordTypeId=\'01258000000ATCX\' AND ShippingLatitude!=null AND Priority__c !=null' ;
    String recordId = '01258000000ATCX';
  
    //Constructor, assign a List of Accounts, Distances and imports the lead account
    public ldControllerV2(ApexPages.StandardController sc)
    {
        
        acc = new List<Account>();
        this.leadRecord = (Lead) sc.getRecord();        
        this.distances = new Map<String, String>();

       
        if(leadRecord.id != null && leadRecord!=null)
        {
            leadRecord = [select Name,Latitude,Longitude from lead where id =:leadRecord.id ];
            leadLatitude  = leadRecord.Latitude;
            leadLongitude = leadRecord.Longitude;
           // skills = leadRecord.EnergySource__c.split(';');
        }
    }
    
    public List<Account> getAccounts(){

        //'GEOLOCATION(' + leadLatitude + ', ' + leadLongitude + '), ' +
       
        if(!skills.isEmpty())
      {
            hasCondition =true;
            query += ' AND Skills__c includes (\''+skills[0]+'\'';
      skills.remove(0);
        }
        while(!skills.isEmpty()){
            query +=',\''+skills[0]+'\'';
            skills.remove(0);
        }
    
      if(hasCondition) query +=')';
        hasCondition = false;
      
        Acc = Database.query(query+
                             ' ORDER BY DISTANCE(ShippingAddress, GEOLOCATION(' + leadLatitude + ', ' + leadLongitude + '), \'km\') '+
                             'limit 20');   
        resolveDistances();
        
        return Acc;
    }
    
    
     public PageReference processButtonClick() {
        
    ID heatingInstallerID = System.currentPageReference().getParameters().get('heatingInstallerID');
       // leadRecord.ZH_Account__c = heatingInstallerID;
         
         update leadRecord;
         PageReference pg = new PageReference('/'+ leadRecord.Id);
        pg.setRedirect(true);
        return pg;
         
    }
    
    
    public void resolveDistances(){
        
        for(Account a : acc) {
      
            Location accLoc = Location.newInstance(a.ShippingLatitude, a.ShippingLongitude);
            Location leadLoc = Location.newInstance(leadRecord.Latitude, leadRecord.Longitude);
            Integer distance = (Integer) accLoc.getDistance(leadLoc, 'km');
            String km = distance+' km';
            
            this.distances.put(a.ID, km);
        }
        
    }

    public void resolveDistance(Account a){
    
    
    }
    
    
}