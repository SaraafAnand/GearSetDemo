global class AdressAutoComplete {
@AuraEnabled
	global static string getSuggestions(String input) {
	    String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?'
	            + 'input=' + EncodingUtil.urlEncode(input, 'UTF-8')
          
	            + '&types=address&components=country:US' + AdressAutoComplete.getKey();
	    String response = AdressAutoComplete.getResponse(url);
	    return response;
	}
@AuraEnabled
	global static string getPlaceDetails(String placeId) {
     	String url = 'https://maps.googleapis.com/maps/api/place/details/json?'
	            + 'placeid=' + EncodingUtil.urlEncode(placeId, 'UTF-8')
	            + AdressAutoComplete.getKey(); 
	    String response = AdressAutoComplete.getResponse(url);
	    return response;
	}
 
	global static string getResponse(string strURL){
		Http h = new Http();
		HttpRequest req = new HttpRequest();
		HttpResponse res = new HttpResponse();
		req.setMethod('GET');
		req.setEndpoint(strURL);
		req.setTimeout(120000);
		res = h.send(req); 
		String responseBody = res.getBody(); 
		return responseBody;
	}
 
global static string getKey(){
		string key = 'AIzaSyAIY3FUlG7jluCSBwttiygd2BmkSlU82Vg';
		string output = '&key=' + key;	 
		return output;
	}
}