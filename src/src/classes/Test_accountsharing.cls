@istest
public class Test_accountsharing {
@testsetup 
    public static void testdata(){  
                test.startTest();
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
        system.assert(testUSer.id != null,'user insertion is failed');
        test.stopTest();
    }
    @isTest   
  public static void TestAccountShareProcess()
    {
        test.startTest();
        List<user> userList = [select Id, Name,Profileid,Email FROM user WHERE Email = 'testUser@test.com'];
        system.assertEquals(1, userList.size(),'No user record exists');
        List<Account> lstAccounts = new List<Account>();
        
        for(integer counter = 0; counter <= 200; counter++)
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
            acc.SharingUser__c = userList[0].Id;            
            lstAccounts.Add(acc);            
        }        
       
         Insert lstAccounts;   
        system.debug(lstAccounts);
        system.assertEquals(200, lstAccounts.size(),'Accounts not inserted');
        test.stopTest();
    }
}