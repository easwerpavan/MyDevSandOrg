public class DemoApexClass {
    public void insertAccount(integer Count,string lname,integer counts){
        List<Account> Account = new List<Account>();
        for(integer i = 1 ; i <= Count ; i++) 
        {
            Account acc = new Account();
            acc.Name = lname+ i;
            acc.Count_Of_Contacts__c = counts;
            Account.add(acc);
        }
        Insert account;
    }
}