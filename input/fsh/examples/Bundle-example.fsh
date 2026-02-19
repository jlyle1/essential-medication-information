Instance: medication-bundle-example
InstanceOf: EMIMedicationBundle
Usage: #example
Title: "EMI Medication Bundle Example"
Description: "Example of a complete medication bundle returned from the $medication-list operation."

* type = #collection
* timestamp = "2024-04-15T10:00:00-05:00"

// Patient
* entry[patient].fullUrl = "urn:uuid:patient-example"
* entry[patient].resource = patient-example

// Allergy List
* entry[allergyList].fullUrl = "urn:uuid:allergy-list-example"
* entry[allergyList].resource = allergy-list-example

// Medication List
* entry[medicationList].fullUrl = "urn:uuid:medication-list-example"
* entry[medicationList].resource = medication-list-example

// Individual Allergies
* entry[+].fullUrl = "urn:uuid:allergy-penicillin-example"
* entry[=].resource = allergy-penicillin-example

* entry[+].fullUrl = "urn:uuid:allergy-nsaid-example"
* entry[=].resource = allergy-nsaid-example

// Individual Medications
* entry[+].fullUrl = "urn:uuid:medicationrequest-outpatient-lisinopril"
* entry[=].resource = medicationrequest-outpatient-lisinopril

* entry[+].fullUrl = "urn:uuid:medicationrequest-outpatient-metformin"
* entry[=].resource = medicationrequest-outpatient-metformin

* entry[+].fullUrl = "urn:uuid:medicationstatement-nonva-example"
* entry[=].resource = medicationstatement-nonva-example

* entry[+].fullUrl = "urn:uuid:medicationstatement-nonva-herbal-example"
* entry[=].resource = medicationstatement-nonva-herbal-example

// Dispense
* entry[+].fullUrl = "urn:uuid:medicationdispense-example"
* entry[=].resource = medicationdispense-example

// Counseling Observations
* entry[+].fullUrl = "urn:uuid:counseling-observation-example"
* entry[=].resource = counseling-observation-example

* entry[+].fullUrl = "urn:uuid:counseling-observation-refused-example"
* entry[=].resource = counseling-observation-refused-example

// Pharmacy
* entry[+].fullUrl = "urn:uuid:pharmacy-example"
* entry[=].resource = pharmacy-example
