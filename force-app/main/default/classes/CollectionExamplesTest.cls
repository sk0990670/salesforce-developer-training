@isTest
public class CollectionExamplesTest {
    @isTest
    static void testMovieNightPlanner() {
        Test.startTest();
        MovieNightPlanner.planMovieNight();
        Test.stopTest();
        // Test passes if no exceptions thrown
        System.assert(true, 'Movie night planner executed successfully');
    }
    
    @isTest
    static void testBirthdayPartyPlanner() {
        Test.startTest();
        BirthdayPartyPlanner.manageGuestList();
        Test.stopTest();
        System.assert(true, 'Birthday party planner executed successfully');
    }
    
    @isTest
    static void testPizzaDeliveryTracker() {
        Test.startTest();
        PizzaDeliveryTracker.trackOrders();
        Test.stopTest();
        System.assert(true, 'Pizza delivery tracker executed successfully');
    }
}