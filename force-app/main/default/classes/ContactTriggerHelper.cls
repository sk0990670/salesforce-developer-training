public class ContactTriggerHelper {
    public static void countContact(Map<Id, Account> idToAccountMap ){
                    List<AggregateResult> aggregateResults = [                 
                SELECT count(Id), count(Email), AccountId                  
                FROM Contact                  
                WHERE AccountId IN : idToAccountMap.keySet()                 
                GROUP BY AccountId             
            ];             

            for(AggregateResult ar: aggregateResults){                 
                Integer totalCount = (Integer)ar.get('expr0');                 
                Integer totalContactsWithEmail = (Integer)ar.get('expr1');                 
                Id accountId = (Id)ar.get('AccountId'); 
				idToAccountMap.put(accountId,  new Account (Id = accountId,  Total_no_of_Contacts__c = totalCount));             
             
            }
            update idToAccountMap.values();
    }
}