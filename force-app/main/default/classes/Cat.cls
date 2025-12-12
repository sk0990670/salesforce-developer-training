public class Cat extends Animal {
    
    public Cat(String name, String color){
        super(name, color);
    }
	
    public override void sleep(){
        System.debug(this.name + 'is Sleeping');
        //makeSound(); or we can use
        super.makeSound();//Recomended
    }
}