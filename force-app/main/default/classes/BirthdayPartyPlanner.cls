// Birthday Party Guest List using Set
public class BirthdayPartyPlanner {
    public static void manageguestList() {
        // 1. Create a set of confirmed guests
        Set<String> confirmedGuests = new Set<String>{'Alice', 'Bob', 'Charlie'};
        System.debug('Initial guest list: ' + confirmedGuests);
        
        // 2. Try to add "Alice" again (duplicate will be ignored)
        Boolean addedAlice = confirmedGuests.add('Alice');
        System.debug('Added Alice again? ' + addedAlice);
        System.debug('Guest list after trying to add Alice: ' + confirmedGuests);
        
        // 3. Add three more unique guests
        confirmedGuests.add('Diana');
        confirmedGuests.add('Emma');
        confirmedGuests.add('Frank');
        System.debug('After adding Diana, Emma, Frank: ' + confirmedGuests);
        
        // 4. Check if "Bob" is coming to the party
        Boolean isBobComing = confirmedGuests.contains('Bob');
        System.debug('Is Bob coming? ' + isBobComing);
        
        // 5. Charlie can't make it - remove him
        confirmedGuests.remove('Charlie');
        System.debug('After removing Charlie: ' + confirmedGuests);
        
        // 6. Alice calls again to confirm (try adding once more)
        Boolean addedAliceAgain = confirmedGuests.add('Alice');
        System.debug('Added Alice again? ' + addedAliceAgain);
        
        // 7. Count unique guests
        System.debug('Total unique guests attending: ' + confirmedGuests.size());
    }
}