public class candidatecountoncontact {
    public static void candidatecount(list<CANDIDATES__c>newcanlist,list<CANDIDATES__c>oldcanlist){
        set<id>conid = new set<id>();
        if(newcanlist != null){
            for(CANDIDATES__c can :newcanlist){
                if(can.contact__c != null){
                    conid.add(can.contact__c);
                }
            }
        }if(oldcanlist != null){
            for(CANDIDATES__c cand : oldcanlist){
                if(cand.contact__c != null){
                    conid.add(cand.Contact__c);
                }
            }
        }  
        
        list<contact> conlist = [select id,candidate_count__c ,(select id from candidates__r) from contact where id in :conid ];
        
        for(contact conta : conlist){
            conta.candidate_count__c = conta.candidates__r.size();
        }
        update conlist;
    }
}