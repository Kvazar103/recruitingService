public class RTAjobApplicationHiredHandler {
    
    public static void jobApplicationHired(){
        List<Job_Application__c> hiredJobApplications=[SELECT Id,Stage__c,Position__c FROM Job_Application__c 
                                                       WHERE Stage__c='Last stage - Hired' AND Id IN:Trigger.new LIMIT 200];
        
        Set<Id> positionsId=new Set<Id>();
        List<Position__c> positionsToUpdate=new List<Position__c>();
        
        if(hiredJobApplications!=null){
            for(Job_Application__c ja:hiredJobApplications){
                positionsId.add(ja.Position__c);
            }
        }
        if(positionsId!=null){
            for(Position__c position:[SELECT Id,Status__c FROM Position__c WHERE Id IN:positionsId]){
                position.Status__c='Closed';
                positionsToUpdate.add(position);
            }
        }
        if(positionsToUpdate!=null){
            update positionsToUpdate;
        }
        
    }
    

}