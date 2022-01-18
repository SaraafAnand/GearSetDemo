public class OptyLineItems {
    public List<OptyWrapper> lineItems {set;get;}
    public Integer rowNo        {set;get;}
    public OptyLineItems(ApexPages.StandardController controller){
        lineItems=new List<OptyWrapper>();
        add();
    }
    public void add(){
        for(Integer i=1;i<=3;i++){
            OptyWrapper op=new OptyWrapper();
            lineItems.add(op);
        }
    }
    public void getData(){
        OptyWrapper ow=lineItems.get(rowNo);
        system.debug(ow.prodName);
     /*   Product2 p=[select id from Product2 where name=:ow.prodName];
        PriceBook2 pr=[select id from PriceBook2 where isStandard=true];
        PriceBookEntry pe=[select unitprice from PriceBookEntry where product2Id=:p.Id and priceBook2Id=:pr.id];
      ow.price=pe.UnitPrice;  */
    }
}