Public Class ContactListController{
    transient Public List<contact> ContactList;
    public String base64Value{get;set;}
public String contentType{get;set;}
    public pagereference pageOut(){
       String format = ApexPages.currentPage().getParameters().get('format');
       pagereference pageRef = ApexPages.currentPage();
       pageRef.getParameters().put('format',format);
       pageRef.setRedirect( false );
       return pageRef;
   }
   public List<contact> getContactList(){
       ContactList = [select id, name, owner.name, Account.Name from Contact];
       if(ContactList.size() != 0)
        return ContactList;
       else
        return null;
   }
    
public void loadAttachment(){
    System.debug('sdfg');
   Attachment att = [Select Id, Body, ContentType From Attachment limit 1];
   base64Value = EncodingUtil.base64Encode(att.Body);
   contentType = att.ContentType;
}
}