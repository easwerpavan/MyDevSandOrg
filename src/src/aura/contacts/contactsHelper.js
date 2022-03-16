({
    doInit: function(component, event) {
                var recordId = component.get('v.recordId');

        component.set('v.columns', [            
            {label: 'Contact Name', fieldName: 'Name' }            
        ]);
        var action = component.get("c.conrecord");
        action.setParams({
            'recordId': recordId
        });
        action.setCallback(this, function(response){
            var state = response.getState();
          //  console.log('states'+state);
            if(state === 'SUCCESS'){
                var conData = response.getReturnValue();          
                component.set("v.conobject",conData); 
                                 
               var appEvent = $A.get("e.c:contactevent");                
                // Optional: set some data for the event (also known as event shape)
                // A parameter’s name must match the name attribute
                // of one of the event’s <aura:attribute> tags
                appEvent.setParams({"contactrecordcount" : conData.length});    
                appEvent.fire();
            }
        });
        $A.enqueueAction(action);
        
    }
})