trigger OpportunityTrigger on Opportunity (before insert) {

    Set<Id> accountIdsSet = new Set<Id>();
    for(Opportunity opp: Trigger.New){
        if(opp.AccountId <> null){
            accountIdsSet.add(opp.AccountId);
        }
    }

    List<Account> accountList = [SELECT Id, Name, Description 
                                 FROM Account 
                                 WHERE Id IN :accountIdsSet]; // ABC, XYZ

    for(Opportunity opp: Trigger.New){ // Salesforce.com --> ABC, Google.com --> XYZ
        
        if(opp.Amount != null && opp.Discount__c != null){
            Decimal discountAmount = (opp.Amount * opp.Discount__c)/100;
            Decimal discountedAmount = opp.Amount - discountAmount;
            opp.Amount_After_Discount__c = discountedAmount;
        }

        if(opp.AccountId <> null){ // ABC
            for(Account acc: accountList){ // XYZ, ABC
                if(acc.Id == opp.AccountId){
                    opp.Description = acc.Description; // ✅ Now Works
                }
            }
        }
    }
}