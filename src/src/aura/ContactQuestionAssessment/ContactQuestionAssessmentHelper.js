({   
    doInIt: function(component, event) {
        var action = component.get("c.getResponse");
        action.setCallback(this, function(response) {
            var state  = response.getState();
            if (state === "SUCCESS") {
                var questionsMap=[];
                var result = response.getReturnValue();
                for(var key in result){
                    var eachQuestion=result[key];                   
                    // radiogroup
                    if(eachQuestion.questionType=="Radio"){                        
                        var respoObj=[];
                        var totalResponses=eachQuestion.responseWrapper;
                        for(var eachResp in totalResponses){
                            respoObj.push({'label' : totalResponses[eachResp].Answertext, 'value' : totalResponses[eachResp].Answertext});  
                            console.log('respObj Radio:::'+JSON.stringify(respoObj));
                        }
                        eachQuestion.responseObject=respoObj;                  
                    }
                    
                    // picklist
                    if(eachQuestion.questionType=="Picklist"){                        
                        var respObj=[];
                        var totalResponses=eachQuestion.responseWrapper;
                        for(var eachResp in totalResponses){
                            respObj.push(totalResponses[eachResp].Answertext);    
                            console.log('respObj picklist::::'+JSON.stringify(respObj)); 
                            console.log('eachQuestion picklist::::'+JSON.stringify(eachQuestion.responseWrapper)); 
                        }
                        eachQuestion.responseObject=respObj; 
                    }                           
                    questionsMap.push({value:result[key], key:key});               
                }               
                component.set("v.questionMap",questionsMap);  
                console.log('Final result:::'+JSON.stringify(questionsMap)); 
            }
        });
        $A.enqueueAction(action);       
    } 
})