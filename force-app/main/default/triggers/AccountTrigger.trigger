/**
 * Trailhead
 * Module: Apex と .NET の基本
 * 実行コンテキストの理解
 */
// trigger AccountTrigger on Account (before insert, before update, before
//     delete, after insert, after update, after delete,  after undelete) {
//     if (Trigger.isAfter && Trigger.isInsert) {
//         AccountHandler.CreateNewOpportunity(Trigger.New);
//     }
// }

trigger AccountTrigger on Account (before insert) {

    if (Trigger.isBefore && Trigger.isInsert){
        AccountTriggerHandler.CreateAccounts(Trigger.New);
    } 
}
