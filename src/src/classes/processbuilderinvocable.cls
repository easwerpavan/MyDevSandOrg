public class processbuilderinvocable {
   
    @invocablemethod(label = 'referencename' description = 'By using apex we created a record.')
        
    public static void methodname(list<account> acclist){ 
         
                list<contact> conlst = new list<contact>();
      
                if(!acclist.isempty()){
            
                for(account acc : acclist){
                
                if(acc.priority__c == 'medium' ){
                    
                    contact con = new contact(); 
                    con.lastName = 'invocable testing method';
                    con.Title = 'mr.';
                    con.AccountId = acc.id;
                    con.ACCOUNT_NUMBER__c = 'PA01';
                    con.Email = 'pavankumar@c2n.in';
                    con.Phone = '98742136510';
                    conlst.add(con);
                } 
              }  
                    insert conlst;
         }
      }
    public static void methodname(map<id,account> accmap){ 
          
                list<opportunity> opplst = new list<opportunity>();
               
                if(!accmap.isempty()){
            
                for(account acc : accmap.values()){
                
                if(acc.priority__c == 'low' ){    
                    opportunity opp = new opportunity();
                    opp.AccountId = acc.id;
                    opp.Name = 'INVOCABLE TESTING METHOD';
                    opp.StageName = 'Value Proposition';
                    opp.CloseDate = system.today();           
                    opplst.add(opp);
                }   
            }      
                    insert opplst; 
        }
    }  
 }