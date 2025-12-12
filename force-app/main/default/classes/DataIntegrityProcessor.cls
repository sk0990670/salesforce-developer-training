public class DataIntegrityProcessor {

    public class ValidationResult {
        public String accountName;
        public String accountNum;    // renamed from number to avoid reserved word
        public String industry;
        public Decimal revenue;
        public Boolean active;
        public String validationStatus;

        public ValidationResult(String name, String accNum, String industry, Decimal revenue, Boolean active, String status) {
            this.accountName = name;
            this.accountNum = accNum;
            this.industry = industry;
            this.revenue = revenue;
            this.active = active;
            this.validationStatus = status;
        }
    }

    public class ValidationSummary {
        public Integer validCount = 0;
        public Integer invalidCount = 0;
        public Map<String, List<ValidationResult>> groupedByStatus = new Map<String, List<ValidationResult>>();
        public Decimal totalRevenueValid = 0;
        public Decimal totalRevenueInvalid = 0;
    }

    public static ValidationSummary validateAndProcessAccounts(List<Account> accounts) {
        ValidationSummary summary = new ValidationSummary();
        summary.groupedByStatus.put('Valid', new List<ValidationResult>());
        summary.groupedByStatus.put('Invalid', new List<ValidationResult>());

        for (Account acc : accounts) {
            Boolean isValid = true;

            // Account must have name AND (phone OR website)
            isValid = isValid && ((acc.Name ?? '') != '') && (((acc.Phone ?? '') != '') || ((acc.Website ?? '') != ''));

            // If annual revenue exists, it must be greater than 0
            if (acc.AnnualRevenue != null) {
                isValid = isValid && (acc.AnnualRevenue > 0);
            }

            // Billing address required for enterprise accounts (Type="Customer" AND employees > 500)
            if (((acc.Type ?? '').toLowerCase()) == 'customer' && (acc.NumberOfEmployees ?? 0) > 500) {
                Boolean hasBilling = ((acc.BillingStreet ?? '') != '') || ((acc.BillingCity ?? '') != '') || ((acc.BillingState ?? '') != '') || ((acc.BillingPostalCode ?? '') != '') || ((acc.BillingCountry ?? '') != '');
                isValid = isValid && hasBilling;
            }

            // Industry must not be null for technology companies
            if (((acc.Industry ?? '').toLowerCase()) == 'technology') {
                isValid = isValid && ((acc.Industry ?? '') != '');
            }

            String status = isValid ? 'Valid' : 'Invalid';

            if (isValid) {
                summary.validCount++;
                summary.totalRevenueValid += (acc.AnnualRevenue ?? 0);
            } else {
                summary.invalidCount++;
                summary.totalRevenueInvalid += (acc.AnnualRevenue ?? 0);
            }

            ValidationResult vr = new ValidationResult(
                acc.Name ?? 'No Name',
                acc.AccountNumber ?? 'No Account Number',
                acc.Industry ?? 'No Industry',
                acc.AnnualRevenue ?? 0,
                false, // no active field included
                status
            );

            summary.groupedByStatus.get(status).add(vr);
        }
        return summary;
    }

    public static void processOpportunityChain(Account acc) {
        Map<String, Decimal> pipelineByStage = new Map<String, Decimal>();

        for (Opportunity opp : acc.Opportunities ?? new List<Opportunity>()) {
            String stage = opp.StageName ?? 'Unknown';
            Decimal amount = opp.Amount ?? 0;

            pipelineByStage.put(stage, (pipelineByStage.get(stage) ?? 0) + amount);
        }

        Decimal totalPipeline = 0;
        Decimal closedPipeline = 0;
        for (String stage : pipelineByStage.keySet()) {
            totalPipeline += pipelineByStage.get(stage);
            if (stage.toLowerCase().contains('closed') || stage.toLowerCase().contains('won')) {
                closedPipeline += pipelineByStage.get(stage);
            }
        }

        // Check if custom fields exist before assigning
        // Replace 'Total_Pipeline__c' and 'Closed_Pipeline__c' with your actual custom field API names if different

        try {
            acc.put('Total_Pipeline__c', totalPipeline);
            acc.put('Closed_Pipeline__c', closedPipeline);
        } catch(Exception e) {
            System.debug('Custom fields Total_Pipeline__c or Closed_Pipeline__c not found on Account object.');
        }
    }
}