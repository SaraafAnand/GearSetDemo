/*Author:S.Anand
* Version:1.0
* Requirement:create a Quick based on account and contact for tab
* CreatedDate:08/11/2017
*/ 
public class quickQuote_Tab {
    public String selectedAccountName {set;get;}
    public String selectedIndustry {set;get;}
    public String selectedLastName {set;get;}
    public String selectedEmail {set;get;}
    public List<Account> account_autoPopulate{set;get;}
    public List<quoteWrapper> quoteList {set;get;}
    public Integer rowNo {set;get;}
    public Integer rowDel {set;get;}
    public Integer rowAdd {set;get;}
    public String selectedName{set;get;}
    public Opportunity opportunity_New{set;get;}
    Public Quote       Quote1{set;get;}
    public String  quoteName {set;get;}
    public List<quoteWrapper> delList {set;get;}
    public Account account_New {set;get;}
    public List<Account> autopopulateList {set;get;}
    public quickQuote_tab(){
     quoteList=new List<quoteWrapper>();
        quoteWrapper qw=new quoteWrapper();
             quoteList.add(qw);
     autopopulateList=[select Name from Account];   
    }
    // Details to get autopopulated
    public void autoPopulate(){
        System.debug('selectedName====>>>>>>'+selectedAccountName);
        account_autoPopulate=[select Name,Industry,(select LastName,Email from Contacts),(select Name,StageName,CloseDate from Opportunities) from Account where name=:selectedAccountName];
        if(account_autoPopulate.size()>0) {
            selectedIndustry=account_autoPopulate[0].Industry;
            System.debug('selectedIndustry====>>>>>>'+selectedIndustry);
            
            if(account_autoPopulate[0].contacts.size()>0) {
                selectedLastName=account_autoPopulate[0].contacts[account_autoPopulate[0].contacts.size()-1].LastName;
                system.debug('selectedLastName====>>'+selectedLastName);   
                selectedEmail=account_autoPopulate[0].contacts[account_autoPopulate[0].contacts.size()-1].Email;   
                System.debug('selectedEmail====>>>>>>'+selectedEmail);
            }
        }
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
        if(account_autoPopulate.size()==0){
           account_New =new Account();
            account_New.Name=selectedAccountName;
            account_New.Industry=selectedIndustry;
            System.debug('New Account');
            insert account_New;
            Contact contact_New=new Contact();
            contact_New.LastName=selectedLastName;
            contact_New.Email=selectedEmail;
            contact_New.AccountId=account_New.Id;
            System.debug('New Contact');
            insert contact_New;
        }
        // Condition if account has been found  and no contacts associated with it then new contact has to be created  
        if(account_autoPopulate.size()!=0 && account_autoPopulate[0].contacts.size()==0){
            Contact contact_Account=new Contact();
            contact_Account.LastName=selectedLastName;
            contact_Account.Email=selectedEmail;
            contact_Account.AccountId=account_autoPopulate[0].Id;
            System.debug('Account With out Contact');
            insert contact_Account;
        }
        //if account has found and there are no opportunities associated or when no account was found a opportunity was created
        if((account_autoPopulate.size()!=0 && account_autoPopulate[0].Opportunities.size()==0)||account_autoPopulate.size()==0){
           opportunity_New= new Opportunity();
            System.debug('OpportunityName'+selectedAccountName);
            opportunity_New.Name=selectedAccountName;
            opportunity_New.StageName='closed Won';
            opportunity_New.CloseDate=system.today();
            // if there is any account found in smart list then that account Id is associated with the opportunity
            if(account_autoPopulate.size()==0){
            opportunity_New.AccountId=account_New.Id;
            System.debug('OptyId with new Account'+account_New.Id);
                }
            // if there is any account found in smart list then that account Id is associated with the opportunity
            else{
            opportunity_New.AccountId=account_autoPopulate[0].Id;
             System.debug('OptyId with old Account====>>>'+account_autoPopulate[0].Id);
                }
            insert opportunity_New;
             System.debug('Opportunity===>>'+opportunity_New.Id);
        }
        PriceBook2 pb=[select id from priceBook2 where isStandard=true];
        quote1=new Quote();
        quote1.OpportunityId=opportunity_New.Id;
        quote1.Name=quoteName;
        quote1.Pricebook2Id=pb.Id;
        insert quote1;
        system.debug('QuoteId===>>'+quote1.id);
        
	List<QuoteLineItem> quoteItems=new List<QuoteLineItem>();    
        for(quoteWrapper qw:quoteList){
           QuoteLineItem  quoteLine= new QuoteLineItem();
            quoteLine.QuoteId=quote1.Id;
            quoteLine.Product2Id=qw.pro.id;
            quoteLine.Quantity=qw.quant;
            quoteLine.PricebookEntryId=qw.pbentry.id; 
            quoteLine.UnitPrice=qw.salesPrice;
            quoteLine.Discount=qw.disc;
            quoteItems.add(quoteLine);
        }
        insert quoteItems;
       PageReference p = new PageReference('https://ap5.salesforce.com/'+quote1.Id); //('/'+quote1.Id);
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