public class ShoppingCart {
    private List<ShoppingCartItem> cartItems;
    private Decimal discountPercentage;
    private Decimal taxRate;

    public ShoppingCart() {
        this.cartItems = new List<ShoppingCartItem>();
        this.discountPercentage = 0;
        this.taxRate = 0;
    }

    public Boolean addItem(String productCode, String productName, Decimal unitPrice, Integer quantity) {
        if (!validateProductCode(productCode)) {
            return false;
        }

        for (ShoppingCartItem item : cartItems) {
            if (item.productCode == productCode) {
                return item.updateQuantity(item.quantity + quantity);
            }
        }

        ShoppingCartItem newItem = new ShoppingCartItem(productCode, productName, unitPrice, quantity);
        cartItems.add(newItem);
        return true;
    }

    public Boolean removeItem(String productCode) {
        for (Integer i = 0; i < cartItems.size(); i++) {
            if (cartItems[i].productCode == productCode) {
                cartItems.remove(i);
                return true;
            }
        }
        return false;
    }

    public Boolean updateItemQuantity(String productCode, Integer newQuantity) {
        for (ShoppingCartItem item : cartItems) {
            if (item.productCode == productCode) {
                if (newQuantity == 0) {
                    return removeItem(productCode);
                }
                return item.updateQuantity(newQuantity);
            }
        }
        return false;
    }

    public Decimal calculateSubtotal() {
        Decimal subtotal = 0;
        for (ShoppingCartItem item : cartItems) {
            subtotal += item.totalPrice;
        }
        return subtotal;
    }

    public Boolean applyDiscount(Decimal discountPercent) {
        if (discountPercent == null || discountPercent < 0 || discountPercent > 100) {
            return false;
        }
        this.discountPercentage = discountPercent;
        return true;
    }

    public Decimal calculateTax() {
        Decimal subtotal = calculateSubtotal();
        Decimal discountedSubtotal = subtotal * (1 - discountPercentage / 100);
        return discountedSubtotal * (taxRate / 100);
    }

    public Decimal getFinalTotal() {
        Decimal subtotal = calculateSubtotal();
        Decimal discountAmount = subtotal * (discountPercentage / 100);
        Decimal discountedSubtotal = subtotal - discountAmount;
        Decimal tax = discountedSubtotal * (taxRate / 100);
        return discountedSubtotal + tax;
    }

	public static Boolean validateProductCode(String productCode) {
    if (String.isBlank(productCode)) {
        return false;
    }
    if (productCode.length() < 6 || productCode.length() > 12) {
        return false;
    }

    // Check if first character is a letter
    if (!Pattern.matches('^[A-Za-z].*', productCode)) {
        return false;
    }

    // Check if last character is a digit
    if (!Pattern.matches('.*[0-9]$', productCode)) {
        return false;
    }

    // Ensure only allowed characters (alphanumeric and hyphen)
    if (!Pattern.matches('^[A-Za-z0-9-]+$', productCode)) {
        return false;
    }

    return true;
}


    public Integer getItemCount() {
        return cartItems.size();
    }

    public Integer getTotalQuantity() {
        Integer totalQuantity = 0;
        for (ShoppingCartItem item : cartItems) {
            totalQuantity += item.quantity;
        }
        return totalQuantity;
    }

    public String getCartSummary() {
        Integer itemCount = getItemCount();
        Integer totalQuantity = getTotalQuantity();
        Decimal subtotal = calculateSubtotal();
        Decimal discount = subtotal * (discountPercentage / 100);
        Decimal tax = calculateTax();
        Decimal finalTotal = getFinalTotal();

        return 'Items: ' + itemCount + ', Total Quantity: ' + totalQuantity + ', Subtotal: ' + subtotal +
               ', Discount: ' + discount + ', Tax: ' + tax + ', Final Total: ' + finalTotal;
    }

    public void clearCart() {
        cartItems.clear();
        discountPercentage = 0;
        taxRate = 0;
    }

    public Boolean setTaxRate(Decimal newTaxRate) {
        if (newTaxRate == null || newTaxRate < 0 || newTaxRate > 50) {
            return false;
        }
        this.taxRate = newTaxRate;
        return true;
    }
}