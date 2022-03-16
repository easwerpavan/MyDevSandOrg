({
    doInit: function(component, event) {              
        component.set('v.columns', [            
            {label: 'Name', fieldName: 'name' },
            {label: 'Role', fieldName: 'role' },
            {label: 'Delete', 
                            type: 'button-icon', fieldName : 'recordId',
                            typeAttributes:{iconName: 'utility:delete',
                             name: 'delete',
                            title: 'delete',
                             disabled: false,
                             value: 'delete',
                             iconPosition: 'left'}
            },
            {label: 'Edit', 
                             type: 'button-icon', fieldName : 'recordId',
                             typeAttributes:{iconName: 'utility:edit',
                             name: 'Edit',
                             title: 'Edit',
                             disabled: false,
                             value: 'Edit',
                             iconPosition: 'left'}
            }
        ]);
        var action = component.get("c.getTeammembers");
        
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('states'+state);
            if(state === 'SUCCESS'){
                var conData = response.getReturnValue();          
                component.set("v.teamdata",conData); 
                component.set("v.count",conData.length);                           
            }
        });
        $A.enqueueAction(action);
        
    }
})