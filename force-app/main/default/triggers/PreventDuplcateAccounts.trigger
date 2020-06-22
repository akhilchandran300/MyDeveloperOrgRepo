trigger PreventDuplcateAccounts on Account (before insert) 
{
    list<string> accNames=new list<string>();
    for(Account acc:trigger.new)
    {
        accNames.add(acc.name);
    }
    list<Account> listOfDuplicateAccounts=[select id,name from Account where name in :accNames];
    for(Account account:trigger.new)
    {
        if(listOfDuplicateAccounts.size()!=0)
        {
            account.addError('Account already exists with this name');
        }
        break;
    }
}