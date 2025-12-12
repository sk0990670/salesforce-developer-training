public class DailyToDoManager {
    public static void manageTasks() {
        System.debug('=== DAILY TO-DO LIST MANAGER ===');
        
        // 1. Create morning tasks list
        List<String> todoList = new List<String>{'Check emails', 'Drink coffee', 'Review calendar'};
        System.debug('Initial tasks: ' + todoList);
        
        // 2. Add "URGENT: Call dentist" at the beginning
        todoList.add(0, 'URGENT: Call dentist');
        System.debug('After adding urgent task: ' + todoList);
        
        // 3. Insert "Take vitamins" between "Drink coffee" and "Review calendar"
        Integer coffeeIndex = todoList.indexOf('Drink coffee');
        todoList.add(coffeeIndex + 1, 'Take vitamins');
        System.debug('After adding vitamins: ' + todoList);
        
        // 4. Check if "Exercise" is on the list
        Boolean hasExercise = todoList.contains('Exercise');
        System.debug('Is Exercise on the list? ' + hasExercise);
        
        // 5. Find position of "Drink coffee"
        Integer coffeePosition = todoList.indexOf('Drink coffee');
        System.debug('Position of Drink coffee: ' + coffeePosition);
        
        // 6. Complete first task (remove it)
        String completedTask = todoList.remove(0);
        System.debug('Completed task: ' + completedTask);
        System.debug('Remaining tasks: ' + todoList);
        
        // 7. Add "Prepare dinner" at the end
        todoList.add('Prepare dinner');
        System.debug('After adding dinner prep: ' + todoList);
        
        // 8. Show remaining task count
        System.debug('Total tasks remaining: ' + todoList.size());
    }
}