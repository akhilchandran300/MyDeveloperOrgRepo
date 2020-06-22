@isTest
public class TestRestrictContactByName {
 @isTest static void testCallout()
 {
     Contact newContact = new Contact();
     newContact.lastName = 'INVALIDNAME';
     insert newContact;
 }
}