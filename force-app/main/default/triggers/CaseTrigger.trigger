trigger CaseTrigger on Case (after insert) {
	if(CaseTriggerHandler.runOnce){
		return;
	}

	List<Case> caseList = new List<Case>(); 
    
    for(Case c: Trigger.New){
        Case caseRecord = new Case();
        caseRecord.Subject = c.Subject;
        caseRecord.Description = c.Description;
        caseRecord.Priority = c.Priority;
        caseRecord.Status = c.Status;
        caseRecord.ContactId = c.ContactId;
        
        //finally add this caseRecord to the List
        caseList.add(caseRecord);
    }
    CaseTriggerHandler.runOnce = True;
    insert caseList;
}