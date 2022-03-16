@isTest 
public class timesheet_Test {
    @testSetup  static void testData() {
        
        User user = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id,
            LastName = 'last',
            Email = 'puser000@amamama.com',
            Username = 'puser000@amamama.com' + System.currentTimeMillis(),
            CompanyName = 'TEST',
            Title = 'title',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US' );
        insert user;
        
        LMS_Employee__c empinfo = new LMS_Employee__c();
        empinfo.Name = 'vinodhkumar';
        empinfo.LMS_Aadhar_Number__c = '673217570919';   
        empinfo.LMS_PAN_Number__c = 'BOCPG6695E';
        empinfo.LMS_PF_Account_Number__c = 'MHBAN00000640000000005';  
        if(empinfo.Name != null){
            insert empinfo;
        }
        
        List<EM_Time_Sheet__c> tymsheet = new List<EM_Time_Sheet__c>();
        EM_Time_Sheet__c tsheet = new EM_Time_Sheet__c();
        tsheet.EM_Start_Date__c = system.today();
        tsheet.EM_End_Date__c = system.today() + 7;
        tsheet.Is_Active__c = true;
        tsheet.EM_Employee__c = empinfo.Id;
        tymsheet.add(tsheet);
        if(tsheet.EM_Employee__c != null){
            insert tymsheet; 
        }
        
        timesheet.dataTableValues dTable = new timesheet.dataTableValues();
        dTable.Isactive = true;
        
        List<EM_Day__c> dLists = new List<EM_Day__c>();
        for(integer j=0; j<7; j++ ){
            EM_Day__c wdays = new EM_Day__c();
            if(j==0){
                wdays.EM_Week_Day__c ='SUN';
            }
            if(j==1){
                wdays.EM_Week_Day__c ='MON';
            }
            if(j==2){
                wdays.EM_Week_Day__c ='TUE';
            }
            if(j==3){
                wdays.EM_Week_Day__c ='WED';
            }
            if(j==4){
                wdays.EM_Week_Day__c ='THUR';
            }
            if(j==5){
                wdays.EM_Week_Day__c ='FRI';
            }
            if(j==6){
                wdays.EM_Week_Day__c ='SAT';
            }            
            wdays.EM_No_of_Hours__c = 2;
            wdays.EM_Time_Sheet__c = tsheet.Id;
            dLists.add(wdays);
        }     
        if(!dLists.isEmpty()){
            insert dLists;
        } 
    }
    
    @isTest 
        static  void validategetDaysWrapper() {        
        test.startTest();
        user user = [select Id, Name from user LIMIT 1];
        EM_Time_Sheet__c Ts = [SELECT Id, Name, EM_Employee__c, EM_Total_Hours_Worked__c, EM_Week_Days_Count__c, EM_Start_Date__c, EM_End_Date__c, Is_Active__c FROM EM_Time_Sheet__c  limit 1];
        List<EM_Day__c> days = [SELECT Id, EM_Time_Sheet__c, EM_No_of_Hours__c, EM_Week_Day__c, Name FROM EM_Day__c 
                                where EM_Time_Sheet__c =: Ts.Id ];
        system.debug(Ts);
        System.assertEquals(true,Ts!=null);    
        timesheet.getDaysWrapper(Ts.id);
        Map<String,integer> WeekdayValues = new  Map<String,integer>();
        timesheet.dataTableValues datavalues = new timesheet.dataTableValues ();        
        for(EM_Day__c testweekdays : days){
            datavalues.weekday =  'Hours Worked';
            datavalues.Isactive = true;
            if(testweekdays.EM_Week_Day__c == 'SUN' && testweekdays.EM_Week_Day__c != NUll){
                datavalues.sunday = Integer.Valueof(testweekdays.EM_No_of_Hours__c);
                system.debug('sunday' + datavalues.sunday);
            }      
            if(testweekdays.EM_Week_Day__c == 'MON' && testweekdays.EM_Week_Day__c != NUll){
                datavalues.monday = Integer.Valueof(testweekdays.EM_No_of_Hours__c);
                system.debug('monday' + datavalues.monday);
            }
            if(testweekdays.EM_Week_Day__c == 'TUE' && testweekdays.EM_Week_Day__c != NUll){
                datavalues.tuesday = Integer.Valueof(testweekdays.EM_No_of_Hours__c);
                system.debug('tuesday' + datavalues.tuesday);
            }
            if(testweekdays.EM_Week_Day__c == 'WED' && testweekdays.EM_Week_Day__c != NUll){
                datavalues.wednesday = Integer.Valueof(testweekdays.EM_No_of_Hours__c);
                system.debug('wednesday' + datavalues.wednesday);
            }
            if(testweekdays.EM_Week_Day__c == 'THUR' && testweekdays.EM_Week_Day__c != NUll){
                datavalues.thursday = Integer.Valueof(testweekdays.EM_No_of_Hours__c);
                system.debug('thursday' + datavalues.thursday);
            }
            if(testweekdays.EM_Week_Day__c == 'FRI' && testweekdays.EM_Week_Day__c != NUll){
                datavalues.friday = Integer.Valueof(testweekdays.EM_No_of_Hours__c);
                system.debug('friday' + datavalues.friday);
            }
            if(testweekdays.EM_Week_Day__c == 'SAT' && testweekdays.EM_Week_Day__c != NUll){
                datavalues.saturday = Integer.Valueof(testweekdays.EM_No_of_Hours__c);
                system.debug('saturday' + datavalues.saturday);
            }  
        }
        datavalues.total = datavalues.sunday + datavalues.monday + datavalues.tuesday + datavalues.wednesday + datavalues.thursday + datavalues.friday + datavalues.saturday;  
        system.debug('total' + datavalues.total);                
        timesheet.wrapperObj wrapperdata = new timesheet.wrapperObj(); 
        wrapperdata.userInfo = user;
        wrapperdata.daterange = Ts;
        wrapperdata.recordId = Ts.Id;
        wrapperdata.dataTableValues = datavalues; 
        String myJSON = JSON.serializePretty(wrapperdata);
        timesheet.updateTimeSheet(myJSON, wrapperdata.recordId); 
}
}