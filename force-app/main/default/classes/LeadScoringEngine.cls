public class LeadScoringEngine {
    public static Integer calculateLeadScore(Lead ld) {
        Integer score = 0;
        
        // Add 20 points if lead source is "Website" OR "Referral"
        if ((ld.LeadSource ?? '').toLowerCase() == 'website' || (ld.LeadSource ?? '').toLowerCase() == 'referral') {
            score += 20;
        }
        
        // Add 15 points if company size > 100 AND industry is "Technology"
        if ((ld.NumberOfEmployees ?? 0) > 100 && ((ld.Industry ?? '').toLowerCase() == 'technology')) {
            score += 15;
        }
        
        // Add 10 points if annual revenue > 500,000
        if ((ld.AnnualRevenue ?? 0) > 500000) {
            score += 10;
        }
        
        // Add 25 points if lead has both email AND phone
        if (((ld.Email ?? '') != '') && ((ld.Phone ?? '') != '')) {
            score += 25;
        }
        
        // Subtract 10 points if lead is NOT qualified (Status != 'Qualified')
        if (((ld.Status ?? '').toLowerCase()) != 'qualified') {
            score -= 10;
        }
        
        // Add 5 points for each completed activity (safe navigation)
        Integer completedActivities = (ld.ActivityHistories?.size() ?? 0);
        score += completedActivities * 5;
        
        // Clamp score between 0 and 100
        score = Math.max(0, Math.min(score, 100));
        
        return score;
    }
    
    public static Map<String, List<Lead>> categorizeLeads(List<Lead> leads) {
        Map<String, List<Lead>> categorized = new Map<String, List<Lead>>{
            'Hot' => new List<Lead>(),
            'Warm' => new List<Lead>(),
            'Cold' => new List<Lead>()
        };
        
        for (Lead ld : leads) {
            Integer score = calculateLeadScore(ld);
            if (score >= 70) {
                categorized.get('Hot').add(ld);
            } else if (score >= 40) {
                categorized.get('Warm').add(ld);
            } else {
                categorized.get('Cold').add(ld);
            }
        }
        
        return categorized;
    }
}