public class StudentLockerManager {
    public static void manageLockers() {
        System.debug('=== STUDENT LOCKER ASSIGNMENTS ===');
        
        // 1. Create locker assignments map
        Map<String, String> lockerAssignments = new Map<String, String>();
        
        // 2. Assign initial lockers
        lockerAssignments.put('Emma', '101');
        lockerAssignments.put('Liam', '205');
        lockerAssignments.put('Sophia', '312');
        System.debug('Initial assignments: ' + lockerAssignments);
        
        // 3. Change Emma's locker assignment
        lockerAssignments.put('Emma', '150');
        System.debug('After changing Emma\'s locker: ' + lockerAssignments);
        
        // 4. Add new student Noah
        lockerAssignments.put('Noah', '208');
        System.debug('After adding Noah: ' + lockerAssignments);
        
        // 5. Check Sophia's locker number
        String sophiaLocker = lockerAssignments.get('Sophia');
        System.debug('Sophia\'s locker number: ' + sophiaLocker);
        
        // 6. Check if Oliver has a locker
        Boolean hasOliver = lockerAssignments.containsKey('Oliver');
        System.debug('Does Oliver have a locker? ' + hasOliver);
        
        // 7. Get list of all students with lockers
        Set<String> studentsWithLockers = lockerAssignments.keySet();
        System.debug('Students with locker assignments: ' + studentsWithLockers);
        
        // 8. Add new student Ava
        lockerAssignments.put('Ava', '403');
        System.debug('After adding Ava: ' + lockerAssignments);
        
        // 9. Count total assignments
        System.debug('Total locker assignments: ' + lockerAssignments.size());
    }
}