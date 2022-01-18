/* Author: S.Anand
* Version:1.0
* Requirement:Create a csv file with Account Records and upload that csv file in vf page , using apex class ,read and 
parse data from csv and insert those records into  Account object.create the csv file with the inserted account records ids also,
Delete the corresponding records which are provided in csv file with id 
* CreatedDate:21/10/2017
*/
public class AccountCreate_Csv {
    public Blob blobCsv{set;get;}
    public String stringCsv{set;get;}
    public List<string> stringLines{set;get;}
    Public List<Account> accountList{set;get;}
    
    public AccountCreate_Csv(){
        accountList=new List<Account>();
        StringLines=new List<String>();
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
            // In the above record VariablesList fieldvalues are available using field values we create a accountobject         
            Account accountCreate=new Account();
            accountCreate.Name=recordVariables.get(0);
            system.debug('AccountName:======>'+accountCreate.Name);
            accountCreate.Industry=recordVariables.get(1);
            system.debug('AccountIndustry:======>'+accountCreate.Industry);
            accountCreate.Rating=recordVariables.get(2);
            system.debug('AccountIndustry:======>'+accountCreate.Rating);
            accountList.add(accountCreate);   
                }
        insert accountList;
    }
    /* To export the above created accountList of records in to the csv file in the  and save it in the document folder
there by deleting all list of records from the database */
    
    public void export(){
        List<account> accountExport=[select id,name,industry,rating from Account LIMIT 10];
        // provide the header name for the csv file
        String headerValue='AccountId,Name,Industry,Rating,\n';
        for(account account1:accountExport){
            // Below string holds each field value of account record from the account List 
            System.debug('====>>>>Account Export:'+account1);   
            String record_Export=account1.Id+','+account1.Name+','+account1.Industry+','+account1.Rating+','+'\n';
            headerValue=headerValue+record_Export;
            System.debug('Final Header Value'+headerValue);
            // query the folder where the csv file to be inserted
            Folder folderId=[select id from folder where name=:'AccountRecords'];
            System.debug('FolderId'+folderId.id);
            Document csvDocument =new Document();
            csvDocument.Name='XMlCSV';
            csvDocument.FolderId=folderId.Id;
            csvDocument.Body=Blob.valueOf(headervalue);
            csvDocument.ContentType='text/xml';
            csvDocument.Type='xml';
            insert csvDocument;
            System.debug('Doumentid'+csvDocument);
            
        }
        Deleterecords();
    }
    public void Deleterecords(){
        Delete accountList;
        accountList.clear();
    }
     public pagereference newTest(){
            pagereference p = new pagereference('/003/e?retURL=%2F003%2Fo');
            return p;
        }
       
}