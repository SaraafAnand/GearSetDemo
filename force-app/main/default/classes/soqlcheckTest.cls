@isTest
public class soqlcheckTest {

static testMethod void checktest(){
account a=new account(name='xyz');
        insert a;
        soqlcheck.checkme('xy');
    }
}