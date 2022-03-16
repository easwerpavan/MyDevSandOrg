public class timesheet {
    @AuraEnabled 
    public static wrapperObj getDaysWrapper(String tymsheetrecordId) {
        wrapperObj obj = new wrapperObj();
        obj.recordId = tymsheetrecordId;
        obj.daterange = [SELECT Id, EM_Start_Date__c, EM_End_Date__c,Is_Active__c FROM EM_Time_Sheet__c where Id =: tymsheetrecordId];
        User loginUser = [select id,Name FROM User Where id =: userInfo.getUserId()];
        obj.userInfo=loginUser;    
        List<EM_Day__c> days  = [SELECT Id, EM_Week_Day__c, EM_No_of_Hours__c,EM_Time_Sheet__c FROM EM_Day__c where EM_Time_Sheet__c = : tymsheetrecordId];      
        List<EM_Day__c> newdays = new List<EM_Day__c>();
        
        dataTableValues dayObject= new dataTableValues();
        
        for(EM_Day__c weekdays : days){
            
            dayObject.weekDay = 'Hours Worked'; 
            
            if(weekdays.EM_Week_Day__c == 'SUN' && weekdays.EM_Week_Day__c != NUll){
                dayObject.sunday = Integer.Valueof(weekdays.EM_No_of_Hours__c);
            }
            else if(weekdays.EM_Week_Day__c == 'SUN' && dayObject.sunday != 0)
            {
                dayObject.sunday = 0;
            }          
            if(weekdays.EM_Week_Day__c == 'MON' && weekdays.EM_Week_Day__c != NUll){
                dayObject.monday = Integer.Valueof(weekdays.EM_No_of_Hours__c);
            }
            else if(weekdays.EM_Week_Day__c == 'MON' && dayObject.monday != 0)
            {
                dayObject.monday = 0;            
            }          
            if(weekdays.EM_Week_Day__c == 'TUE' && weekdays.EM_Week_Day__c != NUll){
                dayObject.tuesday = Integer.Valueof(weekdays.EM_No_of_Hours__c);
            }
            else if(weekdays.EM_Week_Day__c == 'TUE' && dayObject.tuesday != 0)
            {
                dayObject.tuesday = 0;            
            }         
            if(weekdays.EM_Week_Day__c == 'WED' && weekdays.EM_Week_Day__c != NUll){
                dayObject.wednesday = Integer.Valueof(weekdays.EM_No_of_Hours__c);
            }
            else if(weekdays.EM_Week_Day__c == 'WED' && dayObject.wednesday != 0)
            {
                dayObject.wednesday = 0;           
            }          
            if(weekdays.EM_Week_Day__c == 'THUR' && weekdays.EM_Week_Day__c != NUll){
                dayObject.thursday = Integer.Valueof(weekdays.EM_No_of_Hours__c);
            }
            else if(weekdays.EM_Week_Day__c == 'THUR' && dayObject.thursday != 0)
            {
                dayObject.thursday = 0;
            }          
            if(weekdays.EM_Week_Day__c == 'FRI' && weekdays.EM_Week_Day__c != NUll){
                dayObject.friday = Integer.Valueof(weekdays.EM_No_of_Hours__c);
            }
            else if(weekdays.EM_Week_Day__c == 'FRI' && dayObject.friday != 0)
            {
                dayObject.friday = 0;
            }
            if(weekdays.EM_Week_Day__c == 'SAT' && weekdays.EM_Week_Day__c != NUll){
                dayObject.saturday = Integer.Valueof(weekdays.EM_No_of_Hours__c);
            }
            else if(weekdays.EM_Week_Day__c == 'SAT' && dayObject.saturday != 0)
            {
                dayObject.saturday = 0;              
            }
        }
        dayObject.total = dayObject.sunday + dayObject.monday + dayObject.tuesday + dayObject.wednesday + dayObject.thursday + dayObject.friday + dayObject.saturday;
        obj.dataTableValues=dayObject;
        return obj;      
    }
    public class wrapperObj{
        @AuraEnabled public string recordId{get;set;}
        @AuraEnabled public user userInfo{get;set;}
        @AuraEnabled public EM_Time_Sheet__c daterange{get;set;}
        @AuraEnabled public dataTableValues dataTableValues{get;set;}       
    }
    public class dataTableValues{
        @AuraEnabled public string weekday {get;set;}
        @AuraEnabled public integer sunday {get;set;}
        @AuraEnabled public integer monday {get;set;}
        @AuraEnabled public integer tuesday {get;set;}
        @AuraEnabled public integer wednesday {get;set;}                        
        @AuraEnabled public integer thursday {get;set;}
        @AuraEnabled public integer friday {get;set;}
        @AuraEnabled public integer saturday {get;set;}        
        @AuraEnabled public integer total {get;set;}
        @AuraEnabled public boolean Isactive{get;set;}
    }
    @AuraEnabled
    public static void updateTimeSheet(String details,String timeSheetId) {
        system.debug('details'+details);
        try{   
            Map<String,EM_Day__c> daysMap=new Map<String,EM_Day__c>();
            List<EM_Day__c> workDays=[SELECT Id,EM_Time_Sheet__c,EM_No_of_Hours__c,EM_Week_Day__c,Name FROM EM_Day__c where EM_Time_Sheet__c = :timeSheetId];
            system.debug('workDays :'+workDays.size());
            
            for(EM_Day__c eachday : workDays){ 
                
                if(eachday.EM_Week_Day__c == 'SUN') {
                    daysMap.put('sunday', eachday);    
                }
                if(eachday.EM_Week_Day__c == 'MON') {
                    daysMap.put('monday', eachday);
                }
                if (eachday.EM_Week_Day__c == 'TUE') {
                    daysMap.put('tuesday', eachday);
                }
                if (eachday.EM_Week_Day__c == 'WED') {
                    daysMap.put('wednesday', eachday);
                }
                if (eachday.EM_Week_Day__c == 'THUR') {
                    daysMap.put('thursday', eachday);
                }
                if (eachday.EM_Week_Day__c == 'FRI') {
                    daysMap.put('friday', eachday);
                }
                if (eachday.EM_Week_Day__c == 'SAT') {
                    daysMap.put('saturday', eachday);                
                }
                system.debug('daysMap :'+daysMap);           
            }         
                      
            String jsonWrapper='{"wrapperUQ":'+details+'}';
            system.debug('jsonWrapper :'+jsonWrapper);
            System.debug('jsonWrapper '+JSON.deserializeUntyped(jsonWrapper));
            Object mapObject = (Object)JSON.deserializeUntyped(jsonWrapper);
            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(jsonWrapper);
            System.debug('jsonWrapper1 '+results.get('wrapperUQ'));
          
            String myJSONs = JSON.serializePretty(results.get('wrapperUQ'));
            system.debug('myJSONs :'+myJSONs); 
          
            Map<String,Object> finalData = (Map<String,Object>) JSON.deserializeUntyped(JSON.serialize(results.get('wrapperUQ')));    
            System.debug('jsonWrapper2 '+finalData.get('dataTableValues'));
            List<Object> dateValuesList=(List<Object>)JSON.deserializeUntyped(JSON.serialize(finalData.get('dataTableValues')));            
            Map<String,Object> daysData;
            List<EM_Day__c> updateDays = new List<EM_Day__c>();
            for(Object obj:dateValuesList){
                daysData = (Map<String,Object>) JSON.deserializeUntyped(JSON.serialize(obj));      
                System.debug('daysData'+daysData);
                
                EM_Day__c sunday =daysMap?.get('sunday');
                if( sunday.EM_Week_Day__c == 'SUN' && sunday.EM_Week_Day__c != null ){
                    sunday.EM_No_of_Hours__c=Integer.Valueof(string.valueOf(daysData.get('sunday')));
                    updateDays.add(sunday);
                    System.debug(daysData.get('sunday'));
                }
                EM_Day__c monday =daysMap?.get('monday');
                if( monday.EM_Week_Day__c == 'MON' && monday.EM_Week_Day__c != null ){
                    monday.EM_No_of_Hours__c=Integer.Valueof(string.valueOf(daysData.get('monday')));
                    updateDays.add(monday);
                    System.debug(daysData.get('monday'));
                }
                EM_Day__c tuesday =daysMap?.get('tuesday');
                if(tuesday.EM_Week_Day__c == 'TUE' ){
                    tuesday.EM_No_of_Hours__c=Integer.Valueof(string.valueOf(daysData.get('tuesday')));
                    updateDays.add(tuesday);
                    System.debug(daysData.get('tuesday'));
                }
                EM_Day__c wednesday =daysMap?.get('wednesday');
                if(wednesday.EM_Week_Day__c == 'WED' ){
                    wednesday.EM_No_of_Hours__c=Integer.Valueof(string.valueOf(daysData.get('wednesday')));
                    updateDays.add(wednesday);
                    System.debug(daysData.get('wednesday'));
                }
                EM_Day__c thursday =daysMap?.get('thursday');
                if(thursday.EM_Week_Day__c == 'THUR' ){
                    thursday.EM_No_of_Hours__c=Integer.Valueof(string.valueOf(daysData.get('thursday')));
                    updateDays.add(thursday);
                    System.debug(daysData.get('thursday'));
                }
                EM_Day__c friday =daysMap?.get('friday');
                if(friday.EM_Week_Day__c == 'FRI' ){
                    friday.EM_No_of_Hours__c=Integer.Valueof(string.valueOf(daysData.get('friday')));
                    updateDays.add(friday);
                    System.debug(daysData.get('friday'));
                }
                EM_Day__c saturday =daysMap?.get('saturday');
                if(saturday.EM_Week_Day__c == 'SAT' ){
                    saturday.EM_No_of_Hours__c=Integer.Valueof(string.valueOf(daysData.get('saturday')));
                    updateDays.add(saturday);
                    System.debug(daysData.get('saturday'));
                }       
            }
            update updateDays;
        }catch(Exception e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
    }
}