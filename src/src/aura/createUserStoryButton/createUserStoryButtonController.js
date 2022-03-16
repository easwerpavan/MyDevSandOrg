({
	handleclick : function(component, event, helper){
        var evt = $A.get("e.force:navigateToComponent");
          evt.setParams({
             componentDef  : "c:userstorycreateform" ,
        });
        
        evt.fire();
    }
})