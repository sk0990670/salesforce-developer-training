public class ShoppingCartItem {
    public String productCode;
    public String productName;
    public Decimal unitPrice;
    public Integer quantity;
    public Decimal totalPrice;

    public ShoppingCartItem(String code, String name, Decimal price, Integer qty) {
        if (String.isBlank(code)) {
            throw new IllegalArgumentException('Product code cannot be null or empty');
        }
        if (String.isBlank(name)) {
            throw new IllegalArgumentException('Product name cannot be null or empty');
        }
        if (price == null || price <= 0) {
            throw new IllegalArgumentException('Unit price must be positive');
        }
        if (qty == null || qty <= 0) {
            throw new IllegalArgumentException('Quantity must be positive');
        }

        this.productCode = code;
        this.productName = name;
        this.unitPrice = price;
        this.quantity = qty;
        this.totalPrice = price * qty;
    }

    public Boolean updateQuantity(Integer newQuantity) {
        if (newQuantity == null || newQuantity <= 0) {
            return false;
        }

        this.quantity = newQuantity;
        this.totalPrice = this.unitPrice * newQuantity;
        return true;
    }
}