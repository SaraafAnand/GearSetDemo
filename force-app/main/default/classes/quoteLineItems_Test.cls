@isTest
private class quoteLineItems_Test{
  @testSetup
  static void setupTestData(){
    test.startTest();
    Opportunity opportunity_Obj = new Opportunity(IsPrivate = false, Name = 'Name618', StageName = 'Prospecting', CloseDate = Date.today());
    Insert opportunity_Obj; 
    test.stopTest();
  }
  static testMethod void test_add_UseCase1(){
    List<Opportunity> opportunity_Obj  =  [SELECT IsPrivate,Name,StageName,CloseDate from Opportunity];
    System.assertEquals(true,opportunity_Obj.size()>0);
    quoteLineItems obj01 = new quoteLineItems(new Apexpages.StandardController(opportunity_Obj[0]));
    obj01.quoteList = new List<quoteLineItems.quoteWrapper>();
    obj01.rowNo = 10;
    obj01.rowDel = 10;
    obj01.rowAdd = 10;
    obj01.selectedName = 'test data';
    obj01.op = opportunity_Obj[0];
    obj01.Qt = new Quote();
    obj01.quoteName = 'test data';
    obj01.delList = new List<quoteLineItems.quoteWrapper>();
    obj01.add();
  }

    static testMethod void test_add_UseCase2(){
    List<Opportunity> opportunity_Obj  =  [SELECT IsPrivate,Name,StageName,CloseDate from Opportunity];
    System.assertEquals(true,opportunity_Obj.size()>0);
    quoteLineItems obj01 = new quoteLineItems(new Apexpages.StandardController(opportunity_Obj[0]));
    obj01.quoteList = new List<quoteLineItems.quoteWrapper>();
    obj01.rowNo = 10;
    obj01.rowDel = 10;
    obj01.rowAdd = 10;
    obj01.selectedName = 'test data';
    obj01.op = opportunity_Obj[0];
    obj01.Qt = new Quote();
    obj01.quoteName = 'test data';
    obj01.delList = new List<quoteLineItems.quoteWrapper>();
    opportunity_Obj[0].IsPrivate=false;
    opportunity_Obj[0].Name='Name542';
    opportunity_Obj[0].StageName='Prospecting';
    opportunity_Obj[0].CloseDate = System.today();
    Update opportunity_Obj[0];
    obj01.add();
  }
  static testMethod void test_del_UseCase1(){
    List<Opportunity> opportunity_Obj  =  [SELECT IsPrivate,Name,StageName,CloseDate from Opportunity];
    System.assertEquals(true,opportunity_Obj.size()>0);
    quoteLineItems obj01 = new quoteLineItems(new Apexpages.StandardController(opportunity_Obj[0]));
    obj01.quoteList = new List<quoteLineItems.quoteWrapper>();
    obj01.rowNo = 10;
    obj01.rowDel = 10;
    obj01.rowAdd = 10;
    obj01.selectedName = 'test data';
    obj01.op = opportunity_Obj[0];
    obj01.Qt = new Quote();
    obj01.quoteName = 'test data';
    obj01.delList = new List<quoteLineItems.quoteWrapper>();
    obj01.del();
  }
  static testMethod void test_getDetails_UseCase1(){
    List<Opportunity> opportunity_Obj  =  [SELECT IsPrivate,Name,StageName,CloseDate from Opportunity];
    System.assertEquals(true,opportunity_Obj.size()>0);
    quoteLineItems obj01 = new quoteLineItems(new Apexpages.StandardController(opportunity_Obj[0]));
    obj01.quoteList = new List<quoteLineItems.quoteWrapper>();
    obj01.rowNo = 1;
    obj01.rowDel = 1;
    obj01.rowAdd = 1;
    obj01.selectedName = 'test data';
    obj01.op = opportunity_Obj[0];
    obj01.Qt = new Quote();
    obj01.quoteName = 'test data';
    obj01.delList = new List<quoteLineItems.quoteWrapper>();
    obj01.getDetails();
  }
  static testMethod void test_save_UseCase1(){
    List<Opportunity> opportunity_Obj  =  [SELECT IsPrivate,Name,StageName,CloseDate from Opportunity];
    System.assertEquals(true,opportunity_Obj.size()>0);
    quoteLineItems obj01 = new quoteLineItems(new Apexpages.StandardController(opportunity_Obj[0]));
    obj01.quoteList = new List<quoteLineItems.quoteWrapper>();
    obj01.rowNo = 10;
    obj01.rowDel = 10;
    obj01.rowAdd = 10;
    obj01.selectedName = 'test data';
    obj01.op = opportunity_Obj[0];
    obj01.Qt = new Quote();
    obj01.quoteName = 'test data';
    obj01.delList = new List<quoteLineItems.quoteWrapper>();
    obj01.save();
  }
   static testMethod void test_quoteWrapper(){
    List<Opportunity> opportunity_Obj  =  [SELECT IsPrivate,Name,StageName,CloseDate from Opportunity];
    System.assertEquals(true,opportunity_Obj.size()>0);
    quoteLineItems obj01 = new quoteLineItems(new Apexpages.StandardController(opportunity_Obj[0]));
    obj01.quoteList = new List<quoteLineItems.quoteWrapper>();
    obj01.rowNo = 10;
    obj01.rowDel = 10;
    obj01.rowAdd = 10;
    obj01.selectedName = 'test data';
    obj01.op = opportunity_Obj[0];
    obj01.Qt = new Quote();
    obj01.quoteName = 'test data';
    obj01.delList = new List<quoteLineItems.quoteWrapper>();
    quoteLineItems.quoteWrapper obj151 = new quoteLineItems.quoteWrapper();
    obj151.prod = 'test data';
    obj151.quant = 10;
    obj151.unitPrice = 10;
    obj151.salesPrice = 10;
    obj151.subTotal = 10;
    obj151.total = 10;
    obj151.disc = 10;
    obj151.pbentry = new PriceBookEntry();
    obj151.pro = new Product2();
  }
}