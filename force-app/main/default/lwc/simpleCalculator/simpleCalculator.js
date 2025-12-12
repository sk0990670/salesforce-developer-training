import { LightningElement } from 'lwc';

export default class SimpleCalculator extends LightningElement {
    number1 = 0;
    number2 = 0;
    result = '';

    handleNumber1(event) {
        this.number1 = Number(event.target.value);
    }

    handleNumber2(event) {
        this.number2 = Number(event.target.value);
    }

    handleAdd() {
        this.result = this.number1 + this.number2;
    }

    handleMinus() {
        this.result = this.number1 - this.number2;
    }

    handleMultiply() {
        this.result = this.number1 * this.number2;
    }

    handleDivide() {
        if (this.number2 === 0) {
            this.result = 'Cannot divide by 0';
        } else {
            this.result = this.number1 / this.number2;
        }
    }
}
