public class metaData {
  public Blob blobCsv{set;get;}
    public String stringCsv{set;get;}
    public List<string> stringLines{set;get;}
    Public List<Account> accountList{set;get;}
    public Map<String,List<String>> accMap{set;get;}
    public metaData(){
        accountList=new List<Account>();
        StringLines=new List<String>();
       accMap=new Map<String,List<String>>(); 
    }
    //when convert button is clicked all the records in csv are stored in the account object
    public void convert_Accountobj(){
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
            System.debug('Each StringLine:===>>>'+String_line);   
            List<String> recordVariables=String_line.split(',');
            system.debug('recordVariablesSize===>>'+recordVariables.size());
            if(accMap.containsKey( recordVariables[0])){
                List<String> accList=accMap.get(recordVariables[0]);
                accList.add(recordVariables[1]);
                accMap.put(recordVariables[0], accList);
            }
            else{
                List<String> accList=new List<String>();
                accList.add(recordVariables[1]);
                accMap.put(recordVariables[0], accList);
            }
                }
        System.debug('accMap'+accMap);
       
    }
    
}