public class RTAcreateOpenPositon {
    
    @InvocableMethod
    public static void createPosition(List<RTAinvocableRequest> invocableRequests){
        
        List<Position__c> newPositions=new List<Position__c>();
        
        for(RTAinvocableRequest position:invocableRequests){
            Position__c newPosition=new Position__c(Name=position.name,
                                                    Status__c='Open',
                                                    Positon__c=position.position,
                                                    Open_Date__c=Date.today(),
                                                    Description__c=position.description,
                                                    Min_Salary__c=position.minSalary,
                                                    Max_Salary__c=position.maxSalary                            
            );
            newPositions.add(newPosition); 
        }
        insert newPositions;
            
        }

}