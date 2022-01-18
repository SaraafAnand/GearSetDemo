public class AccountList_Expression {
    public String selectedvalue{set;get;}
    public List<Account> acc{set;get;}
    public String query {set;get;}
    public Map<String,string> Imap;
     Map<String,string> Rmap;
    public AccountList_Expression(){
       Imap= new Map<String,String>();
        Imap.put('I','Industry');        
        Imap.put('B','Banking');
        Imap.put('E','Energy');
        Imap.put('A','Agriculture');
      Rmap= new Map<String,String>();
        Rmap.put('R','Rating');
        Rmap.put('H','Hot');
        Rmap.put('C','Cold');
        Rmap.put('W','Warm');
    }
    public void search(){
         //selectedvalue='I=B AND R=H';
        // selectedvalue='R=H';
        Integer i=selectedvalue.length();
         System.debug(i);
        string indust;
        String Ra;
        String Ind;
        String Rat;
        query='select name,industry,rating,type from Account where ';
        if((selectedvalue!=null)&&(selectedvalue!=''))
        {
           if(i==11) {
               indust =Imap.get(selectedvalue.substring(0,1));
               Ra=Rmap.get(selectedvalue.substring(8,9));
                 Ind=Imap.get(selectedvalue.substring(2,3));
             System.debug('Industry===>>>'+Ind);
                Rat=Rmap.get(selectedvalue.substring(10,11));
            System.debug('Rating=>>>>>'+Rat);
        //query=query+'Industry=\''+Ind+'\' And Rating=\''+Rat+'\'';
            query=query+indust+'=\''+Ind+'\' And '+Ra+'=\''+Rat+'\'';
            }
            if(i==3){
                if(selectedvalue.contains('I')){
                    indust =Imap.get(selectedvalue.substring(0,1));
                    Ind=Imap.get(selectedvalue.substring(2,3));
                    query=query+indust+'=\''+Ind+'\'';
                  System.debug(query);  
                }
            if(selectedvalue.contains('R')){
                    Ra=Rmap.get(selectedvalue.substring(0,1));
                    Rat=Rmap.get(selectedvalue.substring(2,3));
                    query=query+Ra+'=\''+Rat+'\'';
                  System.debug(query);  
                }
    
                
                
            }
            System.debug('Query==>>>'+query);
       acc=Database.query(query); 
        }
    }
    }