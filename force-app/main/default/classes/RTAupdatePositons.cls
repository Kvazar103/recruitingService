public class RTAupdatePositons {
    
    public static void updatePositions(){
        
        List<Position__c> openPositions=[SELECT Id,Name,Description__c,Max_Salary__c,Min_Salary__c,Status__c 
                                             FROM Position__c WHERE Status__c='Open'];
        
        List<Position__c> positionsToUpdate=new List<Position__c>();
        
        for(Position__c position:openPositions){
            if(position.Description__c.contains('dev')){
                position.Min_Salary__c=position.Min_Salary__c * 1.10;
                position.Max_Salary__c=position.Max_Salary__c * 1.10;
                positionsToUpdate.add(position);
            }
        }
        
        update positionsToUpdate;
    }

}