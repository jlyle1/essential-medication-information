Instance: test2-patient
InstanceOf: EMIPatient
Usage: #example
Title: "Test 2 - High Quality Inpatient"
Description: "Example inpatient with high quality medication data including IV and unit dose orders."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* identifier[ICN].system = $ICN
* identifier[ICN].value = "1012345679V234567"

* name[+].use = #official
* name[=].family = "Garcia"
* name[=].given[+] = "Maria"
* name[=].given[+] = "Elena"

* birthDate = "1955-08-22"
* gender = #female

* address[+].use = #home
* address[=].line[+] = "456 Oak Avenue"
* address[=].city = "Richmond"
* address[=].state = "VA"
* address[=].postalCode = "23220"
