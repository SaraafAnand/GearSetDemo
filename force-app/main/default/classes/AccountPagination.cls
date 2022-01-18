public class AccountPagination {
    public Integer total {set;get;}
    public Integer CurrentPageNumber {set;get;}
    public Integer result {set;get;}
    public ApexPages.StandardSetController controller {set;get;}
    public AccountPagination(){ 
       controller = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Name,rating FROM Account]));
        
        controller.setPageSize(5);
        result=controller.getResultSize();
        if(math.mod(result,5)==0)
        total=result/5;
        else{
            total=(result/5)+1;
        }
	}
    public List<Account> getAccounts(){
       List<Account>  accounts=(List<Account>) controller.getrecords();
        system.debug(accounts.size());
        CurrentPageNumber =controller.getPageNumber();
        return accounts;
    }
}