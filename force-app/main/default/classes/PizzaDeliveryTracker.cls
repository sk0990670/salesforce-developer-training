public class PizzaDeliveryTracker {
    public static void trackOrders() {
        Map<String, String> customerOrders = new Map<String, String>();
        
        customerOrders.put('John', 'Pepperoni');
        customerOrders.put('Sarah', 'Margherita');
        customerOrders.put('Mike', 'Supreme');
        System.debug('Initial orders: ' + customerOrders);
        
        customerOrders.put('John', 'Hawaiian');
        System.debug('After John changed order: ' + customerOrders);
        
        customerOrders.put('Lisa', 'Veggie Deluxe');
        System.debug('After adding Lisa: ' + customerOrders);
        
        String sarahsPizza = customerOrders.get('Sarah');
        System.debug('Sarah ordered: ' + sarahsPizza);
        
        Boolean hasDavidOrder = customerOrders.containsKey('David');
        System.debug('Do we have an order for David? ' + hasDavidOrder);
        
        Set<String> customerNames = customerOrders.keySet();
        System.debug('All customers who placed orders: ' + customerNames);
        
        System.debug('Total number of orders: ' + customerOrders.size());
    }
}