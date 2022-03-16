public class apex {
    public static void apexmap(){
                
        Set<Id> setAccId = new Set<ID>();
        
        List<Contact> lstCont = [select accountID,FirstName,lastName from contact];
        
        For(Contact cont: lstCont)
            
        {            
            setAccId.add(cont.accountID); // Get All AccountId
        }
        
        Map<Id,Account> mapAcc = new Map<Id,Account>( [ select id,name from Account where id in :setAccId ] ); 
        
        For(Contact cont: lstCont)
            
        {
            
            if( mapAcc.containsKey(cont.accountID) ) 
                
            {
                Account acc = mapAcc.get(cont.accountID);
                
                System.debug('Account vs studio------------>'+acc);
                
            }
        }
    }
}