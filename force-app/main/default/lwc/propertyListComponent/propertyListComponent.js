import { LightningElement } from 'lwc';

export default class PropertyListComponent extends LightningElement {

        handleDataChange(event){
            console.log('Data Changed '+Math.random());

            let eventDetails = event.detail;

            console.log('Event Details ',JSON.stringify(eventDetails));
            console.log('Event Source ',event.target);
            console.log('Event Source Property ',event.type);

            let propertyId = eventDetails.propertyId;
            let propertyName = eventDetails.propertyName;
            let propertyPrice = eventDetails.propertyPrice;
            let propertyImageUrl = eventDetails.propertyImageUrl;
            let propertyBedrooms = eventDetails.propertyBedrooms;
            let propertyBathrooms = eventDetails.propertyBathrooms;

            console.log('Property Id '+propertyId);
            console.log('Property Name '+propertyName);
            console.log('Property Price '+propertyPrice);
            console.log('Property Image Url '+propertyImageUrl);
            console.log('Property Bedrooms '+propertyBedrooms);
            console.log('Property Bathrooms '+propertyBathrooms);
        }

}