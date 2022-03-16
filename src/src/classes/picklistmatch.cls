public class picklistmatch {
    
      @AuraEnabled
    public static Map<String, String> getques(){

        Map<String, String> options = new Map<String, String>();

        Schema.DescribeFieldResult fieldResult = contact.leadsource.getDescribe();      

        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();

        for (Schema.PicklistEntry p: pList) {           

            options.put(p.getValue(), p.getLabel());

        }

        return options;

    }
    
    
    
 @AuraEnabled //Save Questions Data

    Public static void editcontact(contact objacc)
    {

        try{

            //Insert Questions Record

            insert objacc;

             

        }catch(Exception e){

            //throw exception message

            throw new AuraHandledException(e.getMessage());

        }

        finally {

        }

    }

}