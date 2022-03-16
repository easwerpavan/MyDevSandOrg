public class approvetask {
     public static void approve(list<user_story__c> userlist){
         map<id,user_story__c> usid = new map<id,user_story__c>();
            for(user_story__c uslist : userlist){
                if(uslist.Status__c == 'approved'){
                   usid.put(uslist.Id,uslist); 
                  }
               }       
         map<id,task> taskmap = new map<id,task>([select id,status,whatid from task where whatid in : usid.keyset()]);
            for(task tasklist : taskmap.values()){
                 if(tasklist.Status != 'completed' ){
                    usid.values().status__c.adderror('You Can not approve a user story while the task status is opened');                             
                    }                    
                 } 
        }
    }