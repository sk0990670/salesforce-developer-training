import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

// Object & field schema imports
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';

export default class LdsCreateRecord extends LightningElement {

    isLoading = false;

    handleSave() {
        this.isLoading = true;

        // Step 1: Prepare fields object
        const fields = {
            FirstName: 'Amit',
            LastName: 'Singh',
            Phone: '9876543210',
            AccountId: '001gL00000r77dQAB',
            Title: 'Salesforce Architect'
        };

        // Dynamic field assignment (BEST PRACTICE)
        fields[EMAIL_FIELD.fieldApiName] = 'asingh@gmail.com';

        // Step 2: Prepare record input
        const recordInput = {
            apiName: CONTACT_OBJECT.objectApiName,
            fields: fields
        };

        // Step 3: Create record using LDS
        createRecord(recordInput)
            .then(result => {
                console.log('Contact Created Successfully');
                console.log('Record Id:', result.id);
            })
            .catch(error => {
                console.error('Error while creating contact');
                console.error(error);
            })
            .finally(() => {
                this.isLoading = false;
            });
    }
}
