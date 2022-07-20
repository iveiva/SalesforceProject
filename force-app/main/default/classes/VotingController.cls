public with sharing class VotingController {
    @AuraEnabled(cacheable=true)
    public static List<Voting__c> getVotingSubject(){
        return [SELECT Subject__c FROM Voting__c];
        //WHERE Id = :votingId];

    }
}