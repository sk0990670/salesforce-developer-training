public class LeadTriggerDispatcher {
    public static void dispatch(System.TriggerOperation operationType) {
        switch on operationType {
            WHEN BEFORE_INSERT {
                // Call handler class methods
                LeadTriggerHandler.checkDuplicateBasedOnCompanyANDEmail(Trigger.New);
            }
            WHEN AFTER_INSERT {
                LeadTriggerHandler.handlerAfterInsert(
                    Trigger.New,
                    (Map<Id, Lead>) Trigger.newMap
                );
            }
        }
    }
}