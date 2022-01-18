public class task28class 
{ 
    public integer rowindex{set;get;}
    public integer index{set;get;}
    public string opplineid{set;get;}
    public List<task28wrapper> addingrow{set;get;}
    public List<task28wrapper> deleterow{set;get;}
    public list<opportunitylineitem> oplist{set;get;}
    public opportunity oppor{set;get;}
    public task28wrapper delrow{set;get;}
    public task28class(apexpages.StandardController controller)
    {
       index=0;
       oppor =new opportunity();
        oplist=new List<opportunitylineitem>();
        addingrow=new list<task28wrapper>();
        deleterow=new List<task28wrapper>();
        addrow();   
    }
    public void addrow()
    {
        task28wrapper singlerow=new task28wrapper();
        addingrow.add(singlerow);
        index=index+1;
    }
    public void deleterow()
    {  
        index=index-1;
        rowindex=rowindex-1;    
        system.debug('=======================================+in delete function'+index);
        system.debug('=========================================='+rowindex);
        addingrow.remove(rowindex);
     }
    public void listpricefunction()
    {
        task28wrapper wrap=addingrow[index-1];
        string productname=wrap.Name;
        system.debug('----------------------------------------------------'+productname);
        pricebookentry lp=[select product2.name,pricebook2.isStandard,unitprice from pricebookentry where product2.name=:productname and pricebook2.isStandard=:true];
        wrap.listprice=lp.UnitPrice;
        wrap.totalprice=lp.UnitPrice*wrap.quantity;
        wrap.pbentry=lp;
        system.debug('******************************+'+wrap.listprice);
    }
    public pagereference Save()
    {
        insert oppor; 
        task28wrapper wrap=addingrow[index-1];
        //list of  oli field
          for(task28wrapper w:addingrow)
          {
             opportunitylineitem olitem=new opportunitylineitem();
              olitem.OpportunityId=oppor.Id;
              olitem.PricebookEntryId=w.pbentry.id;
              olitem.quantity=w.quantity;
              olitem.unitprice=w.listprice;
           //   olitem.totalprice=w.totalprice;
              oplist.add(olitem);
          }
         if(oplist!=null)
             insert oplist;
       PageReference oppPage = new pagereference('/'+oppor.Id);
       oppPage.setRedirect(true);
       return oppPage;  
    }
}