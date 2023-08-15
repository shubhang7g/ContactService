import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts'; // Calling apex class method to get contact list

// Variable to store columns for contact lightning data table
const columns = [
    // Column for contact first name
    { 
        label: 'First Name', 
        fieldName: 'FirstName'
    },
    // Column for contact last name
    { 
        label: 'Last Name', 
        fieldName: 'LastName'
    },
    // Column for contact email
    { 
        label: 'Email', 
        fieldName: 'Email', 
        type: 'email'
    }
];

export default class ContactList extends LightningElement {
    
    columns = columns;   // Setting columns for lightning data table
    contacts; // Variable to store list of contacts
    error; // Variable to store error
    showDataTable = false; // Variable to show data table when there are contact records

    // Using wire property to get response from apex and store in result
    @wire(getContacts)
    contactData(result) {       
        if(result.data){
           this.contacts = result.data;  //Assign data property to the contacts
           if(result.data.length){
               this.showDataTable = true;  // Show data table only when contact record exists
           }
           this.error = undefined;  // Setting the error as undefined
        }          
        if (result.error) {
            this.error = result.error;  // Assign error property to the error variable    
             this.contacts = undefined;  // Setting the contacts as undefined      
        }    
    };
}