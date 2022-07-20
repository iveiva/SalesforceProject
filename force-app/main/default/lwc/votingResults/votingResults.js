import { LightningElement, wire } from 'lwc';
import VOTING_SUBJECT_FIELD from '@salesforce/schema/Voting__c.Subject__c';
import VO_NAME_FIELD from '@salesforce/schema/Voting_Option__c.Name';
import NUMBER_OF_VOTES_FIELD from '@salesforce/schema/Voting_Option__c.Number_of_Votes__c';
import getNumberOfVotes from '@salesforce/apex/VotingOptionsController.getNumberOfVotes';

const COLUMNS = [
    { label: 'Subject', fieldName: VOTING_SUBJECT_FIELD.fieldApiName, type: 'text' },
    { label: 'Voting Option', fieldName: VO_NAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Votes', fieldName: NUMBER_OF_VOTES_FIELD.fieldApiName, type: 'text' }
];
export default class VotesList extends LightningElement {
    columns = COLUMNS;
    @wire(getNumberOfVotes)
    votes;
}