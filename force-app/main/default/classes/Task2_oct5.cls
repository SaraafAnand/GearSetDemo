public class Task2_oct5 {
    public List<AccountWrapper> awList {set;get;}
    public String selectedname {set;get;}
    public String selectedphone {set;get;}
    public String selectedIndustry {set;get;}
    public String query {set;get;}
   
     public void get(){
         awList=new List<AccountWrapper>();
    }   
             
         public void search(){
        awList.clear();
        query='select name,phone,industry from Account';
    	
        if((Selectedname!=null&&Selectedname!='')&&(Selectedphone!=null&&Selectedphone!='')&& (Selectedindustry!=null&&Selectedindustry!=''))
        {               
            query=query+' where name=\''+selectedname+'\' and phone=\''+selectedphone+'\' and industry=\''+selectedIndustry+'\'';
    }
        else{
            if((Selectedname!=null&&Selectedname!='') ){
             query=query+' where name=\''+selectedname+'\'';   
            }
        
            else{
                if((Selectedphone!=null&&Selectedphone!='')){
                    query=query+' where phone=\''+selectedphone+'\'';
                }
            else{
                if(Selectedindustry!=null&&Selectedindustry!=''){
                    query=query+' where industry=\''+selectedIndustry+'\'';
                }
            }
            }
            
        }
        system.debug(query);

        system.debug(query);
      List<Account> acc= Database.query(query);
        for(Account a:acc){
          System.debug(a.Name);  
         AccountWrapper aw = new AccountWrapper();
        aw.flag=false;
        aw.Name= a.Name;
        aw.id=a.id;
        aw.Phone= a.phone;
        aw.Industry= a.Industry;
            system.debug(aw.id);
        awList.add(aw);
    } 
        
}
 
    }