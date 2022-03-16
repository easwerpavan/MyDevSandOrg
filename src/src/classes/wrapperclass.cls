public class wrapperclass {          /* outer calss */
          public class  wrapper{     /* innerclass */
               string pname;
               string phn;
               integer roll;
               boolean isactive;
} 
           public  wrapper  display4(){
               string personname = 'pavan';              /* ananomous window
                                                                  wrapperclass obj=new wrapperclass ();
                                                                       wrapperclass.wrapper  value =obj.display4();
                                                                        outercalss.innerclass model
                                                                           system.debug(value);*/
               string phnno='1234567890';
               integer roll= 436;
               boolean isactive=true;
               
                 wrapper wp = new wrapper();
                 wp.pname = personname;
                 wp.phn=phnno;
                 wp.roll=roll;
                 wp.isactive=isactive;
                     return wp;
              } 
    }