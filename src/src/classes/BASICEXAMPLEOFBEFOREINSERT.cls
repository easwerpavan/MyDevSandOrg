public class BASICEXAMPLEOFBEFOREINSERT {
    
    public static void beforetriggers(list<account>acclst,map<id,account>accmap){
        
        for(account acc : acclst){
            
            if(acc.fax == '' || acc.fax == null){
                acc.fax.adderror('FAX field must and should to fill');
            }
            else if(acc.Phone == '' || acc.Phone == null){
                acc.Phone.adderror('fill the PHONE value');
            }   
            
            integer recordcount= [select count() from account where Name =: acc.Name and phone =: acc.Phone ];
            if(recordcount>100){
                acc.Name.ADDERROR('ACCOUNT NAME ALREADY EXISTS');
                acc.Phone.adderror('PHONE NUMBER ALREADY EXISTS');
            }      
        }          
    }
}