public class syncacc {
    
    public static void afterupdate(map<id,customer__c> cusmap){
        
        list<account> acclist = new list<account>();
        
        set<id> accid = new set<id>();
        
        for(customer__c cus : cusmap.values()){
            
            accid.add(cus.Account__c);
            
        }
        
        map<id,Account> Accmap = new map<id,Account>([select id ,name, AccountNumber, fax, phone from 
                                                      account where id in: accid ]);
        for(customer__c cust : cusmap.values()){
            
            account acc = accmap.get(cust.Account__c);  // important step
            
            acc.Name  = cust.Name ;
            acc.AccountNumber = cust.ACCOUNT_NUMBER__c ;
            acc.Fax =  cust.FAX_NUMBER__c ;
            acc.Phone  = cust.PHONE_NUMBER__c;
            
            acclist.add(acc);
        }
        if(!acclist.isempty()){
            
            update acclist;
        }
    }
}/*
public class approvetask {
    public static void approve(map<id,user_story__c> newmap,map<id,user_story__c> oldmap){
        set<id> usid = new set<id>();
        if(newmap != null){
          for(user_story__c uslist : newmap.values()){
                usid.add(uslist.Id);
          }
            if(oldmap !=  null){
              for(user_story__c usoldlist : oldmap.values()){
                  usid.add(usoldlist.Id);
              }
            //  list<task> tslst = new list<task>(); 
              map<id,task> tskid = new map<id,task>();
              map<id,task> taskmap = new map<id,task>([select id,status,whatid from task where whatid in: usid]);
              for(task tasklist : taskmap.values()){
                  if(tasklist.Status == 'completed'){
                      tskid.put(tasklist.Id,tasklist );
                  } 
              }
               // for(user_story__c uss : newmap.values()){
                     if(uss.status__C == 'approved' && tskid.status == 'completed'){
                           uss.Status__c.adderror('no msg');         
              //  }
                 
              }
             }
          }   
        }
    }          */