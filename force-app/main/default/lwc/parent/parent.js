import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {
    message;

    constructor(){
        super();
        console.log('Parent component constructor called');
        this.message = 'Hello from Parent Component';
        console.log('Parent Constructor');
    }

        connectedCallback(){
        console.log('Parent connecteCallback called');
        
    }


}