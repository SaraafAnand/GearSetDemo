@Istest
public class LeadProcessorTest {
@Istest
    private static void testBatch(){
        Lead L=new Lead(leadsource='Dreamforce',LastName='ssss',company='ssss');
        insert L;
        Test.startTest();
        LeadProcessor ld=new LeadProcessor();
        Id batchId = Database.executeBatch(ld,200);
        Test.stopTest();
    }
}