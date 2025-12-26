import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import TYPE_FIELD from "@salesforce/schema/Account.Type";

const DUMMY_RECORDTYPE_ID = '012000000000000AAA';


export default class UiObjectInfoApi extends LightningElement {

    get options() {
        return [
            { label: 'Prospect', value: 'Prospect' },
            { label: 'Customer-Direct', value: 'Customer-Direct' },
            { label: 'Customer-Indirect', value: 'Customer-Indirect' },
            { label: 'Partner', value: 'Partner' },
            { label: 'Other', value: 'Other' }
        ];
    }

    connectedCallback(){
        console.log('ACCOUNT_OBJECT', ACCOUNT_OBJECT);
        console.log('TYPE_FIELD', TYPE_FIELD);
    }

    @wire(getObjectInfo, { objectApiName: '$objectInfo' })
    wiredObjectInfo({data, error}){
        if(data){
            console.log('Object ', data);
        }
        else if(error){
            console.error(error)
        }
    }

    @wire(getPicklistValues, { recordTypeId: DUMMY_RECORDTYPE_ID, fieldApiName: '$fieldInfo' })
    wiredPicklistValues({data, error}){
        // let 
        if(data){
            console.log('field ', data);

        }
        else if(error){
            console.error('error ', error)
        }
    }
}
