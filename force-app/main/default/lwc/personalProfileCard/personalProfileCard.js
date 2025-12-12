import { LightningElement } from 'lwc';

export default class PersonalProfileCard extends LightningElement {
    profile = {
        fullName: 'Sujeet Kumar',
        jobTitle: 'Salesforce Developer',
        email: 'sujeet.kumar@example.com',
        phone: '+91 70048 47226',
        imageUrl: 'https://media.istockphoto.com/id/116192438/photo/one-indian-it-software-engineer-white-collar-worker-computer-people.webp?a=1&b=1&s=612x612&w=0&k=20&c=yCT6pKSUFtfymcCnUzx6SeSqS8yrWLDeVYZH8mOcJ3c=',
        bio: 'Passionate Salesforce Admin & Developer, exploring LWC and modern web technologies.'
    };

    get mailtoLink() {
        return `mailto:${this.profile.email}`;
    }

    get telLink() {
        // remove spaces for tel link
        const cleanPhone = this.profile.phone.replace(/\s+/g, '');
        return `tel:${cleanPhone}`;
    }
}
