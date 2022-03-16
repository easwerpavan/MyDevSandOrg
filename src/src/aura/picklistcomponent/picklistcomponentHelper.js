({
	 saveAccount : function(component, event) {

        var acc = component.get("v.optionChoosenRadio");

        var action = component.get("c.editcontact");

        action.setParams({

            objacc : acc

        });

        action.setCallback(this,function(response){

            var state = response.getState();
            console.log("rec state:::"+JSON.stringify(state));

            if(state === "SUCCESS"){

                alert('Record is Created Successfully');

            } else if(state === "ERROR"){

                var errors = action.getError();
                console.log("rec errors:::"+JSON.stringify(errors));

                if (errors) {

                    if (errors[0] && errors[0].message) {

                        alert(errors[0].message);

                    }

                }

            }else if (status === "INCOMPLETE") {

                alert('No response from server or client is offline.');

            }

        });      

        $A.enqueueAction(action);

    }
})