({    
    getStatusPicklist: function(component, event) {             
        var action = component.get("c.getStatus");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                var StatusMap = [];
                var subStatusMap = [];
              //  var dependencemap = [];
                for(var key in result.status){
                    StatusMap.push({key: key, value: result.status[key]});
                }
                component.set("v.Status", StatusMap);
                
                for(var key in result.substatus){
                    subStatusMap.push({key: key, value: result.substatus[key]});
                }
                component.set("v.subStatus", subStatusMap); 
             
                component.set("v.dependent",  result.depvalues); 
            }
        });
        $A.enqueueAction(action);
        this.onload(component, event);        
    },
    onload :  function(component, event) {
        var rec =   component.get('v.recordId')
          var action = component.get("c.getuserstoryrecord");
             console.log("rec status:::"+JSON.stringify(rec));
        action.setParams({
            "editedrecordid": rec
    })
         action.setCallback(this, function(response){
            var state = response.getState();
            console.log("state :::"+JSON.stringify(state));
            if (state === "SUCCESS") {
                console.log("data edit status :::"+JSON.stringify(response.getReturnValue()))
                var result = response.getReturnValue();                       
                console.log("data edit status :::"+JSON.stringify(result));
                component.set("v.objusstory",result);           
            }
        });
        $A.enqueueAction(action);   
    },
    onupdate :  function(component, event) {
        var updatedrec = component.get("v.objusstory")
          var action = component.get("c.updatedresult");
           console.log("rec IdName:::"+JSON.stringify(updatedrec));
          action.setParams({
            "upusrecord": updatedrec
    })
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log("update state :::"+JSON.stringify(state));
            if (state === "SUCCESS") {
                console.log("data update status :::"+JSON.stringify(response.getReturnValue()));
                var result = response.getReturnValue();                       
                console.log("data edit status :::"+JSON.stringify(result));
                component.set("v.objusstory",result);  
               
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({              
                    "title": "success",
                    "type": 'success',
                    "message": "user story updated successfully."
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
})