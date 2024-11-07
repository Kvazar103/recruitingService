public with sharing class RTApositonClosedHelper {
    
    public static void updateCloseDatePosition(){
        
        List<Position__c> updatedPositions=[SELECT Id,Status__c,Closed_Date__c,Name FROM Position__c 
                                            WHERE Status__c='Closed' AND Id IN:Trigger.new LIMIT 200];
        
        List<Position__c> positionsToUpdate=new List<Position__c>();
        
        if(updatedPositions!=null){
            for(Position__c position:updatedPositions){
                if(position.Closed_Date__c==null){
                    position.Closed_Date__c=Date.today();
                    positionsToUpdate.add(position);
                }
            }
        }
        if(!positionsToUpdate.isEmpty()){
            update positionsToUpdate;
        }

    }
}