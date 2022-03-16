public class bugrecords {
    @AuraEnabled
    public static List <Bug__c> fetchbugrecords(Id recordId) {
        
        list<Bug__c>buglist = [Select Id,name from Bug__c where User_Story__c =: recordId];
        
        return buglist;
        
    }
    
    @AuraEnabled
    public static integer deletebugrecords(List<Bug__c> Deletebug ,string UserStoryid ){
        delete Deletebug;
        integer Bugcount = [select count() from Bug__c where User_Story__c =: UserStoryid ];
        return bugcount;
    }
    
}