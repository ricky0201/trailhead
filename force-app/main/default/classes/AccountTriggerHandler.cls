/**
 * Trailhead
 * Module: Apex と .NET の基本
 * 実行コンテキストの理解
 */
public with sharing class AccountTriggerHandler {

    public static void CreateAccounts (List<Account> accts) {

        for (Account a : accts) {
            a.ShippingState = a.BillingState;
        }

    }
}
