public with sharing class Error_Handling_Testing {
    /*******************************************************************************************************
    * DO NOT COMMI!!!!!!!!!
    * The methods below are onnly for testing error handling
    */

    /*** Contacts ***/

    public static void inserContactWithAddress() {
        Contact newCont = new Contact(
            FirstName = 'Tommy',
            LastName = 'Twoshoes'+String.valueOf( System.now().day() + ' ' + System.now().minute() ),
            MailingStreet = '!234 MailingStreet Rd',
            MailingCity = 'That Place',
            MailingState = 'California',
            MailingPostalCode = '91134'
        );

        insert newCont;
    }

    @future
    public static void inserContactWithAddressFuture() {
        inserContactWithAddress();
    }

    public static void inserContactAddress(Id contId) {
        Address__c newAddr = new Address__c(
            MailingStreet__c = 'TRIGGER SCREET',
            MailingCity__c = 'TRIGGER CITY',
            Default_Address__c = false,
            Parent_Contact__c = contId 
        );

        insert newAddr;
    }

    /*** Accounts ***/

    public static String inserAccountWithAddress() {
        Account newAccount = new Account(
            Name = 'Tommy place of business' +String.valueOf( System.now().day() + ' ' + System.now().minute() ),
            RecordTypeId = '01241000000KFqFAAW', // Business Organization
            // RecordTypeId = '01241000000KFqEAAW', // Administrative
            BillingStreet = '!234 MailingStreet Rd',
            BillingCity = 'That Place',
            BillingState = 'California',
            BillingPostalCode = '91134'
        );

        insert newAccount;

        return newAccount.Id;
    }

    public static void inserAccountAddress(Id AcctId) {
        Address__c newAddr = new Address__c(
            MailingStreet__c = 'TRIGGER SCREET',
            MailingCity__c = 'TRIGGER CITY',
            Default_Address__c = false,
            Parent_Account__c = AcctId // THIS FORCES AN ERROR
        );

        insert newAddr;
    }
}