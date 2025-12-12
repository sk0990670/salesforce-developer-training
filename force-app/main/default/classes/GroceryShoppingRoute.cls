public class GroceryShoppingRoute {
    public static void planRoute() {
        System.debug('=== GROCERY SHOPPING ROUTE ===');
        
        // 1. Create shopping route
        List<String> shoppingRoute = new List<String>{'Produce', 'Dairy', 'Meat', 'Bakery', 'Checkout'};
        System.debug('Initial route: ' + shoppingRoute);
        
        // 2. Insert "Frozen Foods" before "Bakery"
        Integer bakeryIndex = shoppingRoute.indexOf('Bakery');
        shoppingRoute.add(bakeryIndex, 'Frozen Foods');
        System.debug('After adding Frozen Foods: ' + shoppingRoute);
        
        // 3. Add "Customer Service" at the beginning
        shoppingRoute.add(0, 'Customer Service');
        System.debug('After adding Customer Service: ' + shoppingRoute);
        
        // 4. Check if "Pharmacy" is in the route
        Boolean hasPharmacy = shoppingRoute.contains('Pharmacy');
        System.debug('Need to visit Pharmacy? ' + hasPharmacy);
        
        // 5. Find what section comes 3rd
        String thirdSection = shoppingRoute.get(2);
        System.debug('3rd section in route: ' + thirdSection);
        
        // 6. Remove "Produce" (finished shopping there)
        shoppingRoute.remove(shoppingRoute.indexOf('Produce'));
        System.debug('After finishing Produce section: ' + shoppingRoute);
        
        // 7. Add "Self-Checkout" as alternative
        shoppingRoute.add('Self-Checkout');
        System.debug('After adding Self-Checkout: ' + shoppingRoute);
        
        // 8. Count remaining sections
        System.debug('Sections still to visit: ' + shoppingRoute.size());
    }
}