import { LightningElement } from 'lwc';

export default class ContactList extends LightningElement {
    contacts = [
        {
            Id: '00301',
            Name: 'John Doe',
            Title: 'Software Engineer',
            Email: 'john@example.com',
            Phone: '123-456-7890',
            Department: 'IT'
        },
        {
            Id: '00302',
            Name: 'Mary Smith',
            Title: 'Manager',
            Email: 'mary@example.com',
            Phone: '987-654-3210',
            Department: 'HR'
        }
    ];
}
