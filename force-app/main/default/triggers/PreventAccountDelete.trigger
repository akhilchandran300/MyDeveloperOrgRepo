trigger PreventAccountDelete on Account (before delete) 
{
	Map<Id, Account> mappedContacts = new Map<Id, Account>([Select Id, (Select Id from contacts) from Account where id in :Trigger.OLD]);
  	for(Account acc : Trigger.new)
	{
    	if(mappedContacts.get(acc.id).contacts.size()>1)
    	{
        	acc.adderror('Account cannot be deleted as it has two or more contacts.');
    	}
	}      
}