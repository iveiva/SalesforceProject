public with sharing class VotingOptionsController {
    @AuraEnabled(cacheable=true)
    public static List<Voting_Option__c> getVotingOptions() {
        List<Voting_Option__c> votingOptions = [
            SELECT Name
            FROM Voting_Option__c
            //WHERE Voting__r.Id = :votingId
            WITH SECURITY_ENFORCED
       ];
        return votingOptions;

    }
}

 //SELECT Name FROM Voting_Option__c WHERE Voting__r.Name = 'V-0001'