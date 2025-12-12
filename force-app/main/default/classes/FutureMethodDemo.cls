public class FutureMethodDemo {
    
    // FutureMethodDemo.myMethod()
    @future
    public static void myMethod(Id recordId){
        System.debug('inside my method');
		myMethod1();        
    }
    
    @future
    public static void myMethod1(){
        System.debug('inside my method');
    }
}