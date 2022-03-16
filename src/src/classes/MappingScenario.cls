public class MappingScenario {
    public static void mappingstate(){
      map<string,list<string>> m = new   map<string,list<string>>();
        list<string> slist = new list<string>{'warangal','hyderabad','bhupalpally','warangal'};
            m.put('telanagana',slist);
       system.debug('states cities'+m);
        system.debug('key'+m.keyset());
        system.debug('values'+m.values());
        system.debug('keyvalue'+m.get('telanagana'));
                
    }
}