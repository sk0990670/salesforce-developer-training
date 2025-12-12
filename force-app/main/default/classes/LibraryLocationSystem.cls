public class LibraryLocationSystem {
    public static void manageBookLocations() {
        System.debug('=== LIBRARY BOOK LOCATION SYSTEM ===');
        
        // 1. Create book location map
        Map<String, String> bookLocations = new Map<String, String>();
        
        // 2. Add initial books
        bookLocations.put('Moby Dick', 'A-12');
        bookLocations.put('1984', 'B-08');
        bookLocations.put('Hamlet', 'C-15');
        System.debug('Initial book locations: ' + bookLocations);
        
        // 3. Move "1984" to new shelf
        bookLocations.put('1984', 'B-10');
        System.debug('After moving 1984: ' + bookLocations);
        
        // 4. Add new book
        bookLocations.put('The Catcher in the Rye', 'A-18');
        System.debug('After adding The Catcher in the Rye: ' + bookLocations);
        
        // 5. Find Hamlet's location
        String hamletLocation = bookLocations.get('Hamlet');
        System.debug('Hamlet is located at: ' + hamletLocation);
        
        // 6. Check if "To Kill a Mockingbird" is in system
        Boolean hasMockingbird = bookLocations.containsKey('To Kill a Mockingbird');
        System.debug('Is To Kill a Mockingbird in system? ' + hasMockingbird);
        
        // 7. Get list of all book titles
        Set<String> allBookTitles = bookLocations.keySet();
        System.debug('All books in library database: ' + allBookTitles);
        
        // 8. Add "Pride and Prejudice"
        bookLocations.put('Pride and Prejudice', 'C-22');
        System.debug('After adding Pride and Prejudice: ' + bookLocations);
        
        // 9. Count total books
        System.debug('Total books tracked in system: ' + bookLocations.size());
    }
}