({
 handleOnSubmit : function(component, event, helper) {
 event.preventDefault(); 
 component.find("status").set("v.value", 'Draft');
 component.find('userstory').submit(); 
 },
    
 onclickhandle : function(component, event, helper){
 component.find("userstory").submit(); 
 },
    
 handleOnSuccess : function(component, event, helper){
 var record = event.getParam("response");
 var apiName = record.apiName;
 var myRecordId = record.id; 
 var navLink = component.find("navService");
 var pageRef = {
 type: 'standard__recordPage',
 attributes: {
 actionName: 'view',
 objectApiName: 'User_Story__c',
 recordId : record.id 
 }
 };
 navLink.navigate(pageRef, true);
 
 var toastEvent = $A.get("e.force:showToast");
 toastEvent.setParams({
 "title": "Success!",
 "message": "User Story Record has been created successfully"
 });
 toastEvent.fire();	
 }
 
})