import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {
    message;
    ShowHide = true;

    constructor(){
        super();
        console.log('Parent component constructor called');
        this.message = 'Hello from Parent Component';
        console.log('Parent Constructor');
    }

        connectedCallback(){
        console.log('Parent connecteCallback called');
        
    }

    errorCallback(error, stack){
        console.log('Parent errorCallback called');
        console.log('Error: ' + error);
        console.log('Stack: ' + stack);
    }

    handleClick(event){
        this.ShowHide = !this.ShowHide;
    }
}