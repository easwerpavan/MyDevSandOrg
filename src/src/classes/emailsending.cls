public class emailsending {
    public static void leademail(){
        list<lead> ldlist = new list<lead>();
        for(integer count=0;count<=2;count++){
        lead ld = new lead();
           // ld.Name = 'mr.';
            ld.LastName = 'leadmail'+count;
            ld.gender__c = 'male';
            ld.Status = 'Open - Not Contacted';
            ld.date_of_join__c = system.today();
            ld.Company = 'c2n it services'+count;
            ld.Email = 'pavan@'+ count + '.com';
            ld.Phone = '987456321'+ count ;
            ldlist.add(ld);
        }
        insert ldlist;
        
    }

    }
/* drawbacks in work flow and process builder :
requires an email tempates.
we cant add attachments along with email.
we can add max.of 5 cc email addresses.
we cant recieve email notifications in both wf and pb.(only outbondings).
while sending email through programming we can add email subject content and attachements along with email. 
email programming provides a set of readymade classes to be get used to 
send or receive the emails by using a namespace called as 'messaging'.
outbound email services:
=======================
we can send a email to required people by using below class.

message.singleemailmessage class.
---------------------------------------
by using these class, we can send notifications to one or more users with the requred subject and content and attcahemts to the users.
syntax:

messaging.singleemailmessage <objectname> = new messaging.singleemailmessage();

messaging.singleemailmessage EMAIL = new messaging.singleemailmessage();

*METHODS:
**********
1.settoaddresses(<list / arrays>);
this is used to add a list of email ids to be get added in the 'to address' of the email.

ex: string[] toaddress = new string[]{'pavan@gmail.com','kumar@gmail.com','eswar@gnmail.com'};
email.setTOaddresses(toaddress);

2.setCCaddresses(list/array>) ;
this method is used to add list of "cc email addresses" in the email. 

ex. string[] ccadrresses  = new string[]{'pavan@gmail.com','kumar@gmail.com','eswar@gnmail.com'};
email.setCCaddresses(ccaddress) ;

3.setBCCaddresses(<list/array>);
this method is used to add a list of "BCC addresses" in email notification.
ex. string bccaddresses = new string[]{'pavan@gmail.com','kumar@gmail.com','eswar@gnmail.com'};
email.setBCCaddresses(bccaddress);

NOTE::::   while sending a email notification we can add UPTO 150 EMAILS which inludes CC,BCC,TO.

4.setSUBJECT(string emailsubject):
this method is used to specify the email subject.
ex:email.setSUBJECT('message');

5.setREPLYTO(string replytoemailid):
this method is used to specify the replyti email address upon click on reply button.
ex:email.setREPLYTO('support@dell.com');

6.setsenderDISPLAYNAME(string senderDISPLAYNAME):
this method is used to specify the SENDER DISPLAY NAME IN THE EMAIL.
EX: email.setSENDERDISPLAYNAME('ICICI BANK CREDIT CARD');

7.setplainTEXTBODY(string emailcontent):
this method is used to add the plain text email ciontent.
ex: email.setplaintextbody(emailcontent);

8.setHTMLBody(stribngf emailci=ontent):
ex:email.sethtmlbody('html email content');

9.setfileatytachements(list<message.emailfileattachement>):
this method s used to add one or more attcahemnets along ewith file.
ex:email.setfileattachments(list<emailfileattachments>);

sending the email:
====================
once the email is ready then we can send email notoficaton to people by usib=ng send email method .
syntax:
messaging.sendemailsresult[] emailresult=messaging.sendemail(list<message.singleemailmessage> lstmessages);
                                      (orelse)
messaging.sendemailsresult[] emailresult = messaging.sendemail(new messaging.singleemailmessage[]{email});


message.massemailmessage class.
-----------------------------------------

inbound email serrvices
======================
by using these feature we can receive emails notifications
1.meassaging.inboundemailhandler interface  
*/