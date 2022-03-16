public class contactcountonaccount {
    
    public static void count(list<contact>conlist,list<contact>oldconlist){
        
       set<id>accid = new set<id>();
        
        if(conlist!=null){ 
        for(contact con : conlist){
            if(con.AccountId != null){
                accid.add(con.AccountId);
               }
            }          
        }
       if(oldconlist!=null){
          for(contact cont : oldconlist){
             if(cont.AccountId != null){
                 accid.add(cont.accountid);
           }
        }     
     }  
        list<account>acclist = [select id,TOTAL_CONTACT_RECORDS__c,(select id from contacts) from account where id in : accid];
        
        for(account acc : acclist){
            
            acc.TOTAL_CONTACT_RECORDS__c = acc.contacts.size();
            
        }
        
        update acclist;
       
    }
}