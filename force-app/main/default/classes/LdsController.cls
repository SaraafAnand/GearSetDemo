global class LdsController {
@AuraEnabled
    webservice static Account getAcc(String Id){
        return [select Id,Name,Rating from Account LIMIT 1];
    }
    @AuraEnabled
    webservice static String getObj(String x,String y){
        System.debug('x'+x+'y'+y);
        return 'x';
    }
}