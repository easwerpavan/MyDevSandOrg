public class emailcontact {
    public static void emailsender(list<CANDIDATES__c> newlist,list<CANDIDATES__c> oldlist){
        
        // CREATE A MASTER LIST TO HOLD EMAILS WE'LL SEND.
        
        list<Messaging.SingleEmailMessage> MAILS = new list<messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage MAIL =  new Messaging.SingleEmailMessage();
        
        set<id> conid = new set<id>(); 
        
        if(newlist != null){
            for(CANDIDATES__c can : newlist){
                if(can.contact__c != null){
                    conid.add(can.contact__c); 
                    MAIL.setSubject('a new CANDIDATE record is created on basis of your account name');
                    string body = 'dear'+'please verify the candidate user is created';
                    MAIL.setHtmlBody(body);
                }
            }
        }
        if(oldlist != null){
            for(CANDIDATES__c can : oldlist){
                if(can.contact__c != null){
                    conid.add(can.contact__c); 
                    MAIL.setSubject('a new CANDIDATE record is created on basis of your account name');
                    string body = 'dear please verify the candidate user is deleted'; 
                    MAIL.setHtmlBody(body);  
                }
            }
        }
        contact conlist = [Select firstname,lastname,email,id,name,MobilePhone from Contact where id in :ConId];
        
        // Set list of people who should get the mail. 
        
        list<string>  sendto = new list<string>();
        sendto.add(conlist.email);
        MAIL.settoaddresses(sendto);
        
        // set who the email is sent from
        MAIL.setReplyTo('mahidhar.c2n@gmail.com');
        MAIL.setSenderDisplayName('PAVAN KUMAR---SALES ADMIN USER');
        
        // add your email to master list.
        MAILS.ADD(MAIL);
        Messaging.sendemail(MAILS);
    }
}

/*
list<messaging.singleemailmessage> mails = new list<messaging.singleemailmessage>();   

messaging.singleemailmessage mail = messaging.singleemailmessage();

list<string>sendto = new list<string>();
sendto.add(con.email);
mail.settoaddress(sendto);

mail.setreplyto('gmail');
mail.setsenderdispalyname('name');

mail.setsubject('subject');
string body = '';
mail.sethtmlbody(body);

mails.add(mail);
messaging.sendemail(mails);

*/