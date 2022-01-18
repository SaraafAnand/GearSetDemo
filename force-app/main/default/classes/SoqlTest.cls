public class SoqlTest {
    Public AggregateResult[] groupedResults {set;get;}
    Public SoqlTest(){
 groupedResults = [SELECT AVG(Amount) FROM Opportunity];
    }
}