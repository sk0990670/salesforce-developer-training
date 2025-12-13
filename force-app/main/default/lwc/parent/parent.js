import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {
    message;
    ShowHide = true;
    isRendered = false;

    constructor(){
        super();
        console.log('Parent component constructor called');
        this.message = 'Lifecycle Hook methods are called in the following order: Constructor -> connectedCallback -> renderedCallback';
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
        this.message = Math.random().toString();
    }

    renderedCallback(){
        if(this.isRendered){
            return;
        }
        this.isRendered = true;
        console.log('Parent renderedCallback called');
        this.loadThirdPartyLibrary();
    }

    loadThirdPartyLibrary(){
        console.log('Parent loadThirdPartyLibrary called');
    }
}