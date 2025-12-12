import { LightningElement, api, wire, track } from 'lwc';

export default class HelloWorld extends LightningElement {

    ShowTom=false;
    ShowJerry=false;

    @api accountName = 'Salesforce';

    person = {
        name: 'Amit Singh',
        age: 90,
        isAdmin: true,
        salary: 1_000_000,

        hobbies: ['Reading','Writing','Coding','Gaming','Cooking','Dancing','Singing','Painting','Drawing'],

        address: {
            city: 'Delhi',
            state: 'Delhi',
            country: 'India'
        }
    };

    @track
    employees = [
        {name: 'john', age: 30, id: 1},
        {name: 'doe', age: 25, id: 2},
        {name: 'smith', age: 28, id: 3}
    ];
}