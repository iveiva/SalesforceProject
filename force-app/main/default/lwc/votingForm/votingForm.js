import { LightningElement, track} from 'lwc';
import getVotingOptions from '@salesforce/apex/VotingOptionsController.getVotingOptions';

export default class VotingForm extends LightningElement {
    @track value = '';
    @track votingOptions = []; 

    get options() {
        return this.votingOptions;
    }

    connectedCallback(){
        getVotingOptions()
        .then( result => {
            let arr = [];
            for(var i = 0; i < result.lenght; i++){
                arr.push({label: result[i].Name, value: result[i].Id})
            }
            this.votingOptions = arr;
        })
    }

    handleChange(e) {
        this.value = e.detail.value;
    }


}