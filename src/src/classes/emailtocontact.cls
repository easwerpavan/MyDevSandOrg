public class emailtocontact {
    public static void contactemail(list<account> acclist,list<account> oldacclist,map<id,account> oldmapacc){
        
        list<Messaging.SingleEmailMessage> mails = new list<messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
        
        set<id>accids = new set<id>();    
        for(account acc : acclist){
            if(acc != null){
                Account oldAcc=oldmapacc.get(acc.id); 
                if(acc.Type != oldacc.Type){
                    accids.add(acc.id);
                }
            }
        }
        
        list<contact> conlist = [select id,email,accountid,lastname from contact where accountid in: accids];
        for(contact con :conlist){
            list<string> sendto = new list<string>();
            sendto.add(con.Email);
            mail.setToAddresses(sendto);
            mail.setReplyTo('easwerpavan436@gmail.com');
            mail.setSenderDisplayName('PAVAN KUMAR--->>>SALES ADMIN USER');
            mail.setsubject('Account Update Info');
            mail.setHtmlBody('Your account information has been updated successfully.Account Name'+' '+con.Name);
            mails.add(mail);
            messaging.sendemail(mails);
        }
    }
}