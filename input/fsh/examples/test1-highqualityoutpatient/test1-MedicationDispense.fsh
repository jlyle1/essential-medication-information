Instance: test1-dispense
InstanceOf: EMIMedicationDispense
Usage: #example
Title: "Test 1 - MedicationDispense Example"
Description: "Example of a medication dispense showing last released date."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #completed

* medicationCodeableConcept = $RxNorm#314076 "lisinopril 10 MG Oral Tablet"
* medicationCodeableConcept.text = "LISINOPRIL 10MG TAB"

* subject = Reference(test1-patient)
* authorizingPrescription = Reference(test1-prescription-lisinopril)

* quantity.value = 90
* quantity.unit = "tablet"

* daysSupply.value = 90
* daysSupply.unit = "days"
* daysSupply.system = $UCUM
* daysSupply.code = #d

* whenPrepared = "2024-04-01T10:30:00-05:00"
* whenHandedOver = "2024-04-02T14:15:00-05:00"

* performer[+].actor = Reference(test1-pharmacy)