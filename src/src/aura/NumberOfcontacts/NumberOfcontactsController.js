({  
handleComponentEvent : function (component, event) {
    // get the selected Account record from the COMPONETN event 	 
       var selectedAccountGetFromEvent = event.getParam("contactrecordcount"); 
   /* console.log('count'+selectedAccountGetFromEvent) */
	   component.set("v.selectdelete" , selectedAccountGetFromEvent);      
    }
})