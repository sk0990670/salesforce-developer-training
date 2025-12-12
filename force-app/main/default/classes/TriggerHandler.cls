public abstract class TriggerHandler {
    //context variable
    protected List<SObject> newRecords;
    protected Map<Id, SObject> oldMap;
    protected Map<Id, SObject> newMap;
    protected System.TriggerOperation triggerOperation;
    
    public TriggerHandler(){
        this.newRecords = Trigger.New;
        this.oldMap = Trigger.oldMap;
        this.newMap = Trigger.newMap;
        this.triggerOperation = Trigger.OperationType;
    }
    
    protected abstract Map<Id, SObject> filterRecords(); 
    //this is the method which is always implemented by the child class.
    
    protected abstract void execute();
    
    protected virtual Boolean hasFieldChanged(String fieldName){
        if(oldMap == null) return true; //Insert Operation
        
        for(SObject newRecord : newRecords){
            SObject oldRecord = oldMap.get(newRecord.Id);
            if(newRecord.get(fieldName) != oldRecord.get(fieldName)){
                return true;
            }
        }
        return false;
    }
    
    protected virtual List<SObject> getChangedRecords(String fieldName) {
        List<SObject> changedRecords = new List<SObject>();
        
        if(oldMap == null) return newRecords; //Insert Operation
        
        for(SObject newRecord : newRecords){
            SObject oldRecord = oldMap.get(newRecord.Id);
            if(newRecord.get(fieldName) != oldRecord.get(fieldName)){
                changedRecords.add(newRecord);
            }
        }
        return changedRecords;
    }
}