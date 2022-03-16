public class contacteditrecord {
    @AuraEnabled 
    public static string result(Contact contact){
        update contact;
        return contact.id;
    }
    @AuraEnabled
    public static Contact getcontactrecord(id editedrecordid) {
        Contact contrec = [SELECT Id,accountid,LastName,firstName,MailingStreet, MailingCity, MailingState,ACCOUNT_NUMBER__c,Department,
                           MailingPostalCode, MailingCountry, MailingAddress, Phone,mobilephone,Fax, Email, Birthdate,leadsource
                           FROM Contact where Id =: editedrecordid];
        return contrec;          
    }
    @AuraEnabled 
    public static Map<String, String> getpicklistFieldValue(){
        Map<String, String> options = new Map<String, String>();        
        Schema.DescribeFieldResult fieldResult = Contact.LeadSource.getDescribe();        
        List<Schema.PicklistEntry> pValues = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pValues) {            
            options.put(p.getValue(), p.getLabel());
        }
        return options;
    }
}