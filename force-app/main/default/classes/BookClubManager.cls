public class BookClubManager {
    public static void manageReadingList() {
        System.debug('=== BOOK CLUB READING LIST ===');
        
        // 1. Start with initial book suggestions
        Set<String> readingList = new Set<String>{'1984', 'Pride and Prejudice', 'The Hobbit'};
        System.debug('Initial reading list: ' + readingList);
        
        // 2. Try to add "1984" again (duplicate)
        Boolean added1984 = readingList.add('1984');
        System.debug('Added 1984 again? ' + added1984);
        System.debug('Reading list after duplicate attempt: ' + readingList);
        
        // 3. Add new suggestions
        readingList.add('Dune');
        readingList.add('Jane Eyre');
        readingList.add('To Kill a Mockingbird');
        System.debug('After adding new books: ' + readingList);
        
        // 4. Check if "Harry Potter" is in the list
        Boolean hasHarryPotter = readingList.contains('Harry Potter');
        System.debug('Is Harry Potter in the list? ' + hasHarryPotter);
        
        // 5. Remove "The Hobbit" (too long)
        readingList.remove('The Hobbit');
        System.debug('After removing The Hobbit: ' + readingList);
        
        // 6. Try adding "Pride and Prejudice" again
        Boolean addedPride = readingList.add('Pride and Prejudice');
        System.debug('Added Pride and Prejudice again? ' + addedPride);
        
        // 7. Add "The Great Gatsby"
        readingList.add('The Great Gatsby');
        System.debug('After adding The Great Gatsby: ' + readingList);
        
        // 8. Count unique books
        System.debug('Total unique books in reading list: ' + readingList.size());
    }
}