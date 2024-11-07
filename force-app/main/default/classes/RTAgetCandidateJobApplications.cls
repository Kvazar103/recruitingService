public with sharing class RTAgetCandidateJobApplications {
    @AuraEnabled(cacheable=true)
    public static List<Job_Application__c> getJobApplication(Id candidateId){
        try {
            return [
                SELECT Id,Name,Stage__c
                FROM Job_Application__c
                WHERE Candidate__c=:candidateId
                WITH SECURITY_ENFORCED
                ];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}