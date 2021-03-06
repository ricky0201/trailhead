/**
 * Trailhead
 * Module: Apex と .NET の基本
 * 非同期 Apex の使用
 */

// Queueable Apex の呼び出す例：
// List<Contact> contacts = [SELECT Id, LastName, FirstName, Email FROM Contact WHERE Is_Active__c = true];
// Id jobId = System.enqueueJob(new MyQueueableClass(contacts));

public class MyQueueableClass implements Queueable {

    private List<Contact> contacts;

    // Constructor for the class, where we pass
    // in the list of contacts that we want to process
    public MyQueueableClass(List<Contact> myContacts) {
        contacts = myContacts;
    }
    
    public void execute(QueueableContext context) {
        // Loop through the contacts passed in through
        // the constructor and call a method
        // which contains the code to do the actual callout
        for (Contact con: contacts) {
            // String response = anotherClass.calloutMethod(con.Id, con.FirstName, con.LastName, con.Email);

            // May still want to add some code here to log
            // the response to a custom object
        }
    }
}
