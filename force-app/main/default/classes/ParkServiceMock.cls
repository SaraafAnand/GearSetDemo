global class ParkServiceMock implements WebServiceMock {
    global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
       ParkService.byCountryResponse respElement = 
           new ParkService.byCountryResponse();
               String [] res=new String[]{'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'};
       respElement.return_x = res;
       response.put('response_x', respElement); 
   }

}