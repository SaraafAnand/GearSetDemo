public class csvLogic {
public Blob blobCsv{set;get;}
    public String stringCsv{set;get;}
    public List<string> stringLines{set;get;}
    Public List<Account> accountList{set;get;}
    public Map<String,Map<String,String>> csvMap{set;get;}
    
    public void convert_Accountobj(){
        csvMap= new Map<String,Map<String,String>> ();
        //convert the blob values in to the string 
        stringCsv = blobCsv.toString();
        stringCsv= EncodingUtil.base64Decode(EncodingUtil.base64Encode(blobCsv)).toString();
        system.debug('StringCsv====>>'+StringCsv);
        /*Splitting each string line generated in the above step where each line represents each record
so for each line of insertion a account object  is created */
        stringLines=stringCsv.split('\n');
        System.debug('No of StringLines:'+stringLines);
        // For each Line splitted in the above step is again splitted by ',' which represents each field value in the account object       
        for(integer i=1;i<stringLines.size();i++){
             String string_line=stringLines.get(i);
            List<String> recordVariables=String_line.split(',');
            for(String s:recordVariables){
                
            }
            
                }
 
    }
}