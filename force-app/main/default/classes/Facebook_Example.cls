public class Facebook_Example {
    public String appId         {set;get;}
    public String appSecret     {Set;get;}
    public String accessToken   {Set;get;}
    public String result        {Set;get;}
    public void requestToken(){
        Http p=new Http();
        String endPoint='https://graph.facebook.com/oauth/access_token?grant_type=client_credentials';
        endPoint=endpoint+'&client_id='+appId+'&client_secret='+appSecret;
        HttpRequest request=new HttpRequest();
        request.setEndPoint(endPoint);
        request.setMethod('GET');
        HttpResponse response=p.send(request);
        result=response.getBody();
        System.JSONParser jp=JSON.createParser(result);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken=jp.getText();
            }
        }
        findFriends();
    }
    public void findFriends(){
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        //String url='https://graph.facebook.com/v2.11/100010596160556';
        String url='https://graph.facebook.com/v2.11/100010596160556/friends';
        request.setEndPoint(url);
        request.setMethod('GET');
        request.setHeader('Authorization','Bearer '+accessToken);
        HttpResponse response =p.send(request);
        result=response.getBody();
    }
    
}