public class CollectionLimitController {
    public List<Account> collectionSizeVariable{get;set;}
    public String AccountInformationString {get;set;}
    public CollectionLimitController(){
    
        collectionSizeVariable = new List<Account>();
        for(integer i=0;i<50007;i++){
            collectionSizeVariable.add(new Account(name='sunil'+i, type='Prospect', Industry='IT'));
        }
        datasetForTable dataSet =new datasetForTable();
        list<list<String>> dataValues=new list<list<String>>();
        list<list<String>> columnsLabels=new list<list<String>>();
        columnsLabels.add(new List<String>{'Account name'});
        columnsLabels.add(new List<String>{'Type'});
        columnsLabels.add(new List<String>{'Industry'});
        for(Account sb: collectionSizeVariable){
            list<String> fieldvalues = new List<String>();
            if(sb.name != null && sb.name != ''){
                fieldvalues.add(sb.name );
            }else{
                fieldvalues.add('');
            }
            if(sb.Type != null && sb.Type != ''){
                fieldvalues.add(sb.Type);
            }else{
                fieldvalues.add('');
            }
            if(sb.Industry != null && sb.Industry != ''){
                fieldvalues.add(sb.Industry);
            }else{
                fieldvalues.add('');
            }
            dataValues.add(fieldvalues);
        }
        dataSet.data = dataValues;
        dataSet.columns = columnsLabels ;
        AccountInformationString = JSON.serialize(dataSet); 
        system.debug('************AccountInformationString:'+AccountInformationString);    
        
    }
    public class datasetForTable{
        public List<List<String>> columns;
        public List<List<String>> data;
    }
}