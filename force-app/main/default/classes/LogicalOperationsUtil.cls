public class LogicalOperationsUtil {

    // Method 1: Evaluate Account Status based on picklist values
    public static String evaluateAccountStatus(Account acc) {
        if (acc.IsActive__c == 'Yes' && acc.AnnualRevenue > 1000000) {
            return 'Premium';
        } else if (acc.IsActive__c == 'Yes' || acc.NumberOfEmployees > 100) {
            return 'Standard';
        } else if (acc.IsActive__c == 'No') {
            return 'Inactive';
        } else {
            return 'Unknown';
        }
    }

    // Method 2: Validate Contact Information
    public static Boolean validateContactInformation(Contact con) {
        Boolean hasEmailOrPhone = !String.isBlank(con.Email) || !String.isBlank(con.Phone);
        Boolean hasValidAccount = con.AccountId != null && con.Account.IsActive__c == 'Yes';
        Boolean hasValidName = !String.isBlank(con.FirstName) || !String.isBlank(con.LastName);

        return hasEmailOrPhone && hasValidAccount && hasValidName;
    }
}