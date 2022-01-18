@isTest
private class Test_Acc_record_VF_3 {
	@isTest
    static void testMe(){
        Acc_record_VF_3 ar = new Acc_record_VF_3();
        ar.name='Aditya';
        ar.phone='1234';
        ar.rating='Hot';
        ar.industry='Banking';
        ar.save();
        System.assertEquals('Aditya', ar.name);
        System.assertEquals('1234', ar.phone);
        System.assertEquals('Hot', ar.rating);
        System.assertEquals('Banking', ar.industry);
        Account a=new Account();
        a.name='ssss';
        insert a;
       PageReference p=Page.xyz; 
	Test.setCurrentPage(p); 
	String actual=ar.cancel().getUrl(); 
        System.assertEquals('/001/o', actual);


          }
}