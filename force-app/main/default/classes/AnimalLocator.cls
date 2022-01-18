public class AnimalLocator {

    public  Static String getAnimalNameById(Integer Id){
        String AniName;
        http p=new http();
        httpRequest request=new httpRequest();
        
        String endpoint='https://th-apex-http-callout.herokuapp.com/animals/'+id;
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');   
      //  String  body=endpoint+String.valueof(id);
      //  request.setBody(body);
        Httpresponse response=p.send(request);
        String result = response.getBody();
        System.debug('result===============>'+response.getBody());
        JSONParser parser = JSON.createParser(response.getBody());
        while(parser.nextToken()!=null){
            if(parser.getText()=='Name'){
           parser.nextToken();
       AniName=parser.getText();
                System.debug('==>>'+AniName);
        }
            }
  
    return AniName;
    }
}