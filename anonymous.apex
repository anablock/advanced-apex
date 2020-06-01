/*
List<Integer> threeNumbers = new List<Integer>();
threeNumbers.add(1);
threeNumbers.add(2);
threeNumbers.add(3);

Integer threeNumbersSize = threeNumbers.size();
integer iterator = 0;

while (iterator < threeNumbersSize) {
    System.debug('While loop iteration : ' + threeNumbers[iterator]);
    iterator++;
}

for (iterator = 0; iterator < threeNumbersSize; iterator++) {
    System.debug('For Loop iteration: ' + threeNumbers[iterator]);
}

for (Integer i :threeNumbers) {
    System.debug('List loop iteration: ' + i);
}

try {
    Integer threeNumbersSize = threeNumbers.size();
    Integer fourthElement = threeNumbers[threeNumbersSize + 1];
} catch (Exception e) {
    System.debug('Exception caught.');
}
finally {
    System.debug('This block executes regardless of exceptions.');
}

// Returns the total number of SOQL queries allowed per transaction
System.debug('NUMBER OF QUERIES IN TOTAL: ' + Limits.getLimitQueries());

Integer i;
for (i=0; i<100; i++) {
    List<Account> currentAccount = [SELECT Id FROM Account LIMIT 1];
    // Returns the number of SOQL queries that have been issued
    System.debug('NUMBER of QUERIES ISSUED : ' + Limits.getQueries());
}
*/

List<Contact> contacts = new List<Contact>();
for (Contact aContact : [SELECT Id FROM Contact]) {
    //modify aContact
    contacts.add(aContact);
}
Database.update(contacts);

for(List<Contact> contacts2 : [SELECT Id FROM Contact]) {
    for(Contact aContact : contacts2) {
        // modify aContact
    }
    Database.update(contacts2);
}