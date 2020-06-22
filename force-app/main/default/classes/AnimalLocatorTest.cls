@isTest
private class AnimalLocatorTest 
{
    @isTest static  void testGetCallout() 
    {
        // Associate the callout with a mock response using Test Mock Interface
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // Call method to test 
        String result = AnimalLocator.getAnimalNameById(2);
        System.debug(result);      
    }   
}