public class Trycatch {
    public static void error(){
        
try{
        Account a = new Account();
        a.Name = 'TEST DRIVE X6';                     /* when we keep tyr catch at inside a Account or outside the Account,
                                                                  Account will be created but when we use savepoint then account 
                                                                            cannot be created*/
        insert a;
                system.debug(' the account '+a);
//try{                       
        list <Contact> conlist = new list<Contact>();
        
            for (integer i=0 ; i<5;i++){ 
            contact con = new contact();
                if(i!=2){
            con.LastName='Apex Test:: '+i;
             }
            con.AccountId=a.id;
            conlist.add(con);
            }
            insert conlist;
            
}catch(Exception ex){
            system.debug('the error occurs due to the filed missing');
       
                   }
   }
}