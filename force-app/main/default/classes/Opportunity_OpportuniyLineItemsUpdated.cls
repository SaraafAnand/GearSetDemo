/* Author:S.Anand
 * Version:40.0
 * Requirement:Create an Opportunity and Opportunity Line items,When we create a new opportunity and with entered product 
details OpportunityLineItems should create in custom manner.
 * CreatedDate:11/10/2017
*/
public class Opportunity_OpportuniyLineItemsUpdated {
    public List<opportunityLine_Wrapper> optyWrappers {set;get;}
    public String selectedProduct {set;get;}
    public String selectedPrice 	{set;get;}
    public String selectedQuantity {set;get;}
    public Integer rowNo {set;get;}
    public integer count        {set;get;}
    public Opportunity_OpportuniyLineItemsUpdated(Apexpages.StandardController controller){
        
    }
    public void wrapperList(){
        optyWrappers=new List<opportunityLine_Wrapper>();
          count=1;        
        opportunityLine_Wrapper ow= new opportunityLine_Wrapper();
        ow.sNo=count;
        optyWrappers.add(ow);
       
         }
    //Creates New list of wrapper
    public void addWrapper(){  
         count++;
        opportunityLine_Wrapper ow= new opportunityLine_Wrapper();
        ow.sNo=count;
        optyWrappers.add(ow); 
    }
    //Delete a row of wrapper
   /* public void deleteList(){
        Integer index=integer.valueOf(Apexpages.currentPage().getParameters().get('Index'));
        system.debug('====>>>'+index);
        for(integer i=0;i<optyWrappers.size();i++){
            if(optyWrappers[i].sNo==index){
                optyWrappers.remove(i);
            }
        }
        count--;
    } */
    public void deleteWrapper(){
        optyWrappers.remove(optyWrappers.size()-1);
        count--;
    }
    // get the productname and corresponding unitprice.
    public void getData(){
                 system.debug('===>>>'+rowNO);
        Integer rowNo=integer.valueOf(Apexpages.currentPage().getParameters().get('sNO'));
        system.debug('===>>>'+rowNO);
        opportunityLine_Wrapper opty=optyWrappers.get(rowNo-1);
       product2 pro =[select id from product2 where Name=:opty.productName];
       pricebook2 pb=[select id from pricebook2 where IsStandard=true];
       pricebookEntry price=[select unitprice from pricebookEntry where product2Id=:pro.id And pricebook2Id=:pb.id];
        opty.UnitPrice=price.UnitPrice;
    }
    
// Wrapper for OpportunityLine Items
public class opportunityLine_Wrapper{
    Public String productName {set;get;}
    public Decimal unitPrice {set;get;}
    public String quantity {set;get;}
    public String Total {set;get;} 
    public Integer sNo   {set;get;}
    }
}