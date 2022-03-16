public class opportunityclass {
  @AuraEnabled
    public static List<contact> conrecord(Id recordId){
        system.debug(recordId);
      List<contact> conlist = [select id, AccountId, Name from contact where AccountId =: recordId];
        
        return conlist;
    }
    
    @AuraEnabled
     public static integer deletedcontactrecords(list<Contact> deletecon ,string Accountid ){
         
    delete deletecon;
          integer contactcount = [select count() from contact where AccountId =: Accountid ];
         return contactcount;
    }
}
// list<opportunity> conlist = [select id, Name from opportunity where AccountId =: recordId];