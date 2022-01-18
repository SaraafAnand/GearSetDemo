@isTest
public class AnimalLocatorTest {
 
     @isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String res = Animallocator.getAnimalNameById(1);
        
        // Verify response received contains fake values
     //   String contentType = res.getHeader('Content-Type');
       // System.assert(contentType == 'application/json;charset=UTF-8');
        String actualValue = res;
        String expectedValue ='chicken';
        System.assertEquals(actualValue,expectedValue);
        //System.assertEquals(200, res.getStatusCode());
    }
 }