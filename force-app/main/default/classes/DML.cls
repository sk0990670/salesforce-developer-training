public class DML {
    
    public static void doInsert(String name, String description, String rating, Decimal annualRevenue, String recordTypeName) {
        
        for (Integer i = 0; i <= 10; i++) {  // ✅ Fixed loop condition
            Account accountRecord = new Account();
            accountRecord.Name = name + ' ' + i;
            accountRecord.SLA__c = 'Silver';
            accountRecord.SLAExpirationDate__c = System.Today().addDays(30); 
            accountRecord.SLASerialNumber__c = '1234567890';
            accountRecord.Description = description; 
            accountRecord.Rating = rating;
            accountRecord.Industry = 'Technology';
            accountRecord.AnnualRevenue = annualRevenue;

            // Step 1: Get the Record Type ID (using variable binding correctly)
            RecordType recordType = [SELECT Id 
                                     FROM RecordType 
                                     WHERE DeveloperName = :recordTypeName 
                                     AND SobjectType = 'Account'
                                     LIMIT 1];

            // Step 2: Associate the Record with Record Type
            accountRecord.RecordTypeId = recordType.Id;
            insert accountRecord;
            System.debug(accountRecord.Id);
        }

    }
}