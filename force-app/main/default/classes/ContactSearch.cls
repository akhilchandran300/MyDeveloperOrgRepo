public class ContactSearch
{
	public static List<Contact> searchForContacts(String lastName, String mailingPostalCode)
	{
        List<Contact> matchedContacts = [SELECT Name FROM Contact WHERE (MailingPostalCode=:mailingPostalCode AND LastName=:lastName)];
        return matchedContacts;
	}
}