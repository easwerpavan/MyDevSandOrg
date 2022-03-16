trigger userstorytrigger on User_Story__c (before insert,before update) {
    if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
        
        approvetask.approve(trigger.new);
    //   taskapproved.Validationruleforuser(trigger.new);
   
    }
}