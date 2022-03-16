public class UPDATECUSTOMER {
    public static void afterinsert(list<account>acclist){ 
        list<CUSTOMER__c>cuslist = new list<CUSTOMER__c>();
        for(account acc : acclist){
            CUSTOMER__c cus = new CUSTOMER__c();
            cus.Name = acc.Name;
            cus.ACCOUNT_NUMBER__c = acc.AccountNumber;
            cus.FAX_NUMBER__c = acc.Fax;
            cus.PHONE_NUMBER__c = acc.Phone;
            cus.Account__c = acc.Id;
            cuslist.add(cus);
        }
        if(!cuslist.isempty()){
            INSERT cuslist;
        }
    }
    
    public static void afterupdate(map<id,account>accmap){
        
        list<CUSTOMER__c>cuslst = [select id,name,ACCOUNT_NUMBER__c,FAX_NUMBER__c,PHONE_NUMBER__c,Account__c from CUSTOMER__c
                                   where Account__c in : accmap.keyset()];
        
        list<CUSTOMER__c>clist = new list<CUSTOMER__c>();
        
        for(CUSTOMER__c cus : cuslst){
            
            account acc = accmap.get(cus.account__c);
            
            cus.Name = acc.Name;
            cus.ACCOUNT_NUMBER__c = acc.AccountNumber;
            cus.PHONE_NUMBER__c = acc.Phone;
            cus.FAX_NUMBER__c = acc.Fax;
            
            clist.add(cus);
        } if(!clist.isempty()){
            update clist;
        }
    }
    
}