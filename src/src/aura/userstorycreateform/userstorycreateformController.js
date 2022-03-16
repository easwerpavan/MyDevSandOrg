({
	saveUserStoryRecord : function(component, event, helper) {
        var objus = component.get("v.objusstory");
       
        if(component.get("v.selectedSprintLookUpRecord").Id != undefined){
          objus.Sprint__c = component.get("v.selectedSprintLookUpRecord").Id;
        }       
        if(component.get("v.selectedUsLookUpRecord").Id != undefined){
          objus.Assigned_Developer__c = component.get("v.selectedUsLookUpRecord").Id;             
        }
         if(component.get("v.selectedqaLookUpRecord").Id != undefined){
          objus.Assigned_QA__c= component.get("v.selectedqaLookUpRecord").Id;        
        }
        if(component.get("v.selectedbaLookUpRecord").Id != undefined){
          objus.Assigned_BA__c = component.get("v.selectedbaLookUpRecord").Id;
        } 
                     
       if(component.get('v.recordId') === undefined){
          //call apex class method
      var action = component.get('c.result');
        action.setParams({
            "usstory": objus
        })
      action.setCallback(this, function(response) {
        //store state of response
        var state = response.getState();
        if (state === "SUCCESS") {          
             var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({              
                    "title": "success",
                    "type": 'success',
                    "message": "user story created successfully."
                });
                toastEvent.fire(); 
            
            var recordId = response.getReturnValue();
            console.log(recordId);
            var navService = component.find("navService");
            var pageReference = {
            type: 'standard__recordPage',
            attributes: {
                objectApiName: 'User_Story__c',
                actionName: 'view',
                recordId : recordId         
         } 
            }
             navService.navigate(pageReference); 
           }                      
      });
   
      $A.enqueueAction(action);  
       }
      if(component.get('v.recordId') != undefined){
            helper.onupdate(component, event);
       }
    }, 
    
    doInit: function(component, event, helper) {        
        helper.getStatusPicklist(component, event);  
    },
   
    handleStatusOnChange : function(component, event, helper) {
        var status = component.get("v.objusstory.Status__c");
        console.log("status:::"+JSON.stringify(status)); 
        var depstatus = component.get("v.dependent");
        console.log("depstatus:::"+JSON.stringify(depstatus[status]));  
        if(depstatus[status] != undefined){
            component.set("v.disable", false);
        }else
        {
          component.set("v.disable", true);
        }    
    }
})