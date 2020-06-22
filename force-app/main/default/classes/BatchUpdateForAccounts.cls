global class BatchUpdateForAccounts implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
       string query = 'select name from account';
  	   return database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        for(Account a: scope){
  		a.Name = a.Name+' Test';
  		}
  		Update Scope;
    }    
    global List<String> toAddresses = new List<String>{'akhil.c@happiestminds.com'};
    global void finish(Database.BatchableContext bc){
        System.debug('Batch job finished successfully!');
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    	mail.setToAddresses(toAddresses);
      	mail.setReplyTo('akhilchandran300@gmail.com'); 
     	mail.setSenderDisplayName('Akhil C');
      	mail.setSubject('Batch Execution Completed');
      	mail.setPlainTextBody('Batch Job : Update of Account names is completed!');
      	Messaging.sendEmail(new Messaging.Singleemailmessage [] {mail});   
    }    
}