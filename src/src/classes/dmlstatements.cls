public class dmlstatements {
          /*  public static void insertlead(){
list<lead>ldlist = new list<lead>();
for(integer count=1; count<=10; count++){
lead ld = new lead();
ld.title = 'mr';
ld.LastName = 'SAMPLE TEST' + count;
ld.City = 'hyderabad';
ld.Company = 'c2n';
ld.gender__c = 'male';
ld.date_of_join__c = system.today();
ldlist.add(ld);
}
if(!ldlist.isEmpty()){
insert ldlist;
system.debug('the dml rows are used:  '+limits.getDmlRows());
system.debug('the dml statements are used:  '+limits.getDmlStatements());
system.debug('the total limit of dml rows are:   '+limits.getLimitDmlRows());
system.debug('the total limit of dml statements are: '+limits.getLimitDmlStatements());
}
} */
    
        /*   public static void insertaccountrelatedrecords(){
account acc = new account();
acc.AccountNumber = 'KVB123';
acc.Fax = '123456789';
acc.Name = 'testing record';
acc.SLA__c = 'gold';
acc.ANNUAL_INCOME__c = 250000;
acc.SLAExpirationDate__c = system.today();
acc.SLASerialNumber__c = '123exp';
insert acc;
list<opportunity>opplist = new list<opportunity>();
for(integer i = 1 ; i<=5; i++){
opportunity opp = new opportunity();
opp.Name = 'tesing account '+ i; 
opp.AccountId = acc.id;
opp.CloseDate = system.today();
opp.StageName = 'prospecting';
opplist.add(opp);           
}
if(!opplist.isempty()){
insert opplist;
}
list<case>cslist = new list<case>();
for(integer i=1 ; i<=5;i++){
case cs = new case();
cs.AccountId = acc.Id;
cs.Status = 'working';
cs.Origin = 'web';
cslist.add(cs);
}
if(!cslist.isEmpty()){
insert cslist;
}
system.debug('the dml rows are used:  '+limits.getDmlRows());
system.debug('the dml statements are used:  '+limits.getDmlStatements());
system.debug('the total limit of dml rows are:   '+limits.getLimitDmlRows());
system.debug('the total limit of dml statements are: '+limits.getLimitDmlStatements());
} */
    
      /* public static void relatedrecords(){
account acc = new account();
acc.AccountNumber = 'KVB456';
acc.Fax = '987456321';
acc.Name = 'record for testing ';
acc.SLA__c = 'PLATINUM';
acc.ANNUAL_INCOME__c = 550000;
acc.SLAExpirationDate__c = system.today();
acc.SLASerialNumber__c = '789FDS';
insert acc;
LIST<contact>conlist = new list<contact>();
for(integer i=1 ; i<=3; i++){
contact con = new contact();   
con.AccountId = acc.Id;
con.LastName = 'TESTING record'+i;
con.Phone = '456123977';
conlist.add(con);
}
if(!conlist.isempty()){
insert conlist;
}
for(contact cont : conlist){
case cs = new case();
cs.ContactId = cont.Id;
cs.AccountId = acc.Id;
cs.Status = 'working';
cs.Origin = 'email';
insert cs;

case cse = new case();
cse.ContactId = cont.Id;
cse.AccountId = acc.Id;
cse.Status = 'working';
cse.Origin = 'email';
insert cse; 
}
system.debug('the dml rows are used:  '+limits.getDmlRows());
system.debug('the dml statements are used:  '+limits.getDmlStatements());
system.debug('the total limit of dml rows are:   '+limits.getLimitDmlRows());
system.debug('the total limit of dml statements are: '+limits.getLimitDmlStatements());    
} */
    
      /*   public static void deleterecords(string startingchar){
startingchar+='%';
list<opportunity>opplist =  [SELECT Id,name,accountid,stagename from opportunity where name like : startingchar];
if(!opplist.isempty()){
delete opplist;
or or or or or 
    delete [SELECT Id,name,stagename from opportunity where name like : startingchar +'%'];
}
}
*/

       /*  public static void updaterecords(string stagename){ //Proposal/Price Quote
        list<opportunity> opplist=[SELECT Id, Name, StageName FROM Opportunity where stagename =: 'prospecting'];
        for(opportunity opp : opplist){
            opp.StageName = stagename;
        }
        update opplist;
    } */
    
        /*  public static void activeuser(string name){
    list<user> useractive = [SELECT Id,lastname, Username, IsActive FROM User where lastname =:name ];
for(user use : useractive){
            use.isactive = false;
        }
       update useractive;
        
    } */
    
          /* public static void autoupdateincome(){
        list<account>acclst = new list<account>();
        list<account>acclist = [SELECT Id, ANNUAL_INCOME__c, Name, Rating FROM Account where rating != null];
        for(account acc : acclist){
        if(acc.rating != null){
            if(acc.Rating == 'hot'){
                acc.ANNUAL_INCOME__c = 10000;
            }else if(acc.Rating=='warm'){
                acc.ANNUAL_INCOME__c = 20000;
            }else
                acc.ANNUAL_INCOME__c = 30000;     
        }
             acclst.add(acc);
    }
        update acclst;
  } */
    
            /*  public static void updinsertdata(){
        list<account>accupsert = new list<account>();
        list<account>acclist = [SELECT Id,Name,Rating,accountnumber FROM Account where rating = 'hot'];
        for(account acc : acclist){
            if(!acclist.isempty()){
            acc.Rating = 'cold';
            accupsert.add(acc);
      }  
    } // if-loop closed.
    account acco = new account();
    acco.AccountNumber = 'kotak 123';
    acco.Name = 'UPSERT data 2';
    acco.Rating = 'warm';
    accupsert.add(acco);   
   
        upsert accupsert;
        
        system.debug(limits.getDmlRows());
        system.debug(Limits.getDmlStatements());
        system.debug(Limits.getLimitDmlRows());
        system.debug(Limits.getLimitDmlStatements());
 }  */
    
              /*        public static void mergeaccounts(){
        ACCOUNT acc = [SELECT Id,  Name, Rating , accountnumber FROM Account where name = 'C2N'];
        LIST<ACCOUNT> acclist = [SELECT Id,  Name, Rating ,accountnumber FROM Account
                                 where name in  ('C2N IT SERVICES' ,'C2N PRODUCTIONS') ];
        IF(!ACCLIST.isempty())
        {
            merge acc acclist;
        }
    } */     
    
    /*   LIST<ACCOUNT> acclist = [SELECT Id,  Name, Rating ,accountnumber FROM Account
                                 where name in  ('C2N IT SERVICES' ,'C2N PRODUCTIONS') ];   IMPORTANT QUERYY FOR TAKING THE TWO OR MORE RECORDS WHAT WE WANT. */
}