public class UndeleteApexclass {     
@InvocableMethod
public static void UndeleteRecords(List<List<string>> recordIds){           
List<Id> idList = recordIds[0];
if(!idList.isEmpty()){
Database.undelete(idList);
}
}

}