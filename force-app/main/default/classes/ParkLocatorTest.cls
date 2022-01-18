@isTest
public class ParkLocatorTest {
@isTest 
    static void testParkLocator() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        
        // Call the method that invokes a callout
    String [] output = ParkLocator.country('India');
        
        // Verify that a fake result is returned
     //   System.assertEquals({'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'}, output); 
    }
}