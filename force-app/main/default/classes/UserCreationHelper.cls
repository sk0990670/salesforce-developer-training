public class UserCreationHelper {
    @future
    public static void createUser() {
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard Platform User'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='CEO'];

        User usr = new User(
            alias = 'test',
            email = 'test@example.com',
            emailencodingkey = 'UTF-8',
            lastname = 'TestUser',
            languagelocalekey = 'en_US',
            localesidkey = 'en_US',
            profileid = p.Id,
            userroleid = r.Id,
            timezonesidkey = 'America/Los_Angeles',
            username = 'test@example.com.solo' // username must be unique otherwise it will throw an error
        );
        insert usr; // Now executes in separate transaction
    } // close method
} // close class