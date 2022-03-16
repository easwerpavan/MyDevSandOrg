({
   myAction : function(component, event, helper) {
        helper.doInit(component, event);
            }, 
     handleSelect : function(component, event, helper) {
        
        var selectcheckedRows = event.getParam('selectedRows'); 
        var setRows = [];
        for ( var i = 0; i < selectcheckedRows.length; i++ ) {               
            setRows.push(selectcheckedRows[i]);           
        }
        component.set("v.selectedconrec", setRows);
    },
    deleterecord : function(component, event, helper) {
       var selectedRecords = component.get("v.selectedconrec");
        console.log(JSON.stringify(selectedRecords))
        var recordIds =component.get('v.recordId'); 
        
        var action = component.get("c.deletedcontactrecords"); 
        
    action.setParams({
        "deletecon" : selectedRecords,
        "Accountid" : recordIds  
    });
        action.setCallback(this, function(response){
            var state =response.getState();
            console.log('state'+state);
            if(state === 'SUCCESS'){                  
               var count = response.getReturnValue();    
               var appEvent = $A.get("e.c:contactevent");                
                // Optional: set some data for the event (also known as event shape)
                // A parameter’s name must match the name attribute
                // of one of the event’s <aura:attribute> tags
                appEvent.setParams({"contactrecordcount" : count});    
                appEvent.fire();
                 helper.doInit(component, event);
            }
        });
       $A.enqueueAction(action);       
    } 
});