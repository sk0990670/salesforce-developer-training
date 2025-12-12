public class WorkoutEquipmentTracker {
    public static void trackEquipment() {
        System.debug('=== WORKOUT EQUIPMENT TRACKER ===');
        
        // 1. Create initial equipment set
        Set<String> equipment = new Set<String>{'Dumbbells', 'Treadmill', 'Yoga Mat'};
        System.debug('Initial equipment: ' + equipment);
        
        // 2. Add new equipment
        equipment.add('Resistance Bands');
        equipment.add('Kettlebell');
        equipment.add('Pull-up Bar');
        System.debug('After adding new equipment: ' + equipment);
        
        // 3. Try to add "Dumbbells" again (inventory check)
        Boolean addedDumbbells = equipment.add('Dumbbells');
        System.debug('Added Dumbbells again? ' + addedDumbbells);
        
        // 4. Check if "Rowing Machine" is available
        Boolean hasRowingMachine = equipment.contains('Rowing Machine');
        System.debug('Do you have a Rowing Machine? ' + hasRowingMachine);
        
        // 5. Remove "Treadmill" (sold it)
        equipment.remove('Treadmill');
        System.debug('After selling Treadmill: ' + equipment);
        
        // 6. Add "Exercise Bike"
        equipment.add('Exercise Bike');
        System.debug('After adding Exercise Bike: ' + equipment);
        
        // 7. Try adding "Yoga Mat" again (double-checking)
        Boolean addedYogaMat = equipment.add('Yoga Mat');
        System.debug('Added Yoga Mat again? ' + addedYogaMat);
        
        // 8. Count unique equipment
        System.debug('Total unique equipment pieces: ' + equipment.size());
    }
}