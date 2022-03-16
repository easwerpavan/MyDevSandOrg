trigger CASETRIGGER on Case (after insert, after update , after delete , after undelete) {
    
   if(trigger.isafter && (trigger.isinsert || trigger.isupdate || trigger.isdelete || trigger.isundelete)){
        
            CASECOUNTINACCOUNT.COUNTACCOUNT(TRIGGER.NEW,TRIGGER.OLD);
       
    }
}