Instance: test4-patient
InstanceOf: EMIPatient
Usage: #example
Title: "Test 4 - Lower Quality Outpatient"
Description: "Example outpatient demonstrating common data quality gaps in medication records."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* identifier[ICN].system = $ICN
* identifier[ICN].value = "1012345680V345678"

* name[+].use = #official
* name[=].family = "Williams"
* name[=].given[+] = "James"

* birthDate = "1972-11-03"
* gender = #male

// QUALITY GAP: No address on file
