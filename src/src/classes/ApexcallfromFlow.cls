public class ApexcallfromFlow {
 @InvocableMethod(label = 'Delete Related OPportunities')
    public static void deleteCase(List<ID> accountIds){
        List<Case> caseList = [select id from Case where AccountId = : accountIds AND Status = 'closed'];
        delete caseList;
    }
}