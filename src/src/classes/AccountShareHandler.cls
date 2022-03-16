public class AccountShareHandler {
Public static void AccountShareObject(List<Account> lstAccounts)
    {
        if(! lstAccounts.isEmpty())
        {
            List<AccountShare> shareAccountRecords = new List<AccountShare>();
            
            for(Account acc : lstAccounts)
            {
               if(acc.SharingUser__c != null) 
               {
                  	AccountShare accShare = new AccountShare();            
               			accShare.AccountId = acc.Id;
                   		accShare.UserOrGroupId = acc.SharingUser__c;
                   		accShare.RowCause = 'Manual';
                   		accShare.OpportunityAccessLevel = 'READ';
                   		accShare.CaseAccessLevel = 'READ';
                        accShare.ContactAccessLevel = 'READ';                   
                   		if(acc.AnnualRevenue >= 50000)
                            accShare.AccountAccessLevel = 'EDIT';
                   		else
                            accShare.AccountAccessLevel = 'READ';
                   
                   shareAccountRecords.Add(accShare);                   
               }
            }
            
            if(! shareAccountRecords.isEmpty())
            {
                Insert shareAccountRecords;
            }
        }
    }
}