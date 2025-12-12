public class Customer {
    public String firstName;
    String lastName;
    String email;
    Decimal totalPurchases;
    Boolean isNewUser;
    
    public static String address;

    public void sayHello(){
        System.debug(this);
        this.greetings();
        System.debug('WITHOUT USING THIS KEYWORD');
        greetings();
        add(90,34,34);
    }

    private void greetings(){
        System.debug('Hello I am from Method');
        System.debug('Below are the Customer Details');
        System.debug('firstName: ' + this.firstName);
        System.debug('lastName: ' + this.lastName);
        System.debug('email: ' + this.email);
        System.debug('address: ' + address);
        System.debug('totalpurchase: ' + this.totalPurchases);
    }

    public String hello(String name){
        return 'Hello ' + name;
    }

    /** Default Constructor */
    public Customer() {
        System.debug('Inside default constructor');
    }

    /** Parameterized Constructor */
    public Customer(String firstName, String lastName, String email, Boolean isNewUser){
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.isNewUser = isNewUser;
        System.debug('Inside 4-param Constructor: ' + this.firstName);
    }

    /** Overloaded Constructor with 2 parameters */
    public Customer(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
        System.debug('Inside 2-param Constructor: ' + this.firstName + ' ' + this.lastName);
    }

    /** Static Method */
    public static Integer add(Integer a, Integer b, Integer c){
        System.debug('Inside static method. Address: ' + address);
        return a + b + c;
    }
}