/**
Class Name: ContactControllerTest
Created Date: 15/08/2023
**/
@isTest
private class ContactControllerTest {

    // Test method
    @isTest static void unitTestMethod() {

        // Creating the account 
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.BillingStreet = '123 Street';
        acc.BillingCity = 'Riga';
        acc.BillingState = 'Riga';
        acc.BillingPostalCode = '1054';
        acc.BillingCountry = 'Latvia';        
        insert acc;

        // Creating the contact 
        Contact contact = new Contact();
        contact.FirstName = 'Test';
        contact.LastName = 'Contact';
        contact.Email = 'testemail@fakeemail.com.invalid';
        insert contact;

        // Declaration of contactList
        List<Contact> contactList = new List<Contact>();
        //Calling the main apex class method
        contactList = ContactController.getContacts();
        // Validating the size of the contactList returned by apex class
        System.assertEquals(1, contactList.size());

    }

}