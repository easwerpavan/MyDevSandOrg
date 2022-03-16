public class BasicCalculator {
    public static integer getValue(String Function , integer a , integer b){
        integer result;
        if(Function == '+'){
            result = a + b;            
        }else if(Function == '-'){
            result = a - b;
        }else if(Function == '*'){
            result = a * b;
        }
        system.debug('Result is::::'+ result);
        return result;
        
    }
}

// BasicCalculator.getValue('-' , 10 , 5);