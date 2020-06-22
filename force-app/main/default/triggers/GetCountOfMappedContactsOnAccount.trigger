trigger GetCountOfMappedContactsOnAccount on Contact (after insert,after delete)
{
    Set<id> accIdSet = new Set<id>();  
    for(Contact acc : (Trigger.isDelete ? Trigger.old : Trigger.new))  
   		{  
          accIdSet.add(acc.AccountId);  
    	} 
    List<Account> accountsToUpdate = new List<Account>([SELECT Id, Count__c, (SELECT Id FROM Contacts) FROM Account where Id in :accIdSet]);
    for(Account acct : accountsToUpdate){
        List<Contact> contactList = acct.Contacts;
        if(contactList!=null){
            acct.Count__c = Integer.valueOf(contactList.size());
        }
    }
    update accountsToUpdate;
 
}