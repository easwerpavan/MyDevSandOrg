({  
   myAction : function(component, event, helper){
        helper.doInit(component, event);
    },
   addmember: function(component, event, helper) {
      // Set isModalOpen attribute to true
      component.set("v.isModalOpen", true);       
   },  
   Cancel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
      component.set("v.isModalOpen", false);
   },  
   submitDetails: function(component, event, helper){
      // Set isModalOpen attribute to false
      //Add your code to call apex method or do some processing
      component.set("v.isModalOpen", false);  
       
         var objtm = component.get("v.objtmstory");
        
       if(component.get("v.selectedUsLookUpRecord").Id != undefined){
          objtm.User__c= component.get("v.selectedUsLookUpRecord").Id;             
        }  
       var action = component.get("c.results");
        action.setParams({
            "member": objtm
        });
        action.setCallback(this, function(response) {
        var state = response.getState();
            console.log('state'+state);
        if (state === 'SUCCESS') {
             helper.doInit(component, event);
        }
      });
      $A.enqueueAction(action);      
	},
    handleRowAction: function(component, event, helper) {
        console.log(JSON.stringify(event))
            var row = event.getParam('row')  
            var action = event.getParam('action')
            console.log(JSON.stringify(row))
          if(action.name === "Edit"){
            $A.get("e.force:editRecord").setParams({"recordId": row.recordId}).fire();  
              helper.doInit(component, event);
        }
        if(action.name === "delete"){
            component.set("v.isdeletepopup", true);
            component.set("v.selecteddeletedrec", row);                        
        }
         
    },        

 deleteButton: function(component, event, helper){
      var selectedRecord = component.get("v.selecteddeletedrec");
       console.log(JSON.stringify(selectedRecord));
     var action = component.get("c.deleteteammember");
      action.setParams({
        "teamrecordId" : selectedRecord.recordId
       });
          
     action.setCallback(this, function(response) {
        var state = response.getState();
            console.log('state'+state);
        if (state === 'SUCCESS') {
            component.set("v.isdeletepopup", false);      
            helper.doInit(component, event);
        }            
      });
      $A.enqueueAction(action);       
    } ,
    cancelButton : function(component, event, helper) {
      // Set isdeletepopup attribute to false  
      component.set("v.isdeletepopup", false);
   }
   
})