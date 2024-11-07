import { LightningElement ,api} from 'lwc';

export default class ShowCandidateDetailLWC extends LightningElement {

    @api recordId;

    showForm=false;
    buttonName='Show Position Details'

    handleClick(){
        if(!this.showForm){
            this.showForm=true;
            this.buttonName='Hide Position Details'
        }else{
            this.showForm=false;
            this.buttonName='Show Position Details';
        }
    }
}