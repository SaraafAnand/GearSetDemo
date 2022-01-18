public class Facebook_Friends {
public String appId         {set;get;}
    public String appSecret     {Set;get;}
    public String accessToken   {Set;get;}
    public String result        {Set;get;}
    public String longtoken_result {set;get;}
    public void requestToken(){
        Http p=new Http();
     String endPoint='https://graph.facebook.com/oauth/access_token?grant_type=client_credentials';
        endPoint=endpoint+'&client_id=1756102934431800&client_secret=d421ddb9ac03511af5150aeb06bcd097';
        HttpRequest request=new HttpRequest();
        request.setEndPoint(endPoint);
        request.setMethod('GET');
        HttpResponse response=p.send(request);
        result=response.getBody();
        System.debug('====>>>'+result);
        System.JSONParser jp=JSON.createParser(result);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken=jp.getText();
                System.debug('====>>>>'+accessToken);
            }
        }
        findFriends();
    }
    public void findFriends(){
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        //String url='https://graph.facebook.com/v2.11/100010596160556';
        String url='https://graph.facebook.com/v2.11/1086923501327356?fields=friends';
        request.setEndPoint(url);
        request.setMethod('GET');
        request.setHeader('Authorization','Bearer '+accessToken);
        HttpResponse response =p.send(request);
        result=response.getBody();
    }
    public void friendToken(){
         Http p=new Http();
         HttpRequest request=new HttpRequest();
        String endPoint='https://graph.facebook.com/oauth/access_token?';
        endpoint=endpoint+'grant_type=fb_exchange_token&client_id=145634995501895&client_secret=d421ddb9ac03511af5150aeb06bcd097';
        endpoint=endpoint+'&fb_exchange_token=1756102934431800|HGTjtk1X2pgUn6Tdp8PrjwMGDHg';
      //  request.setHeader('Authorization','Bearer 1756102934431800|HGTjtk1X2pgUn6Tdp8PrjwMGDHg');
        request.setEndPoint(endPoint);
        request.setMethod('GET');
        HttpResponse response=p.send(request);
        longtoken_result=response.getBody();
        System.debug('====>>>'+longtoken_result);
            }
        }