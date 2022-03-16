@isTest
public class accountsharing_Test {
    Public static id CreateUserRecord()
    {      
       User testUser = new User();       
        testUser.ProfileId = [Select id from Profile where name= 'System Administrator'].id;
        testUser.FirstName = 'Sample';
        testUSer.LastName = 'TestUser';
        testUser.Email = 'testUser@test.com';
        testUser.Username = 'testuser@test.com'+system.currentTimeMillis();
        testUser.CompanyName = 'Test';
        testUser.Title = 'Test User';
        testUser.Alias = 'admin';
        testUser.TimeZoneSidKey = 'America/Los_Angeles';
        testUser.EmailEncodingKey = 'UTF-8';
        testUser.LanguageLocaleKey = 'en_US';
        testUser.LocaleSidKey = 'en_US';
        
        insert testUSer;
        
        return testUSer.Id;
    }
    static testmethod void TestAccountShareProcess()
    {
        List<Account> lstAccounts = new List<Account>();
        
        for(integer counter = 1; counter <= 8; counter++)
        {
            Account acc = new Account();
            acc.Name = 'Test Account - '+ counter;
            acc.Rating = 'Hot';
            if(counter >= 3){
                acc.AnnualRevenue = 57000;
            }
            else
                acc.AnnualRevenue = 44000;
            acc.Industry = 'Banking';
            acc.Phone = '9900998877';
            acc.Fax = '9988776655';
            acc.Website = 'www.gmail.com';
            acc.Type = 'Prospect';
            acc.SharingUser__c = CreateUserRecord();            
            lstAccounts.Add(acc);            
        }        
        if(! lstAccounts.isEmpty())
        {
            Insert lstAccounts;
            accountsharing.AfterInsert(lstAccounts);
        } 
    }
}