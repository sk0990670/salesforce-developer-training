trigger ContactTrigger on Contact (after insert, after delete, after undelete, after update) {      
    switch on Trigger.operationType {
        WHEN AFTER_INSERT, AFTER_UNDELETE { //because Insert and undelete is quite similar              
            /** Count the total no of contacts under the account */             
            // count, sum, min, max, avg --> Aggregate Query             
            Set<Id> accountIdsSet = new Set<Id>();             
            for(Contact con: Trigger.New){                 
                if(con.AccountId <> null){                     
                    accountIdsSet.add(con.AccountId);                 
                }             
            }             

            List<AggregateResult> aggregateResults = [                 
                SELECT count(Id), count(Email), AccountId                  
                FROM Contact                  
                WHERE AccountId IN :accountIdsSet                  
                GROUP BY AccountId             
            ];             

            List<Account> accountListToUpdate = new List<Account>();             
            for(AggregateResult ar: aggregateResults){                 
                Integer totalCount = (Integer)ar.get('expr0');                 
                Integer totalContactsWithEmail = (Integer)ar.get('expr1');                 
                Id accountId = (Id)ar.get('AccountId');                 
                accountListToUpdate.add(                     
                    new Account(                         
                        Id = accountId,                         
                        Total_no_of_Contacts__c = totalCount                     
                    )                 
                );             
            }             
            update accountListToUpdate;         
        }         

        WHEN AFTER_UPDATE {             
            /**              
            Account can be changed on the Contact Record             
            From one account to another account             
            From one account to blank account             
            **/             
            Set<Id> accountIdsSet = new Set<Id>();             
            for(Contact newContact: Trigger.New){                                  
                Contact oldContact = Trigger.oldMap.get(newContact.Id);                 
                if(oldContact.AccountId <> newContact.AccountId){                     
                    if(oldContact.AccountId != null){                         
                        accountIdsSet.add(oldContact.AccountId); // Decrease number                     
                    }                     
                    if(newContact.AccountId != null){                         
                        accountIdsSet.add(newContact.AccountId); // Increase number                     
                    }                 
                }             
            }             

            List<AggregateResult> aggregateResults = [                 
                SELECT count(Id), count(Email), AccountId                  
                FROM Contact                  
                WHERE AccountId IN :accountIdsSet                  
                GROUP BY AccountId             
            ];             

            List<Account> accountListToUpdate = new List<Account>();             
            for(AggregateResult ar: aggregateResults){                 
                Integer totalCount = (Integer)ar.get('expr0');                 
                Integer totalContactsWithEmail = (Integer)ar.get('expr1');                 
                Id accountId = (Id)ar.get('AccountId');                 
                accountListToUpdate.add(                     
                    new Account(                         
                        Id = accountId,                         
                        Total_no_of_Contacts__c = totalCount                     
                    )                 
                );             
            }             
            update accountListToUpdate;         
        }         

        WHEN AFTER_DELETE {
            Map<Id, Account> idToAccountMap = new Map<Id, Account>();

           
            for(Contact con: Trigger.Old){                 
                if(con.AccountId != null){                     
                    idToAccountMap.put(con.AccountId, 
                                       new Account(id = con.AccountId, 
                                                   Total_no_of_Contacts__c =0));
                }             
            }             

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
}