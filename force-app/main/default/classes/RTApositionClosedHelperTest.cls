@isTest
public with sharing class RTApositionClosedHelperTest {
    
    @isTest
    private static void testPositionClose(){
        
        Position__c newPosition=new Position__c(Name='test name',Status__c='Open',Positon__c='Junior',Open_Date__c=Date.today());
        
        insert newPosition;
        
        Test.startTest();
        
        newPosition.Status__c='Closed';
        update newPosition;
        
        Test.stopTest();
        
        Position__c thisPosition=[SELECT Id,Closed_Date__c FROM Position__c WHERE Id=:newPosition.Id];
        
        system.assert(thisPosition!=null);
        system.assertEquals(thisPosition.Closed_Date__c,Date.today());
        
    }
    
    

}