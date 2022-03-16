public with sharing  class userhandling {
    public static void usermanaging(list<user>newuserlist,map<id,user>newusermap){//,list<user>olduserlist,map<id,user>oldusermap){
        map<id,id> usermanageridmap = new  map<id,id>();
        for(user usr : newuserlist){
        if(!usr.IsActive){
        usermanageridmap.put(usr.id,usr.ManagerId);
       }
     }
     changemanagerid(usermanageridmap);
  }   
     @future
            public static void changemanagerid(map<id,id> usermanageridmap){
            if(!usermanageridmap.isempty()){
            list <account> accupdatedlist = new list<account>();
            for(account acc : [select id,ownerid from account where ownerid in : usermanageridmap.keyset()]){
            if(usermanageridmap.containskey(acc.OwnerId)){
                acc.OwnerId = usermanageridmap.get(acc.OwnerId);
                accupdatedlist.add(acc);
            }             
        }
                          /*   if(!usermanageridmap.isempty()){
                          list <account> accupdatedlist = new list<account>();
                          for(account acc : [select id,ownerid from account where ownerid in : usermanageridmap.keyset()]){
                          if(usermanageridmap.containskey(acc.OwnerId)){
                          acc.OwnerId = usermanageridmap.get(acc.OwnerId);
                          accupdatedlist.add(acc);
                          }            
                          }   */ 
        update accupdatedlist;
    }
  }
}