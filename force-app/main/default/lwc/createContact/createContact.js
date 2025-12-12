import { LightningElement } from 'lwc';

export default class CreateContact extends LightningElement {
    _options = [
        { label: 'Call', value: 'Call' },
        { label: 'Email', value: 'Email' },
        { label: 'In-Person', value: 'In-Person' },
        { label: 'Other', value: 'Other' }
    ];

    // initialize fields (optional but clear)
    _firstName = '';
    _lastName = '';
    _email = '';
    _phone = '';
    _leadSource = '';
    _isPrimaryContact = false;

    // NOTE: method parameter must be in parentheses (event)
    handleFirstName(event) { //you can write event , evt or e-> it depends upon you
        console.log('handleFirstName');
        console.log(event);
        console.log(event.target);
        console.log(event.target.value);
        console.log('------------------');

        // store the value
        this._firstName = event.target.value;
    }

    handleLastName(event) {
        console.log('handleLastName');
        console.log(event);
        console.log(event.target);
        console.log(event.target.value);
        console.log('------------------');

        this._lastName = event.target.value;
    }

    handleEmail(event) {
        console.log('handleEmail');
        console.log(event);
        console.log(event.target);
        console.log(event.target.value);
        console.log('------------------');

        this._email = event.target.value;
    }

    handlePhone(event) {
        console.log('handlePhone');
        console.log(event);
        console.log(event.target);
        console.log(event.target.value);
        console.log('------------------');

        this._phone = event.target.value;
    }

    handleLeadSource(event) {
        console.log('handleLeadSource');
        console.log(event.target);
        console.log(event.target.value);
        this._leadSource = event.target.value;
    }

    handleIsPrimaryContact(event) {
        console.log('handleIsPrimaryContact');
        console.log(event.target);
        // checkbox uses checked
        this._isPrimaryContact = !!event.target.checked;
    }

    handleMouseOver(event) {
        alert('handleMouseOver');
    }

    handleEnterKey(event) {
        console.log('handleEnterKey');
        alert('Enter key pressed');
        console.log(event.key);
    }

    handleCreateContact(event) {
        console.log('handleCreateContact');
        console.log(this._firstName);
        console.log(this._lastName);
        console.log(this._email);
        console.log(this._phone);
        console.log(this._leadSource);
        console.log(this._isPrimaryContact);
    }

}
