({
    doInit: function (component, event, helper) {
        helper.myaction(component, event);
    },
    
    handleSelect : function(component, event, helper) {        
        var selectcheckedRows = event.getParam('selectedRows'); 
        var setRows = [];
        for ( var i = 0; i < selectcheckedRows.length; i++ ) {            
            setRows.push(selectcheckedRows[i]);           
        }
        component.set("v.selectedbugrec", setRows);
    },
    
    deleterecord : function(component, event, helper) {         
        var selectedRecords = component.get("v.selectedbugrec");                
        var recordids =component.get('v.recordId'); 
        var action = component.get("c.deletebugrecords");   
        action.setParams({
            "Deletebug": selectedRecords,
            "UserStoryid" : recordids             
        }); 
        
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('state'+state);
            if(state == 'SUCCESS'){                  
                var count = response.getReturnValue();    
                var appEvent = $A.get("e.c:bugevent");                
                appEvent.setParams({ "bugrecordcount" : count });                  
                appEvent.fire();
                helper.myaction(component, event);                
            }
        });
        $A.enqueueAction(action);         
    } 
});