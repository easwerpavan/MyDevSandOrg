trigger CANDIDATEtrigger on CANDIDATES__c (AFTER insert,after update,after delete,after undelete) {
           
    if(trigger.isafter && (trigger.isinsert || trigger.isupdate || trigger.isdelete || trigger.isundelete)){
        
        candidatecountoncontact.candidatecount(trigger.new,trigger.old);
    }
    
    if(trigger.isafter && (trigger.isinsert || trigger.isdelete)){
        emailcontact.emailsender(trigger.new,trigger.old);
    }
    
}