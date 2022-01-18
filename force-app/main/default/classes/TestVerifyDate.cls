@Istest
public class TestVerifyDate {
@isTest
    public static void testCheckDates(){
        Date D1=Date.newInstance(2018, 06, 1);
        Date D2=Date.newInstance(2018, 07, 3);
        Date D3=Date.newInstance(2018, 06, 28);
        VerifyDate.CheckDates(D1,D2);
        VerifyDate.CheckDates(D1,D3);
    }
}