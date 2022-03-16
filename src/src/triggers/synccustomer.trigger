trigger synccustomer on CUSTOMER__c (after update) {
          
    if(trigger.isafter && trigger.isupdate){
        
        syncacc.afterupdate(trigger.newmap);
    }
}