import { api, LightningElement } from 'lwc';

export default class UpdateProfile extends LightningElement {
    @api userId;

    handleUpdateModal(recordId) {
        // Logic to handle profile update modal
        console.log('recordId: ' + recordId);
    }
}