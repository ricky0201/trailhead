/**
 * Trailhead
 * Module: Apex と .NET の基本
 * 実行コンテキストの理解
 */
@isTest
private class AccountTriggerTest {

    @isTest static void test1(){

        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account ' + i);
            acct.BillingState = 'CA';
            accts.add(acct);
        }              
        Test.startTest();
        insert accts;
        Test.stopTest();

        List<Account> verifyAccts = [SELECT Id, ShippingState FROM Account];
        System.assertEquals(200, verifyAccts.size());
        for (Account a : verifyAccts) {
            System.assertEquals('CA', a.ShippingState); 
        } 
        
    }
}
