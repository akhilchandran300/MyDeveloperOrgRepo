trigger UpdateOpportunityCity on Account(after update)
{
    List<Opportunity> oppo = new List<Opportunity>();
        List<Account> relatedAccount = new List<Account>([SELECT Id, City__c, (SELECT Id,City__c FROM Opportunities)
                                       From Account WHERE Id IN :Trigger.New]);
        for(Account acc : relatedAccount) {
            for(Opportunity opps : acc.Opportunities) {
                opps.City__c = acc.City__c;
                oppo.add(opps);
            }
        }
        if(oppo.size() > 0)
            update oppo;
}