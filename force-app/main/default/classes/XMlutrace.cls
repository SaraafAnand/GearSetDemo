public class XMlutrace {
    @future(callout=true)
    public static void iptrace(String ipaddress){
      http p=new http();
        HttpRequest request =new HttpRequest();
      String endpoint='http://xml.utrace.de/?query='+ipaddress;
      request.setEndpoint(endpoint);
      request.setMethod('GET');
     HttpResponse response=p.send(request);
       String result=response.getBody();
        Dom.Document doc= new Dom.Document();
        doc.load(result);
        Dom.XmlNode root=doc.getRootElement();
        List<Dom.XmlNode> child=root.getChildElements();
        integer i;
        Map<string,String> xmlMap=new Map<String,String>();
        for( i=0;i<child.size();i++){
        List<Dom.XmlNode> subchild=child[i].getChildElements();
            for(Dom.XmlNode N:subchild){
                xmlMap.put(N.getName(), N.getText());
            }
        }
        Set<String> Key=xmlMap.keySet();
        for(String k:key){
            System.debug(k+':'+xmlMap.get(k));
        }
    }
}