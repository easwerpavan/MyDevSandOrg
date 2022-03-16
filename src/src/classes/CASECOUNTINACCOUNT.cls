public class CASECOUNTINACCOUNT {
    
    public static void countaccount(list<case> cslist,list<case> oldcase){
        
        set<id> accountid = new set<id>();
        
        if(cslist != null){
        for(case cs : cslist){ 
                accountid.add(cs.accountid); 
            } 
          } 
        
         if(oldcase != null){
            for(case cse : oldcase){ 
                accountid.add(cse.accountid);
            }
        }
        
        list<account> acclist = [select id,name,TOTAL_CASES__c, (select id from Cases) from account where id in : accountid];
        
        for(account acc : acclist){
            
            acc.TOTAL_CASES__c = acc.cases.size();
            
        }
        update acclist; 
    }
}