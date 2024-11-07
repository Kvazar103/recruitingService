trigger RTAjobApplicationHired on Job_Application__c (after update) {
    
    if(Trigger.isAfter && Trigger.isUpdate){
        RTAjobApplicationHiredHandler.jobApplicationHired();
    }

}