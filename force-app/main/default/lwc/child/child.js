import { api, LightningElement } from 'lwc';

export default class Child extends LightningElement {

    @api message;
    constructor(){
        super();
        console.log('Child component constructor called');
        console.log('child message: ' + this.message);
    }
}