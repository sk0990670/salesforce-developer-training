public class LeadTriggerHandler {

    // Trigger handler for After Insert event
    public static void handlerAfterInsert(List<Lead> newLeadRecords, Map<Id, Lead> newLeadMap) {
        checkDuplicateBasedOnCompanyAndEmail(newLeadRecords);
    }

    // Method to prevent duplicate Lead records based on Email and Company
    public static void checkDuplicateBasedOnCompanyAndEmail(List<Lead> newLeadRecords) {
        // Sets to store new Lead Company names and Emails
        Set<String> newCompanyNameSet = new Set<String>();
        Set<String> newEmailSet = new Set<String>();

        // Collect non-blank Company names and Emails from new Leads
        for (Lead newLead : newLeadRecords) {
            if (!String.isBlank(newLead.Company)) {
                newCompanyNameSet.add(newLead.Company);
            }
            if (!String.isBlank(newLead.Email)) {
                newEmailSet.add(newLead.Email);
            }
        }

        // If no company name and no email found, stop
        if (newCompanyNameSet.isEmpty() && newEmailSet.isEmpty()) {
            return;
        }

        // Map to store existing Leads with key = Email + Company
        Map<String, Lead> existingLeadMap = new Map<String, Lead>();

        // Query existing Leads that match new Leads by Company and Email
        for (Lead existingLead : [
            SELECT Id, Name, Email, Company
            FROM Lead
            WHERE Company IN :newCompanyNameSet
            AND Email IN :newEmailSet
            AND Id NOT IN :Trigger.New
            ALL ROWS
        ]) {
            String key = existingLead.Email + '-' + existingLead.Company;
            existingLeadMap.put(key, existingLead);
        }

        System.debug('Existing Lead Map: ' + existingLeadMap);

        // Check each new Lead against the existing Lead map
        for (Lead newLead : newLeadRecords) {
            String existingLeadKey = newLead.Email + '-' + newLead.Company;
            Lead existingLead = existingLeadMap.get(existingLeadKey);

            if (existingLead != null) {
                // Duplicate found
                String message = 'Duplicate Lead detected. A Lead with the same Email ('
                    + existingLead.Email + '), and Company name ('
                    + existingLead.Company + ') already exists. Existing Lead: '
                    + existingLead.Id;
                newLead.Email.addError(message);
                newLead.Company.addError(message);
            } else {
                // Add the new lead to the map for further duplicate checks
                existingLeadMap.put(existingLeadKey, newLead);
            }
        }
    }
}