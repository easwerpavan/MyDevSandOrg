({
     doInit :  function(component, event,helper) {
        var rec =   component.get('v.recordId')
        var editRecord = component.get("v.EditContact");
        var action = component.get("c.getcontactrecord");
        component.set("v.conRecordId", rec);
        console.log("rec status:::"+JSON.stringify(rec));
        action.setParams({
            "editedrecordid": rec
        })
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log("state :::"+JSON.stringify(state));
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                console.log("data edit status :::"+result.AccountId);
                component.set("v.EditContact",result);   
                component.set("v.accountId", result.AccountId);
                component.set("v.onLoadDone",true);               
            }
        });
        $A.enqueueAction(action);  
        helper.getPicklistValues(component, event);
    },
   
    handleOnChange : function(component, event, helper) {
        var status = component.get("v.EditContact.LeadSource");
    },
        
    saveUserStoryRecord : function(component, event, helper) {
        var updatedrec = component.get("v.EditContact")        
        updatedrec.AccountId = component.get("v.selectedAccountlookup").Id;
        var action = component.get("c.result");
        console.log("rec IdName:::"+JSON.stringify(updatedrec));
        action.setParams({
            "contact": updatedrec
        })
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log("update state :::"+JSON.stringify(state));
            if (state === "SUCCESS") {
                $A.get('e.force:refreshView').fire();
                var result = response.getReturnValue();   
                console.log("data update status :::"+JSON.stringify(response.getReturnValue()));
                var navService = component.find("navService");
                var pageReference = {
                    type: 'standard__recordPage',
                    attributes: {
                        objectApiName: 'Contact',
                        actionName: 'view',
                        recordId : result         
                    } 
                };
                navService.navigate(pageReference);                 
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({              
                    "title": "success",
                    "type": 'success',
                    "message": "Contact record updated successfully."
                });
                toastEvent.fire();   
            }                      
        });   
        $A.enqueueAction(action); 
    }
})