Instance: test-patient-1-practitioner
InstanceOf: EMIPractitioner
Usage: #example
Title: "Example Practitioner - Dr. Jane Doe"
Description: "Example practitioner for medication requests."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* identifier[+].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value = "1234567890"

* active = true

* name[+].family = "Doe"
* name[=].given[+] = "Jane"
* name[=].prefix[+] = "Dr."

* telecom[+].system = #phone
* telecom[=].value = "555-555-1234"
* telecom[=].use = #work

* qualification[+].code.coding[+].system = "http://terminology.hl7.org/CodeSystem/v2-0360"
* qualification[=].code.coding[=].code = #MD
* qualification[=].code.coding[=].display = "Doctor of Medicine"
* qualification[=].code.text = "MD"