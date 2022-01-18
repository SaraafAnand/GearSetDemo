public class FLS_Update_Controller {
	@AuraEnabled
    public static List<String> fetchObjects(){
        return FLS_Constants.OBJECT_LIST;
    }
}