public class DyanmicQuote {
     public List<PriceBookEntry> pbeList {set;get;}
    public List< DynamicQuoteWrapper> wrapList {Set;get;}
     public List< DynamicQuoteWrapper> cartList {Set;get;}
   public List< DynamicQuoteWrapper> wrapListToDelete {Set;get;}
    public Decimal TotalValue {set;get;}
   // public String selQuant {set;get;}
    public  DyanmicQuote(){
        TotalValue=0;
 pbelist=[select product2.Name,unitPrice from PriceBookEntry LIMIT 5];
        wrapList=new List<DynamicQuoteWrapper>();
         cartList=new List<DynamicQuoteWrapper>(); 
    // flag=false;
    for(PriceBookEntry pbe:pbelist){
            DynamicQuoteWrapper dw=new DynamicQuoteWrapper ();
            dw.prodPrice=pbe;
           // dw.Quantity=selQuant;
       dw.bool=false;
            wrapList.add(dw);
        }
        System.debug('size'+wrapList);

       
    }
    public void cartItems(){
             wrapListToDelete=new List<DynamicQuoteWrapper>(); 
      for(DynamicQuoteWrapper dw:wrapList)  {
          System.debug('dddd'+dw.bool);
           System.debug('dddd'+dw);
            if(dw.bool && dw.quantity !=null ||dw.quantity !=''){
                wrapListToDelete.add(dw);
                cartList.add(dw);
                TotalValue=TotalValue+(integer.valueOf(dw.quantity)*dw.prodPrice.unitprice);
                }
         //System.debug('Size'+cartList.size());
                  } 
        
        
        for(DynamicQuoteWrapper cartWrap:wrapListToDelete){
            wrapList.remove(wrapList.indexOf(cartWrap));
              }

    }
    

    public class DynamicQuoteWrapper{
        public PriceBookEntry prodPrice {Set;get;}
        public String Quantity {set;get;} 
    public Boolean bool {set;get;}
    }
}