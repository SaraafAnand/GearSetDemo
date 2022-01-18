/* Author=S.Anand;
 * version=40.0; 
 * CreatedDate=10.10.2017;
 * Requirement=Create  a custom object with name and value fields and enter one string expression value in textbox.
Based on that string expression we have to form a query and display those records.
*/
public class Account_Formulalist {
    public list<customaccount__c> cacc{set;get;}
    public list<Account> acc{set;get;}
    public string selected {set;get;}
    public Map<String,String> cMap=new Map<String,String>();   
    public Account_Formulalist(){
        cacc=[select name,value__c from customaccount__c ORDER BY Name ASC];
        cMap.put('And',' AND ');
        cMap.put('Or',' OR ');
        // Assign the Name,value fields of Customaccount to cMap.
     for(customaccount__c c:cacc){
            cMap.put(c.Name,c.Value__c);
        }
    }
    
    public void displayAccountList(){
        // Replace every key of cMap in the selectvalue with the value of CMap. 
        for(String s:cMap.keySet()){
            selected=selected.replace(s,cMap.get(s));
        }           
        String query='select Name,Industry,Rating from Account where '+selected;
        system.debug('====>>'+query);
        acc=database.query(query);
    }
}