public class Account_Formula {
    public String selected{set;get;}
    public List<Account> acc{set;get;}
    public String query {set;get;}
    public Map<String,string> Imap;
    public void search(){
       Imap= new Map<String,String>();
        Imap.put('I','Industry');        
        Imap.put('B','Banking\'');
        Imap.put('E','Energy\'');
     	//Imap.put('A','Agriculture\'');
        Imap.put('R','Rating');
        Imap.put('H','Hot\'');
        Imap.put('C','Cold\'');
        Imap.put('W','Warm\'');
        Imap.put('And',' And ');
        Imap.put('=','=\''); 
        Imap.put('OR',' OR ');
              // selected='I=B';
        for(string s:Imap.keySet()){
            selected=selected.replace(s,Imap.get(s));
        system.debug(selected);
        }
                   
        query='select name,rating,type,industry from Account where '+selected;
             System.debug(query);
         acc=Database.query(query);
    }
}