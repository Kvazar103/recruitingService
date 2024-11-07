trigger RTApositionClosed on Position__c (before update,after update) {
    
    if(Trigger.isAfter && Trigger.isUpdate){
        RTApositonClosedHelper.updateCloseDatePosition();
    }

}