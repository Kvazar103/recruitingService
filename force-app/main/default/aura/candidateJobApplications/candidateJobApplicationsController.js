({
    init: function(component, event, helper) {
        let recordId = component.get("v.recordId");
        let action = component.get("c.getJobApplication");
        action.setParams({ candidateId: recordId });
        
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.jobApplications", response.getReturnValue());
            } else {
                console.error("Failed to load job applications");
            }
        });
        
        $A.enqueueAction(action);
    }
})
