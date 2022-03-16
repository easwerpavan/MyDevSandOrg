({  
    handleComponentEvent : function (component, event) {
        var selectedAccountGetFromEvent = event.getParam("bugrecordcount"); 
        console.log('count'+selectedAccountGetFromEvent) 
        component.set("v.selectdelete" , selectedAccountGetFromEvent);      
    }
})