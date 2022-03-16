({
    doinit : function(component, event, helper) {
        component.set('v.validate', function(){
            var userInput = component.get('v.value');
            if(userInput){
                // If the Component is Valid...
                return {isValid:true};
            }else if(userInput && component.get('v.required') ){
                // If the Component is INValid...
                return {isValid:false, errorMessage:'A Value Is Required for this field'};                
            }else {
                return {isValid:true};                
            }            
        });        
    }
})