Instance: test4-dispense
InstanceOf: EMIMedicationDispense
Usage: #example
Title: "Test 4 - MedicationDispense Example (Missing Details)"
Description: "Example of a medication dispense with missing quantity and days supply - common legacy data gap."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #completed

* medicationCodeableConcept = $RxNorm#314076 "lisinopril 10 MG Oral Tablet"
* medicationCodeableConcept.text = "LISINOPRIL 10MG TAB"

* subject = Reference(test4-patient)

// QUALITY GAP: No authorizingPrescription link
// QUALITY GAP: No quantity
// QUALITY GAP: No daysSupply

* whenHandedOver = "2024-04-02T14:15:00-05:00"

* performer[+].actor = Reference(test4-pharmacy)