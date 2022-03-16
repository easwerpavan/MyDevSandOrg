public class accountsharing {
    @InvocableMethod(Label='Share Account Record' Description='This method will Share the Account Record to Specified User.')
    public static void AccountShareProcess(List<account> accountlst){
        system.debug(accountlst.size());
        List<AccountShare> shareAccountRecords = new List<AccountShare>();
        for(account acc : accountlst){
            AccountShare accShare = new AccountShare();                   
            accShare.AccountId = acc.Id;
            accShare.UserOrGroupId = acc.SharingUser__c;
            accShare.RowCause = 'Manual';
            accShare.OpportunityAccessLevel = 'READ';
            accShare.CaseAccessLevel = 'READ';
            if(acc.AnnualRevenue >= 50000){
                accShare.AccountAccessLevel = 'EDIT';
            }
            else
                accShare.AccountAccessLevel = 'READ';
            shareAccountRecords.add(accShare);
        }
        insert shareAccountRecords;                   
    }
}