/**
Class Name: ContactController
Test Class Name: ContactControllerTest
Created Date: 15/08/2023
**/
public with sharing class ContactController {

    // Apex method for returning list of contact to LWC   
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){      
        // Declaration of contactList  
        List<Contact> contactList = new List<Contact>(); 
        //SOQL for getting the contact records which accessible to the logged in user
        contactList = [SELECT Id, FirstName, LastName, Email  
                        FROM Contact
                        WITH SECURITY_ENFORCED
                        LIMIT : (Limits.getLimitQueryRows() - Limits.getQueryRows())];                            
        // Returning contactList
        return contactList;
    }

}