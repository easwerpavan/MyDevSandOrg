public class teammemberclass {
@AuraEnabled 
    public static void results(Team_Member__c member){
        insert member;
    }
    @AuraEnabled 
    public static List<teamwrapperclass> getTeammembers(){
        List<Team_Member__c> teamlist = [Select Id,Role__c,User__r.Name from Team_Member__c ]; 
        
        List<teamwrapperclass> objlist = new List<teamwrapperclass>();
        
        for(Team_Member__c tmember : teamlist){
            teamwrapperclass obj = new teamwrapperclass();
           
            obj.role = tmember.Role__c;
            obj.name = tmember.User__r.Name;
            obj.recordId = tmember.Id;
            objlist.add(obj);
        }
        return objlist;
    }
    public class teamwrapperclass{
         @AuraEnabled public string role{get;set;}
         @AuraEnabled public string name{get;set;}
         @AuraEnabled public string recordId{get;set;}
    }  
    @auraEnabled 
    public static void deleteteammember(string teamrecordId ){
         Team_Member__c deleterecord = [SELECT Id,User__r.Name, Role__c FROM Team_Member__c where Id =: teamrecordId];
        delete deleterecord;
        
    }
  }