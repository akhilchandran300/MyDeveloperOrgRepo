trigger CreateAccountForHighRevenueAccount on Account (after insert) 
{
    List<Contact> listOfContacts = new List<Contact>();
    for(Account acc:Trigger.NEW)
    {
        if(acc.AnnualRevenue > 1000000)
        {
            Contact newContact = new Contact();
        	newContact.AccountId = acc.id;
        	newContact.LastName = acc.Name;
        	newContact.Phone = acc.Phone;
        	listOfContacts.add(newContact);
        }
    }
    insert listOfContacts;
}