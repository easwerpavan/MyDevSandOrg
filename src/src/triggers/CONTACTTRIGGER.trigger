trigger CONTACTTRIGGER on Contact (after insert,after update,after delete,after undelete) {
    
        if(trigger.isafter && (trigger.isinsert || trigger.isupdate || trigger.isdelete || trigger.isundelete)){
    
                  contactcountonaccount.count(trigger.new,trigger.old);
        
        }
    
}