Instance: test1-patient
InstanceOf: EMIPatient
Usage: #example
Title: "Test 1 - High Quality Outpatient"
Description: "Example outpatient with high quality medication data including prescriptions, reported meds, and allergies."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* identifier[ICN].system = $ICN
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