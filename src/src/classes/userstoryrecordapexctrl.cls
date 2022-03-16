public class userstoryrecordapexctrl {
    @AuraEnabled 
    public static string result(User_Story__c usstory){
        if(usstory.id != null){
            update usstory;
        }else{
            insert usstory;
        }  
        return usstory.id;
    }
    
    @AuraEnabled //get Status Picklist Values        
    public static userpickList getStatus(){
        
        Map<String, String> statusoptions = new Map<String, String>();
        Map<String, String> substatusoptions = new Map<String, String>();
        Map<String, list<string>> depvalues = new Map<String, list<string>>();
        List<string> substatus = new List<string>();        	
        
        //get Status Field Describe
        Schema.DescribeFieldResult statusfieldResult = User_Story__c.Status__c.getDescribe();
        Schema.DescribeFieldResult substatusfieldResult = User_Story__c.Sub_Status__c.getDescribe();
        
        //get Status and sub status Picklist Values
        List<Schema.PicklistEntry> statusList = statusfieldResult.getPicklistValues();
        List<Schema.PicklistEntry> substatusList = substatusfieldResult.getPicklistValues();
        
        for(Schema.PicklistEntry psub: substatusList){
            //Put sub status Picklist Value & Label in Map
            substatusoptions.put(psub.getValue(),psub.getLabel());
            substatus.add(psub.getValue());   
        }      
        
        for(Schema.PicklistEntry pstatus: statusList){
            //Put Picklist Value & Label in Map
            statusoptions.put(pstatus.getValue(),pstatus.getLabel());
            if(pstatus.getValue() == 'IN SAT(QA)' || pstatus.getValue() == 'In development'){
                depvalues.put(pstatus.getValue(),substatus); 
            }        
        }          
        
        userpickList wrpcls = new userpickList(); 
        wrpcls.status = statusoptions;
        wrpcls.substatus = substatusoptions;
        wrpcls.depvalues =depvalues;
        return wrpcls;
    }
    public class userpickList{
        @AuraEnabled public Map<String,String> status{get;set;}
        @AuraEnabled public Map<String,String> substatus{get;set;}
        @AuraEnabled public Map<String,list<String>> depvalues{get;set;}
    }
    
    @AuraEnabled
    public static User_Story__c  getuserstoryrecord(string editedrecordid) {
        User_Story__c usrecord = [SELECT Id, Acceptance_Criteria__c,As_a__c,Assigned_BA__c, Assigned_Date__c,Assigned_Developer__c,
                                  Assigned_QA__c,Business_Objective__c,CreatedById,Description__c,Due_Date__c,Estimated_Hours__c,
                                  I_want_to__c,LastModifiedById,Sprint__c,Status__c,Story_Points__c,Sub_Status__c,Name,Wire_Frames__c FROM User_Story__c where Id =: editedrecordid];
        
        system.debug('usrecord');
        return usrecord;          
    }
    @AuraEnabled 
    public static string updatedresult(User_Story__c upusrecord){
        system.debug('user'+upusrecord);
        if(upusrecord.id != null){
            update upusrecord;
        }else{
            insert upusrecord;
        }  
        return upusrecord.id;
        }
    }