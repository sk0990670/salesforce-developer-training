import { LightningElement } from 'lwc';

export default class UserDetails extends LightningElement {
    userInformation = {
        name: 'Sujeet Kumar',
        email: 'sujeet.kumar@example.com',
        phone: '+1-202-555-0143',
        address: '1234 Elm Street, Springfield, IL 62704',
        photoUrl: 'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        isAdmin: true,
        isManager: false,
        isEmployee: true
    };
}