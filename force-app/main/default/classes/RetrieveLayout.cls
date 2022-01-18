public class RetrieveLayout {
    public static MetadataService.MetadataPort createService()
	{ 
		MetadataService.MetadataPort service = new MetadataService.MetadataPort();
		service.SessionHeader = new MetadataService.SessionHeader_element();
		service.SessionHeader.sessionId = UserInfo.getSessionId();
		return service;		
	}
public static void readAndUpdateLayout()
    {
        MetadataService.MetadataPort service = createService();

        // Create Button
        MetadataService.WebLink webLink = new MetadataService.WebLink();
        webLink.fullName = 'Test__c.googleButton';
        webLink.availability = 'online';
        webLink.displayType = 'button';
        webLink.encodingKey = 'UTF-8';
        webLink.hasMenubar = false;
        webLink.hasScrollbars = true;
        webLink.hasToolbar = false;
        webLink.height = 600;
        webLink.isResizable = true;
        webLink.linkType = 'url';
        webLink.masterLabel = 'google';
        webLink.openType = 'newWindow';
        webLink.position = 'none';
        webLink.protected_x = false;
        webLink.showsLocation = false;
        webLink.showsStatus = false;
        webLink.url = 'http://www.google.com';
        webLink.width = 600;
        // Read the Layout
    MetadataService.Layout layout =
        (MetadataService.Layout) service.readMetadata('Layout',new String[] { 'Account-Account Layout' }).getRecords()[0];
          
System.debug('layout=======>>>>>>>>>'+layout);
    
    }
}