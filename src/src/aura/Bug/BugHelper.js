({	
    myaction: function (component, event) {
        var recordId = component.get('v.recordId');
        component.set('v.columns', [            
            {label: 'Bug Number', fieldName: 'Name' }            
        ]);
        var action = component.get("c.fetchbugrecords");
        action.setParams({
            "recordId":component.get('v.recordId')
        })
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var bugData = response.getReturnValue();                                                                                                                                                    console.log('data : '+ JSON.stringify(bugData)); 
                component.set("v.bugobject",bugData); 
                var appEvent = $A.get("e.c:bugevent");                
                // Optional: set some data for the event (also known as event shape)
                // A parameter’s name must match the name attribute
                // of one of the event’s <aura:attribute> tags
                appEvent.setParams({"bugrecordcount" : bugData.length});    
                appEvent.fire();
            }
        });
        $A.enqueueAction(action);
        
    }
})