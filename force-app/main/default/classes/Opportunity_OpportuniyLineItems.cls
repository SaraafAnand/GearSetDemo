/* Author:S.Anand
 * Version:40.0
 * Requirement:Create an Opportunity and Opportunity Line items,When we create a new opportunity and with entered product 
details OpportunityLineItems should create in custom manner.
 * CreatedDate:11/10/2017
*/
public class Opportunity_OpportuniyLineItems {
      public List<OpportunityLine_wrapper> wrapList{set;get;}
   Public Opportunity op {set;get;}
    public Integer rowDel{set;get;}
    public Integer rowAdd{set;get;}
   List<OpportunityLineItem> oliList = new List<OpportunityLineItem>();
   public Integer rowNo{Set;get;}
   public Opportunity_OpportuniyLineItems(ApexPages.StandardController stdController){
       wrapList = new List<OpportunityLine_wrapper>();
       OpportunityLine_wrapper qw=new OpportunityLine_wrapper();
             wrapList.add(qw);
       op=new Opportunity();
     //  add();
   }
   public void add(){
        system.debug('Rowno:'+rowAdd);
        if((rowAdd+1)==wrapList.size()){
            OpportunityLine_wrapper qw=new OpportunityLine_wrapper();
             wrapList.add(qw);
        }
        // Inserting the rows in between the List
        else{
            System.debug('===>Rows addind in between the list');
            OpportunityLine_wrapper qw=new OpportunityLine_wrapper();
             wrapList.add(rowAdd+1,qw);
        }
        }
    
   public void del(){
       System.debug('=====>>>>>DeletingrowNo'+rowNo);
       system.debug('Row Number=======>'+rowNo);
     wraplist.remove(rowDel);
       system.debug('Deleted');
   }
   public void show(){
       // based on the rowNo get the corresponding element from the list 
       OpportunityLine_wrapper t=wrapList[rowNo];//wrapList[rowNo];//wrapList.get(rowNo)
       System.debug('===>> RowNo:'+rowNo);
       Product2 p = [select id from Product2 where name=:t.productName];
       System.debug('===>>> '+p.id);
               PriceBook2 pb = [select id from PriceBook2 where isStandard=true];
       System.debug('===>>> Pricebook2:'+pb.Id);
                PricebookEntry pbe = [select id,unitPrice from PriceBookEntry where product2Id=:p.id AND PriceBook2Id=:pb.Id];
              System.debug('Unit Price '+pbe.unitprice);
       t.unitPrice =pbe.UnitPrice;
       t.total=t.unitPrice*t.quantity;
       t.pbEntry=pbe;
       System.debug('pricebook'+pbe);
   }
   public PageReference save(){
       insert op;
       List<OpportunityLineItem> items=new List<OpportunityLineItem>();
       for(OpportunityLine_wrapper tw :wrapList){
           OpportunityLineItem ol=new OpportunityLineItem();  
           ol.opportunityId=op.id;
           ol.Quantity=tw.quantity;
           ol.UnitPrice=tw.unitPrice;
           ol.PricebookEntryId=tw.pbentry.id;
           items.add(ol);
       }
       
       insert items;
       PageReference p = new PageReference('https://ap5.salesforce.com/'+op.Id); //('/'+op.Id);
       return p;
   }
}