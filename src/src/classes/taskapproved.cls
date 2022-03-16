public class taskapproved {
    public static void Validationruleforuser(list<User_Story__c> USnewList ){
   /*     Map<ID,User_Story__c> UserIDs = new Map<ID,User_Story__c>();
        for(User_Story__c UsLst :USnewList){
            UserIDs.put(UsLst.ID,UsLst);
        }
        
        list<task> Tasklst =[select id,status,whatid from task where whatid IN:UserIDs.keyset()];
        for(task tklst:Tasklst){
            if(UserIDs.get(tklst.whatId).Status__c == 'Approved' && Tklst.Status != 'Completed' ){
            UserIDs.Values().Status__c.adderror('you cannot approve a user story while the task are open');
            }
        } */
    }
}