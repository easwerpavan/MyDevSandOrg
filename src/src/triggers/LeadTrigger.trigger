trigger LeadTrigger on Lead (before insert,before update) {
    if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
        /* for(lead lde : trigger.new){
if(lde.industry == '' || lde.industry == null){
lde.industry.adderror('required filed');
}
} */        
        for(lead ld : trigger.new){
            
            if(ld.industry == '' || ld.industry == null){
                ld.industry.adderror('required filed');
            }
            
            if(ld.industry == 'banking'){
                ld.AnnualRevenue = 90000;
            }else if(ld.Industry == 'agriculture'){
                ld.AnnualRevenue = 80000;
            }else if(ld.Industry == 'biotechnology'){
                ld.AnnualRevenue = 70000;
            }else if(ld.Industry == 'communications'){
                ld.AnnualRevenue = 60000;
            }else if(ld.Industry == 'apparel'){
                ld.AnnualRevenue = 50000;
            }
            
            if(ld.State == '' || ld.State == null){
                ld.State.adderror('state field required.');
            }else if(ld.City == '' || ld.City == null){
                ld.City.adderror('city field required');  
            }else if(ld.PostalCode == '' || ld.PostalCode == null){
                ld.PostalCode.adderror('postal code must and should');
            }else if(ld.Country == ''  || ld.Country == null){
                ld.Country.adderror('Country wil be required');
            }  if(ld.Street == ''  || ld.Street == null){
                ld.Street.adderror('Street wil be required');
            }                      
        }      
    }
}