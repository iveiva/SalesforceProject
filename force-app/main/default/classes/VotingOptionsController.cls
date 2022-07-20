public with sharing class VotingOptionsController {

    @AuraEnabled(cacheable=true)
    public static List<Voting_Option__c> getNumberOfVotes(){
        return [SELECT Voting__r.Subject__c , Number_of_Votes__c, Name FROM Voting_Option__c];
    }  
    

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

