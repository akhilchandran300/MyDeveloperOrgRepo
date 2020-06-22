public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer no, String lastName )
    {
        List<Contact> listContacts = new List<Contact>();
        
        for(Integer i=1;i<=no;i++)
        {
            Contact newContact = new Contact();
            newContact.FirstName = 'Test ' + i; 
            newContact.LastName = lastName;
            listContacts.add(newContact);
        }
        return listContacts;
    }

}