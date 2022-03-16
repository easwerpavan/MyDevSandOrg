public class methodstatements {
    public string fname='test';
    public string lname='drive';
    
   public void createrecord(string fname,string lname){
        contact con=new contact();
        con.FirstName=fname;
        con.LastName=lname;
        insert con;              
    }

    public void createmultirecords(integer count){
        list<contact> conlist=new list<contact>();
        for(integer i=0;i<count;i++){
            contact con=new contact();
        con.FirstName=fname+i;
        con.LastName=lname; 
            conlist.add(con);
            system.debug('the contact recently vreated are: '+conlist);
    }
insert conlist;
    }   
}