/*Author:S.Anand
* Version:1.0
* Requirement:create a Quick based on account and contact
* CreatedDate:03/11/2017
*/ 
public class Quick_Quote {
   Public Id  getId=Null;
    public String selectedValue{set;get;}
    public List<Account> account_Prepopulate{set;get;}
    public String selectedName {set;get;}
    public String selectedIndustry {set;get;}
    public String selectedLastName {set;get;}
    public String selectedEmail {set;get;}
    public String selectedOpportunity_Name {Set;get;}
    public String selectedOpportunity_StageName {Set;get;}
    public String selectedOpportunity_CloseDate {Set;get;}
    public Account account_Quote {set;get;}
    public String query {set;get;}
    public List<Account> account_List{set;get;}
    public List<quoteWrapper> quoteList {set;get;}
    public Integer rowNo {set;get;}
    public Integer rowDel {set;get;}
    public Integer rowAdd {set;get;}
    public String selectedProductName{set;get;}
    public Opportunity opportunity1{set;get;}
    Public Quote       Quote1{set;get;}
    public String  quoteName {set;get;}
    public List<quoteWrapper> delList {set;get;}
    public List<Contact> contactList;
    public Integer i;
    private List<Opportunity> opportunityList;
    public Quick_Quote(Apexpages.StandardController controller){
        //account_Prepopulate is used to get all the account and contact details
        Id accountId= ApexPages.currentPage().getParameters().get('id');
        if(getId==Null){
        getId=accountId;
        }
        system.debug('AccountId:'+accountId);
        account_Quote=[select Name,industry,(select LastName,email from contacts),(select Name,StageName,closeDate from Opportunities) from Account where id=:accountId];
        selectedName=account_Quote.Name;
        system.debug('AccountName:'+selectedName);
        selectedIndustry=account_Quote.industry;
        system.debug('AccountIndustry:'+selectedIndustry);
        // If account has any contacts then latest contact is passed to the vf controller
        if(account_Quote.Contacts.size()>0){
            selectedLastName=account_Quote.contacts[(account_Quote.Contacts.size())-1].LastName;
            System.debug('contactLastName:'+selectedLastName);
            selectedEmail=account_Quote.contacts[(account_Quote.Contacts.size())-1].Email;
            System.debug('contactLastName:'+selectedEmail);
        }
        // If account has any Opportunities then latest opportunity is passed to the vf controller
        if(account_Quote.Opportunities.size()>0){
            selectedOpportunity_Name = account_Quote.Opportunities[(account_Quote.Opportunities.size())-1].Name;
            selectedOpportunity_StageName = account_Quote.Opportunities[(account_Quote.Opportunities.size())-1].StageName;
            selectedOpportunity_CloseDate = account_Quote.Opportunities[(account_Quote.Opportunities.size())-1].CloseDate .format();   
        }
        quoteList=new List<quoteWrapper>();
        quoteWrapper qw=new quoteWrapper();
        quoteList.add(qw);
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
        Product2 pr = [select id from Product2 where name=:qw.prod];
        system.debug('productId===>>'+pr.Id);
        PriceBook2 pb=[select id from priceBook2 where isStandard=true];
        PriceBookEntry pe=[select unitPrice from priceBookEntry where product2Id=:pr.Id And pricebook2Id=:pb.Id];
        system.debug('unitPrice===>>>'+pe.unitprice);
        qw.unitprice=pe.unitprice;
        qw.pro=pr;
        qw.pbentry=pe;
    }
    // To search the account name and display list of records based on the name
    public pageReference opsave(){
        opportunityList= new List<Opportunity>();
        contactList= new List<Contact>();
        // if there are no contacts associated with the account_Quote then new contact is created  
        if(account_Quote.Contacts.size() ==0 ){
            Contact contact_New= new Contact();
            contact_New.LastName=selectedLastName;
            System.debug('contactLastName1:'+contact_New.LastName);
            contact_New.Email=selectedEmail;
            System.debug('contactEmail1:'+contact_New.Email);
            contact_New.accountId=account_Quote.Id;
            contactList.add(contact_New);
            i=0; 
            insertobjects();
            
        }
        //If account_quote doesnt have any Opportunities associated with it then new Opportunity is created
        if(account_Quote.Opportunities.size()==0){
            opportunity1=new Opportunity();
            Opportunity1.Name=account_Quote.Name;     
            Opportunity1.StageName='closed Won';
            Opportunity1.CloseDate=System.today();
            system.debug('Opportunity1Details=====>>'+Opportunity1);   
            opportunityList.add(Opportunity1);
            i=1;
            insertobjects();
        }
        
        PriceBook2 pb=[select id from priceBook2 where isStandard=true];
        quote1=new Quote();
        quote1.OpportunityId=opportunityList[0].Id;
        quote1.Name=selectedName;
        quote1.Pricebook2Id=pb.Id;
        System.debug('accId=====>>>'+getId);
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
        PageReference p = new PageReference('https://ap5.salesforce.com/'+quote1.Id); //('/'+op.Id);
        return p;
        
    }
    
    public void insertobjects(){
        System.debug('i Value====>>>'+i);
        if(i==0)  
            insert ContactList;
        if(i==1)
            insert OpportunityList;  
    }
    //wrapper class for Quote Line Items
    public class QuoteWrapper{
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