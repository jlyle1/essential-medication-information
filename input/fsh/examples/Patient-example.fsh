Instance: patient-example
InstanceOf: EMIPatient
Usage: #example
Title: "EMI Patient Example"
Description: "Example of a VA patient with ICN identifier."

* identifier[ICN].system = "urn:oid:2.16.840.1.113883.4.349"
* identifier[ICN].value = "1012345678V123456"

* name[+].use = #official
* name[=].family = "Smith"
* name[=].given[+] = "John"
* name[=].given[+] = "Robert"

* birthDate = "1960-05-15"
* gender = #male

* address[+].use = #home
* address[=].line[+] = "123 Main Street"
* address[=].city = "Anytown"
* address[=].state = "VA"
* address[=].postalCode = "12345"
