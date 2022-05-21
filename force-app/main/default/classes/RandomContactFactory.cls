public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer numCont, String strLastName){
        
        List<Contact> contactList = new List<Contact>();
        
        for(Integer i=0;i<numCont;i++) {
            Contact cont = new Contact(LastName=strLastName,FirstName='Tester' + i);
            contactList.add(cont);
        }

        return contactList;
        
    }
    
}