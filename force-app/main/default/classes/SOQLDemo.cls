public class SOQLDemo {

    // 1. Search Account by Name or Partial Name
    public static void searchAccount(String accName) {
        List<Account> accList = [
            SELECT Id, Name, Phone, Industry
            FROM Account
            WHERE Name LIKE :('%' + accName + '%')
        ];
        System.debug('Accounts Found: ' + accList);
    }

    // 2. Polymorphic Query using TYPEOF
    public static void polymorphicQueryDemo() {
    List<Event> events = [
        SELECT Id, Subject,
            TYPEOF What
                WHEN Account THEN Id, Name, Phone, Industry
                WHEN Opportunity THEN Id, Name, Amount
                WHEN Case THEN Id, CaseNumber, Subject, Status
            END,
            TYPEOF Who
                WHEN Contact THEN Id, Name, Email, Phone
            END
        FROM Event
        WHERE (WhatId != NULL OR WhoId != NULL)
        LIMIT 50
    ];
    System.debug('Polymorphic Event Data: ' + events);
}


    // 3. SOQL For Loop Demo
    public static void soqlForLoopDemo() {
        for (Account acc : [SELECT Id, Name FROM Account]) {
            System.debug('Account: ' + acc.Name);
        }
        for (Contact con : [SELECT Id, Name FROM Contact]) {
            System.debug('Contact: ' + con.Name);
        }
        for (Opportunity opp : [SELECT Id, Name FROM Opportunity]) {
            System.debug('Opportunity: ' + opp.Name);
        }
    }

    // 4. Filter by Industries and Name Keyword
    public static void filterAccountByIndustryAndName(List<String> industries, String keyword) {
        List<Account> accList = [
            SELECT Id, Name, Industry
            FROM Account
            WHERE Industry IN :industries
            AND Name LIKE :('%' + keyword + '%')
        ];
        System.debug('Filtered Accounts: ' + accList);
    }

    // 5. Relationship Queries
    public static void relationshipQueriesDemo() {
        // Contacts without Account
        List<Contact> conWithoutAcc = [
            SELECT Id, Name FROM Contact WHERE AccountId = NULL
        ];
        System.debug('Contacts without Account: ' + conWithoutAcc);

        // Contacts with Account
        List<Contact> conWithAcc = [
            SELECT Id, Name, Account.Name FROM Contact WHERE AccountId != NULL
        ];
        System.debug('Contacts with Account: ' + conWithAcc);

        // Accounts without Contact
        List<Account> accWithoutContact = [
            SELECT Id, Name 
            FROM Account 
            WHERE Id NOT IN (SELECT AccountId FROM Contact)
        ];
        System.debug('Accounts without Contact: ' + accWithoutContact);

        // Accounts with at least one Contact
        List<Account> accWithContact = [
            SELECT Id, Name 
            FROM Account 
            WHERE Id IN (SELECT AccountId FROM Contact)
        ];
        System.debug('Accounts with Contact: ' + accWithContact);

        // Invoice → Account → Parent Account
        List<Invoice__c> invoices = [
            SELECT Id, Name, Account__r.Name, Account__r.Parent.Name
            FROM Invoice__c
        ];
        System.debug('Invoices with Account & Parent: ' + invoices);

        // Invoice Line Item → Invoice → Account → Parent Account
        List<Invoice_Line_Item__c> invLineItems = [
            SELECT Id, Name, 
                Invoice__r.Name, 
                Invoice__r.Account__r.Name, 
                Invoice__r.Account__r.Parent.Name
            FROM Invoice_Line_Item__c
        ];
        System.debug('Invoice Line Items with related hierarchy: ' + invLineItems);
    }

    // 6. Max Opportunity Amount
    public static void maxOpportunityAmount() {
        AggregateResult[] result = [
            SELECT MAX(Amount) maxAmt FROM Opportunity
        ];
        System.debug('Max Opportunity Amount: ' + result[0].get('maxAmt'));
    }

    // 7. Find Duplicate Contacts by Name & Email
    public static void findDuplicateContacts() {
        AggregateResult[] dupes = [
            SELECT Name, Email, COUNT(Id) cnt
            FROM Contact
            GROUP BY Name, Email
            HAVING COUNT(Id) > 1
        ];
        System.debug('Duplicate Contacts: ' + dupes);
    }

    // 8. Count of Accounts by Industry
    public static void countAccountsByIndustry() {
        AggregateResult[] counts = [
            SELECT Industry, COUNT(Id) cnt
            FROM Account
            GROUP BY Industry
        ];
        System.debug('Account Count by Industry: ' + counts);
    }
}