({    
    doInit : function(cmp , event) {
        var Isactive=true;
        var month = $A.localizationService.formatDate(new Date(),"MMMM");
        cmp.set('v.month', month);        
        var currentTime = new Date();        
        if(currentTime.getHours()<12){
            cmp.set("v.greetings",'Good Morning!');
        }
        else if(currentTime.getHours()<17){
            cmp.set("v.greetings",'Good AfterNoon!');
        }
            else {
                cmp.set("v.greetings",'Good Evening!');
            }
        cmp.set('v.columns', [
            {label: 'WeekDay',fieldName:'weekday',editable : false, type:'text'},
            {label: 'Monday',fieldName:'monday',type:'number',editable : true},
            {label: 'Tuesday',fieldName:'tuesday', type:'number',editable : true},
            {label: 'Wednesday',fieldName:'wednesday', type:'number',editable : true},
            {label: 'Thursday',fieldName:'thursday', type:'number',editable : true},
            {label: 'Friday',fieldName:'friday', type:'number',editable : true},
            {label: 'Saturday',fieldName:'saturday', type:'number',editable : true},
            {label: 'Sunday',fieldName:'sunday', type:'number',editable : true},
            {label: 'Total No.of Hours Worked', fieldName:'total',type:'number',editable : false}            
        ]) 
        cmp.set('v.data',[
                        {weekday: 'Hours Worked',monday: 0, tuesday: 0,  wednesday:0 , thursday: 0, friday:0, saturday: 0, sunday: 0,total:0}                        
                    ])       
        var recordId = cmp.get("v.recordId"); 
        var action = cmp.get("c.getDaysWrapper");
        action.setParams({
            "tymsheetrecordId": recordId
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                console.log('result is :::'+ JSON.stringify(result));
                cmp.set("v.username", result.userInfo.Name);
                cmp.set("v.rangeofdate", result.daterange);  
                cmp.set("v.tymsheetrecId", result.recordId);           
                if(!$A.util.isUndefinedOrNull(result.dataTableValues)){ 
                    console.log('dataTableValues  is :::'+ JSON.stringify(result.dataTableValues));
                    var hours=[];                    
                    Isactive =result.daterange.Is_Active__c;
                    cmp.set('v.columns',[
                        {label: 'WeekDay',fieldName:'weekday', type:'text'},
                        {label: 'Monday',fieldName:'monday',type:'number',editable : Isactive},
                        {label: 'Tuesday',fieldName:'tuesday', type:'number',editable : Isactive},
                        {label: 'Wednesday',fieldName:'wednesday', type:'number',editable : Isactive},
                        {label: 'Thursday',fieldName:'thursday', type:'number',editable : Isactive},
                        {label: 'Friday',fieldName:'friday', type:'number',editable : Isactive},
                        {label: 'Saturday',fieldName:'saturday', type:'number',editable : Isactive},
                        {label: 'Sunday',fieldName:'sunday', type:'number',editable : Isactive},
                        {label: 'Total No.of Hours Worked', fieldName:'total',type:'number',editable : false}            
                    ])                                         
                    hours.push(result.dataTableValues); 
                    cmp.set('v.data',hours);
                    result.dataTableValues=hours;
                    cmp.set('v.completeData',result);                     
                }
                else{
                    cmp.set('v.columns', [
                        {label: 'WeekDay',fieldName: 'weekDay',type:'text' },
                        {label: 'Sunday', fieldName: 'sunday',editable: Isactive,type:'number'},
                        {label: 'Monday', fieldName: 'monday',editable: Isactive,type:'number'},
                        {label: 'Tuesday', fieldName: 'tuesday',editable: Isactive,type:'number'},
                        {label: 'Wednesday', fieldName: 'wednesday',editable: Isactive,type:'number'},
                        {label: 'Thursday', fieldName: 'thursday',editable: Isactive,type:'number'},
                        {label: 'Friday', fieldName: 'friday',editable: Isactive,type:'number'},
                        {label: 'Saturday', fieldName: 'saturday',editable: Isactive,type:'number'},
                        {label: 'Total No Of Hours', fieldName: 'total',editable: false,type:'number'}                        
                    ])
                    cmp.set('v.data',[
                        {weekday: 'Hours Worked',monday: 0, tuesday: 0,  wednesday:0 , thursday: 0, friday:0, saturday: 0, sunday: 0,total:0}                        
                    ]) 
                }                                 
            }
        });
        $A.enqueueAction(action);         
    },
    onbuttonhelper : function(cmp , event) {
        cmp.set('v.loaded', true);
        var data=cmp.get('v.data'); 
        console.log('data Before :' + JSON.stringify(data));
        var draftValues=event.getParam("draftValues");        
        console.log('draftValues' + JSON.stringify(draftValues));
        var timeSheetRecId = cmp.get("v.recordId");
        console.log('timeSheetRecId' + JSON.stringify(timeSheetRecId));
        var sundayValue;
        var mondayValue;
        var tuesdayValue;
        var wednesdayValue;
        var thursdayValue;
        var fridayValue;
        var saturdayValue;
        var totalValue = 0;        
        if(!$A.util.isUndefinedOrNull(draftValues)){
            if(!$A.util.isUndefinedOrNull(draftValues[0].sunday)){
                sundayValue=draftValues[0].sunday;
            }
            if(!$A.util.isUndefinedOrNull(draftValues[0].monday)){
                mondayValue=draftValues[0].monday;
            }
            if(!$A.util.isUndefinedOrNull(draftValues[0].tuesday)){
                tuesdayValue=draftValues[0].tuesday;
            }
            if(!$A.util.isUndefinedOrNull(draftValues[0].wednesday)){
                wednesdayValue=draftValues[0].wednesday;
            }
            if(!$A.util.isUndefinedOrNull(draftValues[0].thursday)){
                thursdayValue=draftValues[0].thursday;
            }
            if(!$A.util.isUndefinedOrNull(draftValues[0].friday)){
                fridayValue=draftValues[0].friday;
            }
            if(!$A.util.isUndefinedOrNull(draftValues[0].saturday)){
                saturdayValue=draftValues[0].saturday;
            }         
            
            var completeData=cmp.get('v.completeData'); 
            if(!$A.util.isUndefinedOrNull(sundayValue) && !$A.util.isUndefinedOrNull(completeData.dataTableValues[0].sunday)){
                completeData.dataTableValues[0].sunday=sundayValue;                
            }       
            if(!$A.util.isUndefinedOrNull(mondayValue) && !$A.util.isUndefinedOrNull(completeData.dataTableValues[0].monday)){
                completeData.dataTableValues[0].monday=mondayValue;
            }
            if(!$A.util.isUndefinedOrNull(tuesdayValue) && !$A.util.isUndefinedOrNull(completeData.dataTableValues[0].tuesday)){
                completeData.dataTableValues[0].tuesday=tuesdayValue;
            }
            if(!$A.util.isUndefinedOrNull(wednesdayValue) && !$A.util.isUndefinedOrNull(completeData.dataTableValues[0].wednesday)){
                completeData.dataTableValues[0].wednesday=wednesdayValue;
            }
            if(!$A.util.isUndefinedOrNull(thursdayValue) && !$A.util.isUndefinedOrNull(completeData.dataTableValues[0].thursday)){
                completeData.dataTableValues[0].thursday=thursdayValue;
            }
            if(!$A.util.isUndefinedOrNull(fridayValue) && !$A.util.isUndefinedOrNull(completeData.dataTableValues[0].friday)){
                completeData.dataTableValues[0].friday=fridayValue;
            }
            if(!$A.util.isUndefinedOrNull(saturdayValue) && !$A.util.isUndefinedOrNull(completeData.dataTableValues[0].saturday)){
                completeData.dataTableValues[0].saturday=saturdayValue;
            }                        
         
            if(!$A.util.isUndefinedOrNull(sundayValue) && !$A.util.isUndefinedOrNull(data[0].sunday)){
                data[0].sunday=sundayValue;
            }
            if(!$A.util.isUndefinedOrNull(mondayValue) && !$A.util.isUndefinedOrNull(data[0].monday)){
                data[0].monday=mondayValue;
            }
            if(!$A.util.isUndefinedOrNull(tuesdayValue) && !$A.util.isUndefinedOrNull(data[0].tuesday)){
                data[0].tuesday=tuesdayValue;
            }
            if(!$A.util.isUndefinedOrNull(wednesdayValue) && !$A.util.isUndefinedOrNull(data[0].wednesday)){
                data[0].wednesday=wednesdayValue; 
            }            
            if(!$A.util.isUndefinedOrNull(thursdayValue) && !$A.util.isUndefinedOrNull(data[0].thursday)){
                data[0].thursday=thursdayValue;
            }
            if(!$A.util.isUndefinedOrNull(fridayValue) && !$A.util.isUndefinedOrNull(data[0].friday)){
                data[0].friday=fridayValue;
            }
            if(!$A.util.isUndefinedOrNull(saturdayValue) && !$A.util.isUndefinedOrNull(data[0].saturday)){
                data[0].saturday=saturdayValue;
            }
            
            totalValue = parseInt(data[0].monday) + parseInt(data[0].tuesday) + parseInt(data[0].wednesday) + parseInt(data[0].thursday) + parseInt(data[0].friday) + parseInt(data[0].saturday) + parseInt(data[0].sunday);       
            data[0].total = totalValue;
            cmp.set('v.data',data);
            console.log('totalValue is :::' + JSON.stringify(totalValue));       
        }                     
        console.log('data After:::' + JSON.stringify(data));
        console.log('complete WeekData :::' + JSON.stringify(completeData));
        var actions = cmp.get("c.updateTimeSheet");
        actions.setParams({
            "details":  JSON.stringify(completeData),
            "timeSheetId": timeSheetRecId          
        });
        actions.setCallback(this, function(response){
            var state = response.getState();
            console.log('state --- ' +state);
            if (state === "SUCCESS"){ 
                this.doInit(cmp , event);
                cmp.set('v.loaded', false);
            }             
        });
        $A.enqueueAction(actions);        
    }
})