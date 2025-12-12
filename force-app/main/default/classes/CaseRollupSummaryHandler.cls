public class CaseRollupSummaryHandler extends TriggerHandler {
    
    // Filter records that need processing
    public override Map<Id, SObject> filterRecords() {
        Map<Id, SObject> caseRecordToProcess = new Map<Id, SObject>();
        
        for (Case caseRecord : (List<Case>) newMap.values()) {
            if (caseRecord.AccountId != null) {
                caseRecordToProcess.put(caseRecord.Id, caseRecord);
            }
        }
        
        return caseRecordToProcess;
    }
    
    // Business logic execution
    protected override void execute() {
        /** Business Logic **/
    }
}