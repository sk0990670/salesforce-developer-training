public class LibraryBook {
    public String title;
    public String author;
    public String isbn;
    public Boolean isCheckedOut;
    public Date dueDate;
    public String borrowerName;

    // Constructor
    public LibraryBook(String bookTitle, String bookAuthor, String bookIsbn) {
        if (String.isBlank(bookTitle)) {
            throw new IllegalArgumentException('Title is required');
        }
        if (String.isBlank(bookAuthor)) {
            throw new IllegalArgumentException('Author is required');
        }
        if (!validateISBN(bookIsbn)) {
            throw new IllegalArgumentException('Invalid ISBN format');
        }

        this.title = bookTitle;
        this.author = bookAuthor;
        this.isbn = bookIsbn;
        this.isCheckedOut = false;
        this.dueDate = null;
        this.borrowerName = null;
    }

    // Method to check out a book
    public Boolean checkOut(String borrower) {
        if (String.isBlank(borrower)) {
            System.debug('Error: Invalid borrower name');
            return false;
        }
        if (this.isCheckedOut) {
            System.debug('Error: Book already checked out to ' + this.borrowerName);
            return false;
        }

        this.isCheckedOut = true;
        this.borrowerName = borrower;
        this.dueDate = Date.today().addDays(14);
        System.debug('Book checked out to ' + borrower + ' on ' + Date.today() + ', due ' + this.dueDate);
        return true;
    }

    // Method to return a book
    public Boolean returnBook() {
        if (!this.isCheckedOut) {
            System.debug('Error: Book was not checked out');
            return false;
        }

        this.isCheckedOut = false;
        this.borrowerName = null;
        this.dueDate = null;
        System.debug('Book returned on ' + Date.today());
        return true;
    }

    // Method to check if a book is overdue
    public Boolean isOverdue() {
        if (!this.isCheckedOut || this.dueDate == null) {
            return false;
        }
        return this.dueDate < Date.today();
    }

    // Static method to validate ISBN format
    public static Boolean validateISBN(String isbn) {
        if (String.isBlank(isbn)) return false;

        String cleanISBN = isbn.replaceAll('[\\s-]', '');
        if (cleanISBN.length() != 10 && cleanISBN.length() != 13) {
            return false;
        }
        if (cleanISBN.length() == 10 && !Pattern.matches('^[0-9]{9}[0-9Xx]$', cleanISBN)) {
            return false;
        }
        if (cleanISBN.length() == 13 && !Pattern.matches('^[0-9]{13}$', cleanISBN)) {
            return false;
        }
        return true;
    }

    // Method to get days until due
    public Integer getDaysUntilDue() {
        if (!this.isCheckedOut || this.dueDate == null) {
            return null;
        }
        return this.dueDate.daysBetween(Date.today());
    }

    // Method to get book summary
    public String getBookSummary() {
        return this.title + ' by ' + this.author + ' (ISBN: ' + this.isbn + ')';
    }

    // Method to get checkout information
    public String getCheckoutInfo() {
        if (this.isCheckedOut && this.dueDate != null) {
            String formattedDate = this.formatDate(this.dueDate);
            return 'Checked out to ' + this.borrowerName + ', due ' + formattedDate;
        } else {
            return 'Available for checkout';
        }
    }

    // Private helper method to format date as yyyy-MM-dd
    private String formatDate(Date inputDate) {
        String year = String.valueOf(inputDate.year());
        String month = inputDate.month() < 10 ? '0' + inputDate.month() : String.valueOf(inputDate.month());
        String day = inputDate.day() < 10 ? '0' + inputDate.day() : String.valueOf(inputDate.day());
        return year + '-' + month + '-' + day;
    }
}