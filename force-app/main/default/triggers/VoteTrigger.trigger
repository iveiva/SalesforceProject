trigger VoteTrigger on Vote__c (before insert) {
    String username = UserInfo.getName();

    List<Voting_Option__c> votes = [SELECT Voting__r.Subject__c , Number_of_Votes__c, Name, (SELECT Voter__c FROM Votes__r 
    WHERE Voter__c LIKE :username) FROM Voting_Option__c];

    //List<Voting_Option__c> votes =[SELECT Voting__r.Subject__c , Number_of_Votes__c, Name, (SELECT Voter__c FROM Votes__r) 
    //FROM Voting_Option__c];
    Map<String, Voting_Option__c> votingOptionsMap = new Map<String, Voting_Option__c>();
    for (Voting_Option__c votingOption : votes){
        votingOptionsMap.put(votingOption.Name, votingOption);
    }


    for (Vote__c vote : Trigger.new){
        String votingOption = vote.Voting_Option__r.Name;
        if (votes.size() > 0 && votingOptionsMap.containsKey(votingOption)){
            vote.addError('You have already voted on this subject');
        }
    }
}