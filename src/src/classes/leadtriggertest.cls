@istest
private class leadtriggertest {
    static testmethod void testleadtrigger(){       
        lead ld = new lead();
        ld.Salutation = 'mr';
        ld.LastName = 'testing method';
        ld.Company = 'swhizz tesch';
        ld.Phone = '2584103697';
        ld.gender__c = 'male';
        ld.Industry = 'banking';
        ld.Industry = 'agriculture';
            ld.Industry = 'biotechnology';
            ld.Industry = 'communications';
            ld.Industry = 'apparel';
       
        ld.date_of_join__c = system.today();
     ld.State = 'a.p';
     ld.City = 'vijaywada';
     ld.PostalCode = '500021';
     ld.Country = 'india';
     ld.Street = 'sports complex';
        insert ld;
    }
}