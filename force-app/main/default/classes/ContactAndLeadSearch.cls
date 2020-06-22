public class ContactAndLeadSearch {
 
    public static List<List< SObject>> searchContactsAndLeads(String input) {
        
        //Create list of two lists, one for Contacts and the second for Leads
        List<List<SObject>> searchResults = [FIND :input
                                            IN NAME FIELDS
                                            RETURNING Contact(Name), Lead(Name)];
        
        //Place list of contacts at position 1 and leads at 2
        Contact[] searchContacts = (Contact[])searchResults[0];
        Lead[] searchLeads = (Lead[])searchResults[1];
        
        //return the two lists - I think this is where the problem is.
        return searchResults;
        
    }
}