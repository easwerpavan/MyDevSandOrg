public class automaticallyaccountbillingaddress {
    public static void shippingaddress(list<account> acclst){
        
        for(account acc : acclst){
           acc.ShippingState = acc.BillingState;
           acc.ShippingCity =   acc.BillingCity ;
           acc.ShippingCountry =   acc.BillingCountry ;
            acc.ShippingPostalCode = acc.BillingPostalCode;
            acc.ShippingStreet = acc.BillingStreet;
          
        }
   }
}