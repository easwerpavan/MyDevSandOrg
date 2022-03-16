({
    doInIt :  function(component, event,helper) {
        helper.doInIt(component, event);       
    },
    save:  function(component, event,helper) {
        var completeData= component.get("v.questionMap");
        console.log("completeData []"+JSON.stringify(completeData));
        var NumberValue;
        var EmailValue;
        var DateValue;
        var TextValue;
        
        var ResponseData= component.get("v.ResponseData");
        
        if(!$A.util.isUndefinedOrNull(NumberValue) && !$A.util.isUndefinedOrNull(ResponseData.responseObject)){
            ResponseData.responseObject=NumberValue;                
        } 
        if(!$A.util.isUndefinedOrNull(NumberValue) && !$A.util.isUndefinedOrNull(completeData[0].responseObject)){
            completeData[0].responseObject=NumberValue;
        }
        
        console.log('ResponseData :::' + JSON.stringify(ResponseData));
        
        cmp.set('v.questionMap',completeData);
        
        var actions = component.get("c.updateContact");
        actions.setParams({
            "details":  JSON.stringify(ResponseData)              
        }); 
        actions.setCallback(this, function(response){
            var state = response.getState();
            console.log('state  :::'+state);
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                console.log("result :::"+JSON.stringify(result));
            }
        });
        $A.enqueueAction(actions);  
    }    
})