public class Accountpopup {
    public String name 					 {set;get;}
    public String phone					 {set;get;}
    public String industry 				 {set;get;}
    public List<Account>acc            {set;get;}
    public List<ItSlatewrapper> wra_List {set;get;}
    public set<Account> deslected        {set;get;}
     public List<Account> selectedlist   {set;get;}
    public Boolean displayPopUp          {set;get;}
    public Accountpopup(){
        wra_List=new List<ItSlatewrapper>();
         deslected=new set<Account>();
        selectedlist=new List<Account>();
        acc=new list<account>();
    }
    public void searchnames(){
        wra_List.clear();
       String query='select name,industry,phone from account';
        if(name!=''&&name!=null&&(industry==''||industry==null)&&(phone==null||phone=='')){
            query=query+' where name=\''+name+'\'';
            name=null;
        }
        if((name==''||name==null)&&(industry!=''&&industry!=null)&&(phone==null||phone=='')){
            query=query+' where industry=\''+industry+'\'';
            industry=null;
        }
        
        if((name==''||name==null)&&(phone!=null&&phone!='')&&(industry==''||industry==null)){
            query=query+' where phone=\''+phone+'\'';
            phone=null;
        }    
        
     if((name!=''&&name!=null)&&(industry!=''&&industry!=null)&&(phone==null||phone=='')){
            query=query+' where name=\''+name+'\' and industry=\''+industry+'\'';
            name=null;
            industry=null;
        }
        if((name!=''&&name!=null)&&(industry==''||industry==null)&&(phone!=null&&phone!='')){
            query=query+' where name=\''+name+'\' and Phone=\''+phone+'\'';
            name=null;
            phone=null;
        }
        if((name==''||name==null)&&(industry!=''&&industry!=null)&&(phone!=null&&phone!='')){
            query=query+' where industry=\''+industry+'\' and Phone=\''+phone+'\'';
            industry=null;
            phone=null;
        }
        if((name!=''&&name!=null)&&(industry!=''&&industry!=null)&&(phone!=null&&phone!='')){
          query=query+' where name=\''+name+'\' and industry=\''+industry+'\' and phone=\''+phone+'\'';
            name=null;
            industry=null;
            phone=null;
        }
        acc=Database.query(query);
        system.debug('acc..'+acc+' wr..'+wra_List);
        for(Account a:acc){
           ItSlatewrapper wr=new ItSlatewrapper();
            wr.acc1=a;
            wra_List.add(wr);
        }
    }
     public void selectrecords(){
         displayPopUp=true;
        for(ItSlatewrapper wrap:wra_List){
            deslected.add(wrap.acc1);
            if(wrap.flag==true){
              selectedlist.add(wrap.acc1); 
            }
        }  
    }
    public void closepopup(){
        selectedlist.clear();
        displayPopUp=false;
        
    }
        public PageReference getSelected()
    {
        acc.clear();
        for(ItSlatewrapper accwrapper : wra_List)
        if(accwrapper.flag == true)
        acc.add(accwrapper.acc1);
        return null;
    }

}