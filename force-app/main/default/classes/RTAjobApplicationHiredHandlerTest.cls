@isTest
public with sharing class RTAjobApplicationHiredHandlerTest {
    
    @isTest
    private static void testJobApplicationHired(){
        Position__c position=new Position__c(Name='test position name',Status__c='Open',
                                             Positon__c='Junior',Open_Date__c=Date.today());
        
        insert position;
        
        Candidate__c candidate=new Candidate__c(Name='First Name',Candidate_Last_Name__c='Last Name',
                                                Email__c='test@gmail.com',Phone__c='099009098',English_Level__c='B2',
                                                Work_Experience__c='1-3 yrs',Date_of_Birth__c=Date.newInstance(2000,09,15));
        
        insert candidate;
        
        Job_Application__c jobApplication=new Job_Application__c(Candidate__c=candidate.Id,Position__c=position.Id,
                                                                 Stage__c='New');
        
        insert jobApplication;
        
        Test.startTest();
        
        jobApplication.Stage__c='Last stage - Hired';
        
        update jobApplication;
        
        Test.stopTest();
        
        Position__c thisPosition=[SELECT Id,Status__c,(SELECT Id,Stage__c FROM Job_Applications__r) 
                                  FROM Position__c WHERE Id=:position.Id];
        
        system.assert(thisPosition!=null);
        system.assertEquals(thisPosition.Status__c,'Closed');
    }

}