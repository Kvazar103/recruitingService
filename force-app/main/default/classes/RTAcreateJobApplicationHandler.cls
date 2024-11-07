public class RTAcreateJobApplicationHandler {
    
    public static void createThreeInterviews(){
        
        List<Job_Application__c> jobApplications=[SELECT Id,Stage__c,Position__c,Candidate__c FROM Job_Application__c 
                                     WHERE Id IN:Trigger.new LIMIT 200];
        
        List<Interview__c> newInterviews=new List<Interview__c>();
        
        for(Job_Application__c ja:jobApplications){
            Interview__c cvInterview=new Interview__c(Job_Application__c=ja.Id,
                                                    Interview_Date__c=Date.today().addDays(5),
                                                   	Type__c='CV Review');
            newInterviews.add(cvInterview);
            
            Interview__c personalInterview=new Interview__c(Job_Application__c=ja.Id,
                                                    Interview_Date__c=Date.today().addDays(10),
                                                   	Type__c='Personal Interview');
            newInterviews.add(personalInterview);
            
            Interview__c testTaskInterview=new Interview__c(Job_Application__c=ja.Id,
                                                    Interview_Date__c=Date.today().addDays(15),
                                                   	Type__c='Test task review');
            
            newInterviews.add(testTaskInterview);
        }
        
        if(newInterviews!=null){
            insert newInterviews;
        }
    
        
    }

}