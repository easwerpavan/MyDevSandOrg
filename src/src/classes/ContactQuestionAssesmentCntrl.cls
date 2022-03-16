public class ContactQuestionAssesmentCntrl {
    @AuraEnabled 
    public static  Map<string,questionwrapperclass> getResponse(){
        Map<string,questionwrapperclass> questionFinalWrapper=new Map<string,questionwrapperclass>();
        List<questionwrapperclass> objlist = new List<questionwrapperclass>();  
        Map<string,List<string>> mapResponseEntity = new Map<string,List<string>>();  
        List<Responses__c> resplist =  [SELECT Id, Name, Question_Master__c, Answer_Text__c, Sorting_Number__c, Question_Master__r.Question_Type__c  FROM Responses__c ORDER BY Sorting_Number__c];
        Map<Id,Question_Master__c> quesMap = new Map<Id,Question_Master__c>([SELECT Id,Name, Question_Text__c,Question_Type__c FROM Question_Master__c]);       
        Map<Id,List<responsewrapperclass>> questionResponseMap=new Map<Id,List<responsewrapperclass>>();        
        responsewrapperclass respObj;
        for(Responses__c eachResponse :resplist){ 
            respObj = new responsewrapperclass();
            respObj.Answertext=eachResponse.Answer_Text__c;
            respObj.responseId=eachResponse.Id;
            respObj.questionId=eachResponse.Question_Master__c;
            respObj.SortingNumber=Integer.valueof(eachResponse.Sorting_Number__c);            
            if(mapResponseEntity.containskey(eachResponse.Question_Master__c)){                 
                mapResponseEntity.get(eachResponse.Question_Master__c).add(eachResponse.Answer_Text__c);               
            }else if(!mapResponseEntity.containskey(eachResponse.Question_Master__c)){                 
                mapResponseEntity.put(eachResponse.Question_Master__c,new List<string>{eachResponse.Answer_Text__c});
            }
            if(!questionResponseMap.containskey(eachResponse.Question_Master__c)){                 
                questionResponseMap.put(eachResponse.Question_Master__c,new List<responsewrapperclass>{respObj});               
            }else if(questionResponseMap.containskey(eachResponse.Question_Master__c)){                 
                questionResponseMap.get(eachResponse.Question_Master__c).add(respObj);
            }
        }
        questionwrapperclass queObj;
        for(Question_Master__c eachQuestion : quesMap.values()){    
            queObj =  new questionwrapperclass();
            queObj.questionText = eachQuestion.Question_Text__c;
            queObj.questionId = eachQuestion.Id;
            queObj.questionType = eachQuestion.Question_Type__c; 
            queObj.selectedResponse='';
            if(questionResponseMap.containsKey(eachQuestion.Id)){
                queObj.responseWrapper =questionResponseMap.get(eachQuestion.Id);                   
            }else{
                queObj.responseWrapper = new List<responsewrapperclass>();  
            }
            queObj.responseMap= questionResponseMap;
            queObj.responseObject='';
            questionFinalWrapper.put(eachQuestion.Question_Text__c,queObj);
        }           
        return questionFinalWrapper;           
    }    
    public class questionwrapperclass{
        @AuraEnabled public string questionText{get;set;}
        @AuraEnabled public string questionType{get;set;}
        @AuraEnabled public string questionId{get;set;}
        @AuraEnabled public Object responseObject{get;set;}
        @AuraEnabled public String selectedResponse{get;set;}
        @AuraEnabled public Map<Id,List<responsewrapperclass>> responseMap{get;set;}
        @AuraEnabled public List<responsewrapperclass> responseWrapper{get;set;}       
    }  
    public class responsewrapperclass{
        @AuraEnabled public string Answertext{get;set;}
        @AuraEnabled public string responseId{get;set;}
        @AuraEnabled public string questionId{get;set;}
        @AuraEnabled public Integer SortingNumber{get;set;}
    } 
    @AuraEnabled 
    public static void updateContact(String details){
        
    }
}