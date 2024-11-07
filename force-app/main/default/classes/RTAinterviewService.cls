public class RTAinterviewService {
    
    public static void createThreeInterviews(Id jobApplicationId){
        
        Interview__c interview=new Interview__c(Job_Application__c=jobApplicationId,
                                               	Interview_Date__c=Date.newInstance(2024,10,10),
                                                Type__c='CV Review'
                                               );
        insert interview;
        
        Interview__c interview2=new Interview__c(Job_Application__c=jobApplicationId,
                                               	Interview_Date__c=Date.newInstance(2024,10,15),
                                                Type__c='Personal Interview'
                                               );
        insert interview2;
        
        Interview__c interview3=new Interview__c(Job_Application__c=jobApplicationId,
                                               	Interview_Date__c=Date.newInstance(2024,10,20),
                                                Type__c='Test task review'
                                               );
        insert interview3;
        
    }
    
    public static void deleteAllInterviewsRelatedToJobApplication(Id jobApplicationId){
        List<Interview__c> interviewsToDelete=[SELECT Id,Name,	Job_Application__c FROM Interview__c WHERE Job_Application__c=:jobApplicationId];
        
        delete interviewsToDelete;
    }
    
    
    
    

}