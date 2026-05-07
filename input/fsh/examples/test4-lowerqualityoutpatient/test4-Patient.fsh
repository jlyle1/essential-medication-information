Instance: test4-patient
InstanceOf: EMIPatient
Usage: #example
Title: "Test 4 - Lower Quality Outpatient"
Description: "Example outpatient with lower quality medication data demonstrating common data gaps."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* identifier[ICN].system = $ICN
* identifier[ICN].value = "1012345680V345678"

* name[+].use = #official
* name[=].family = "Williams"
* name[=].given[+] = "James"
* name[=].given[+] = "Thomas"

* birthDate = "1972-11-03"
* gender = #male

* address[+].use = #home
* address[=].line[+] = "789 Pine Street"
* address[=].city = "Hampton"
* address[=].state = "VA"
* address[=].postalCode = "23669"
