public class AccessMapJS {
    public Map<ID, Contact> resultsMap{get;set;} 
    public String JsonMap{get;set;} 
    public Static Map<string,Account> Accountmap {set;get;} 
    public AccessMapJS(){
        resultsMap = new Map<ID, Contact>([SELECT Id, LastName FROM Contact limit 3]);
        JsonMap=JSON.serialize(resultsMap); 
    
    }
    
    @RemoteAction
     public static Map<string,Account> FetchAccount()
      {
       Account   query=[select id,Name from Account LIMIT 1];
      Accountmap =new Map<String,Account>();
      Accountmap.put(query.Name, query);     
     return Accountmap;      
     }
}