public class Skoda extends Car {
    
	public Skoda(String name,
                 String model,
                 String makeyear,
                 String manufacturer,
                 Decimal price){
                     super(name);
                 }
    public Skoda(String name, string model){
        super(name, model);
    }
    
    //override
    public override void start(){
        System.debug('I am inside child class ');
        System.debug('My Car is awesome');
        System.debug(this.name+ 'is starting wit a music');
        System.debug('The model of my car is ' + this.model);
    }
}