/* Author:S.Anand
 * Version:40.0
 * Requirement:Create an Quote and Quote Line items.
 * CreatedDate:15/10/2017
*/
public class quoteLineItems {
    public List<quoteWrapper> quoteList {set;get;}
    public Integer rowNo {set;get;}
    public Integer rowDel {set;get;}
    public Integer rowAdd {set;get;}
    public String selectedName{set;get;}
    public Opportunity op{set;get;}
    Public Quote       Qt{set;get;}
    public String  quoteName {set;get;}
    public List<quoteWrapper> delList {set;get;}
    public quoteLineItems(Apexpages.StandardController controller){
    quoteList=new List<quoteWrapper>();
        op=new Opportunity();
        quoteWrapper qw=new quoteWrapper();
             quoteList.add(qw);
     //   add();
    }
    /* To add each QuoteLine item */
	public void add(){
        system.debug('Rowno:'+rowAdd);
        if((rowAdd+1)==quoteList.size()){
            quoteWrapper qw=new quoteWrapper();
             quoteList.add(qw);
        }
        // Inserting the rows in between the List
        else{
            System.debug('===>Rows addind in between the list');
            quoteWrapper qw=new quoteWrapper();
             quoteList.add(rowAdd+1,qw);
        }
        }
        
    /*To delete each selected QuoteLineItem */
    public void del(){
        quoteWrapper  qw1 = quoteList.get(rowDel);
        System.debug(qW1);
       System.debug('=====>>>>>DeletingrowNo'+rowDel);
       system.debug('Row Number=======>'+rowDel);
     quoteWrapper delstr=  quoteList.remove(rowDel);
        Integer count = quoteList.size();
   /*quoteWrapper  qw = quoteList.get(rowDel);*/
        System.debug('deletedvalue==>>'+delstr);
       system.debug('Deleted');
   }    
    /* Get all the details of from given productname */
    public void getDetails(){
         system.debug('Rowno===>>'+rowNo);
        quotewrapper qw=quoteList.get(rowno);
        system.debug('prodName====>>>'+qw.prod);
        Product2 pr = [select id from Product2 where name=:quoteList.get(rowno).prod];
        system.debug('productId===>>'+pr.Id);
        PriceBook2 pb=[select id from priceBook2 where isStandard=true];
        PriceBookEntry pe=[select unitPrice from priceBookEntry where product2Id=:pr.Id And pricebook2Id=:pb.Id];
        system.debug('unitPrice===>>>'+pe.unitprice);
           qw.unitprice=pe.unitprice;
           qw.pro=pr;
            qw.pbentry=pe;
            }
    // Insert Opportunity,Quote,QuoteLineItem
    public pagereference save(){
        insert op;
        System.debug('Opportunity===>>'+op.Id);
        PriceBook2 pb=[select id from priceBook2 where isStandard=true];
        qt=new Quote();
        qt.OpportunityId=op.Id;
        qt.Name=selectedName;
        qt.Pricebook2Id=pb.Id;
        insert qt;
        system.debug('QuoteId===>>'+qt.id);
        
	List<QuoteLineItem> quoteItems=new List<QuoteLineItem>();    
        for(quoteWrapper qw:quoteList){
           QuoteLineItem  quoteLine= new QuoteLineItem();
            quoteLine.QuoteId=qt.Id;
            quoteLine.Product2Id=qw.pro.id;
            quoteLine.Quantity=qw.quant;
            quoteLine.PricebookEntryId=qw.pbentry.id; 
            quoteLine.UnitPrice=qw.salesPrice;
            quoteLine.Discount=qw.disc;
            quoteItems.add(quoteLine);
        }
        insert quoteItems;
       PageReference p = new PageReference('https://ap5.salesforce.com/'+op.Id); //('/'+op.Id);
       return p;
    }
    public class quoteWrapper{
    public String prod{set;get;}
    public Integer quant{set;get;}
    public Decimal unitPrice{set;get;}
    public Decimal salesPrice{set;get;}
    public Decimal subTotal{set;get;}    
    public Decimal total{set;get;}
    public Decimal disc{set;get;}
   public PriceBookEntry pbentry{set;get;}
    public Product2 pro{set;get;}    
}
}