@IsTest
public class TestRestrictContactByName {
@IsTest
    public Static void TestResrtictName(){
        contact c=new contact();
        c.LastName='INVALIDNAME';
        insert c;
       c.LastName='XYZ';
        update c;
    }
}