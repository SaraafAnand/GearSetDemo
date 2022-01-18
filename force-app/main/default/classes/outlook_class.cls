public class outlook_class {
 // public web_server__c ws{set;get;}
  public string codevalue {set;get;}
  public string callback{set;get;}
  public string result {set;get;}  
  public string endpoint{set;get;}  
  public string endpoint1{Set;get;}  
  public string accesstoken{Set;get;}
  public string mail_info{Set;get;}  
  public string contacts1{set;get;}  
  public string contacts_info{Set;get;}
  public string email_address{set;get;}
  public List<string> names_list{Set;get;}
  public List<string>email_address_list{set;get;}
  public List<contact> contact_list{set;get;}
  public outlook_class()
  {
    names_list=new List<string>();
    contact_list=new List<contact>();
    email_address_list=new List<string>();
   // ws=[select client_id__c,client_secret__c from web_server__c where Ws_Name__c='outlook1'];
     // ws.client_id__c= 33fd62e9-69a6-4c00-88e8-4cc982398d24;
    //  ws.client_secret__c =lTPI36%_-$bkiullSUXD545;   
    callback='https://santu-fb-dev-ed--c.na73.visual.force.com/apex/outlook_response';
  }
  //funtion to send authorize information
  public pagereference LoginPage()
  {
      system.debug('================loginpage');
      string url='https://login.microsoftonline.com/common/oauth2/v2.0/authorize?';
      url=url+'client_id='+'33fd62e9-69a6-4c00-88e8-4cc982398d24';
      url=url+'&redirect_uri='+callback;
      url=url+'&response_type=code';  
      url=url+'&scope=openid+Mail.Read Contacts.Read offline_access';
      system.debug('=============url in loginpage function'+url);
      pagereference p=new pagereference(url);
      return p;
  }
  public void getcode()
  {
      codevalue=ApexPages.currentPage().getParameters().get('code');
      getAccessToken();
  }
  public HttpResponse getAccessToken()
  {
      system.debug('===============in accesstoken function');
      string endpoint1='https://login.microsoftonline.com/common/oauth2/v2.0/token?';
      endpoint='client_id='+'33fd62e9-69a6-4c00-88e8-4cc982398d24' +'&client_secret='+'lTPI36%_-$bkiullSUXD545';
      endpoint=endpoint+'&code='+codevalue;
      endpoint=endpoint+'&redirect_uri='+callback;
      endpoint=endpoint+'&grant_type=authorization_code';
      Http p=new Http();
      HttpRequest request=new HttpRequest();
      request.setEndpoint(endpoint1);
      request.setbody(endpoint);
      request.setMethod('POST');
      request.setHeader('Content-Type','application/x-www-form-urlencodedkey');
      HttpResponse response=p.send(request);
      result=response.getBody();
      system.JSONParser jp=json.createParser(result);
      while(jp.nextToken()!=Null){
          if(jp.getText()=='access_Token'){
              jp.nextToken();
              accesstoken=jp.getText();
          }
      }
      
      system.debug('=========result===='+result);
      system.debug('========accesstoken'+accesstoken);
    getcontacts();
      return response;
  }
    
  public HttpResponse getcontacts()
  {
     string name='';
     Http p=new Http();
     HttpRequest request=new HttpRequest();
     string endpoint='https://graph.microsoft.com/v1.0/me/contacts?';
      endpoint=endpoint+'$select=displayName,surname,emailAddresses';
     request.setEndpoint(endpoint);
     request.setMethod('GET');
     request.setHeader('authorization','Bearer'+accesstoken);
     request.setHeader('Accept','application/json');
     HttpResponse response=p.send(request) ;
      
     contacts1=response.getBody();
     system.debug('==========contacts1'+contacts1);
     system.JSONParser jp=json.createParser(contacts1);
      system.debug('jp======='+jp);
      while(jp.nextToken()!=null){
          if(jp.getText()=='displayName'){
             jp.nextToken();
             name=jp.getText();
             system.debug('name===='+name);
             names_list.add(name);
              system.debug('=====NAMES lIST===='+names_list);
          }
          if(jp.getText()=='emailAddresses'){
              jp.nextToken();
              While(jp.getText()!='address'){
                  jp.nextToken();
              }
              jp.nextToken();
              system.debug('text1 '+jp.getText());
              email_address=jp.getText();
              system.debug('email============='+email_address);
              email_address_list.add(email_address); 
            }
          }
       for(integer i=0;i<names_list.size();i++)
       {
           system.debug('==============in for loop');
               contact c=new contact();
               c.LastName=names_list[i];
               c.Email=email_address_list[i];
               system.debug('============coontact added'+c);
               contact_list.add(c);
               system.debug('===========contact list'+contact_list);
       }
       if(contact_list==null)
           system.debug('==============List is empty');
      else
         insert contact_list;
      return response;
  }
}