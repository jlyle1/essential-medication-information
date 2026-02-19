Instance: pharmacy-example
InstanceOf: EMIPharmacyOrganization
Usage: #example
Title: "EMI Pharmacy Organization Example"
Description: "Example of a VA pharmacy organization."

* active = true
* type[pharmacy] = $V3ActCode#OUTPHARM

* name = "VA Medical Center Pharmacy - Building 1"

* telecom[phone].system = #phone
* telecom[phone].value = "555-123-4567"
* telecom[phone].use = #work

* telecom[+].system = #fax
* telecom[=].value = "555-123-4568"
* telecom[=].use = #work

* address[+].use = #work
* address[=].type = #physical
* address[=].line[+] = "100 Veterans Way"
* address[=].line[+] = "Building 1, Room 101"
* address[=].city = "Anytown"
* address[=].state = "VA"
* address[=].postalCode = "12345"
* address[=].country = "USA"
