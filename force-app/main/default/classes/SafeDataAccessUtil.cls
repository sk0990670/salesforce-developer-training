public class SafeDataAccessUtil {
    public static Map<String, Object> extractOpportunityDetails(Opportunity opp) {
        Map<String, Object> result = new Map<String, Object>();

        // Account name with default
        String accountName = opp.Account?.Name ?? 'No Account';
        result.put('AccountName', accountName);

        // Primary contact's email (query contacts separately to avoid error)
        String contactEmail = 'No Email';
        if (opp.AccountId != null) {
            List<Contact> contacts = [SELECT Email FROM Contact WHERE AccountId = :opp.AccountId LIMIT 1];
            contactEmail = (contacts.size() > 0) ? contacts[0].Email ?? 'No Email' : 'No Email';
        }
        result.put('PrimaryContactEmail', contactEmail);

        // Owner's manager name with fallbacks
        String managerName = opp.Owner?.Manager?.Name ?? opp.Owner?.Name ?? 'No Manager';
        result.put('OwnerManagerName', managerName);

        // Close date formatted as string or default
        String closeDateStr = opp.CloseDate != null ? String.valueOf(opp.CloseDate) : 'No Date';
        result.put('CloseDate', closeDateStr);

        return result;
    }

    public static Map<String, Object> calculateAccountMetrics(List<Account> accounts) {
        Map<String, Object> metrics = new Map<String, Object>();

        // Average annual revenue excluding nulls
        Decimal totalRevenue = 0;
        Integer countRevenue = 0;
        Map<String, Integer> industryCount = new Map<String, Integer>();
        Integer countBillingAddress = 0;

        for (Account acc : accounts) {
            if (acc.AnnualRevenue != null) {
                totalRevenue += acc.AnnualRevenue;
                countRevenue++;
            }
            if (acc.BillingStreet != null || acc.BillingCity != null || acc.BillingState != null || acc.BillingPostalCode != null || acc.BillingCountry != null) {
                countBillingAddress++;
            }
            String industry = acc.Industry ?? 'Unknown';
            industryCount.put(industry, (industryCount.get(industry) ?? 0) + 1);
        }

        Decimal avgRevenue = (countRevenue > 0) ? totalRevenue / countRevenue : 0;

        // Most common industry
        String mostCommonIndustry = 'Unknown';
        Integer maxCount = 0;
        for (String ind : industryCount.keySet()) {
            if (industryCount.get(ind) > maxCount) {
                maxCount = industryCount.get(ind);
                mostCommonIndustry = ind;
            }
        }

        metrics.put('AverageAnnualRevenue', avgRevenue);
        metrics.put('CountWithBillingAddress', countBillingAddress);
        metrics.put('MostCommonIndustry', mostCommonIndustry);

        return metrics;
    }
}