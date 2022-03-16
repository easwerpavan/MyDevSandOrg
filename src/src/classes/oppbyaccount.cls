public class oppbyaccount {
    public static void oppclose(list<account> acclist){
        set<id> accountids = new set<id>();
        for(account acc: acclist){
        if(acclist !=null){
            accountids.add(acc.id);
          }
        }
        List<Opportunity> updtdopplist = new List<Opportunity>();
        list<opportunity> opplist = [select id,accountid,stagename,createddate from opportunity where accountid in: accountids];
        for(opportunity opp : opplist){
    //  datetime oppdate = system.today()-30; /*opp.CreatedDate < system.today()-30 && */
            if(opp.stagename != 'Closed Won'){
                opp.StageName = 'Closed Lost';
                updtdopplist.add(opp);
            }
        }
        update updtdopplist;
}
}