trigger RTAcreateJobApplication on Job_Application__c (after insert) {
    
    if(Trigger.isAfter && Trigger.isInsert){
        RTAcreateJobApplicationHandler.createThreeInterviews();
    }

}