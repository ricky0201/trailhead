/**
 * Trailhead
 * Module: Apex と .NET の基本
 * 非同期 Apex の使用
 */
/**
 * global class MyBatchableClass implements Database.Batchable<sObject>, Database.Stateful{}
 * global Database.QueryLocator start(Database.BatchableContext bc){}
 * global void execute(Database.BatchableContext bc, List<Account> scope){}
 * global void finish(Database.BatchableContext bc){}
 */ 
global class MyBatchableClass implements
            Database.Batchable<sObject>,
            Database.Stateful {
    // Database.Stateful
    // If you specify Database.Stateful in the class definition, you can maintain state across these transactions. 
    // When using Database.Stateful, only instance member variables retain their values between transactions. 
    // Static member variables don’t retain their values and are reset between transactions. 
    // Maintaining state is useful for counting or summarizing records as they’re processed. 
    // For example, suppose your job processed Account records. You could define a method in execute to aggregate 
    // totals of the Account amounts as they were processed.

    // Used to record the total number of Accounts processed
    global Integer numOfRecs = 0;
    
    // Used to gather the records that will be passed to the interface method
    // This method will only be called once and will return either a
    // Database.QueryLocator object or an Iterable that contains the records
    // or objects passed to the job.            
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, Name FROM Account');                
    }
    // This is where the actual processing occurs as data is chunked into
    // batches and the default batch size is 200.
    global void execute(Database.BatchableContext bc, List<Account> scope) {
        for (Account acc : scope) {
            // Do some processing here
            // and then increment the counter variable
            numOfRecs = numOfRecs + 1;
        }     
    }
    // Used to execute any post-processing that may need to happen. This
    // is called only once and after all the batches have finished.
    global void finish(Database.BatchableContext bc) {
        EmailManager.sendMail('someAddress@somewhere.com',
                              numOfRecs + ' Accounts were processed!',
                              'Meet me at the bar for drinks to celebrate');            
    }
}
