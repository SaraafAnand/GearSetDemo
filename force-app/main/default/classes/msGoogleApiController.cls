public class msGoogleApiController {	  
    @AuraEnabled
    public static string getAddressAutoComplete(String input) {
        System.debug('Imput'+input);
      //  String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input='
        String url='https://maps.googleapis.com/maps/api/place/autocomplete/json?input='   
        + EncodingUtil.urlEncode(input, 'UTF-8')
            +'&offset=3&types=address&components=country:US'
            + '&key=' + msGoogleApiController.getGoogleMapsAPIKey() ;
          //  + '&libraries=places';
        return msGoogleApiController.getHttp(url);
    }
    @AuraEnabled
    public static string getAddressDetails (String placeid) {
        String url = 'https://maps.googleapis.com/maps/api/place/details/json?placeid='
            + placeid          
            + '&key=' + msGoogleApiController.getGoogleMapsAPIKey();
        return msGoogleApiController.getHttp(url);
    }     
    @AuraEnabled
    public static String getHttp(String url) {
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        req.setMethod('GET');
        req.setEndpoint(url);
        req.setTimeout(120000);
        HTTPResponse res = http.send(req);
        System.debug('result'+res.getBody());
        return res.getBody();
    }  
    @AuraEnabled
    public static String getGoogleMapsAPIKey() {
        return 'AIzaSyAbXyGHJ8m8Z_neulcRoeYDiYixsKiyJII';
    }
}