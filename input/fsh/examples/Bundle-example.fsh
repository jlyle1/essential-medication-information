Instance: medication-bundle-example
InstanceOf: EMIMedicationBundle
Usage: #example
Title: "EMI Medication Bundle Example"
Description: "Example of a complete medication bundle returned from the $essential-medication-information-for-review operation."

* type = #collection
* timestamp = "2024-04-15T10:00:00-05:00"

// Patient
* entry[patient].fullUrl = "http://va.gov/fhir/emi/Patient/patient-example"
* entry[patient].resource = patient-example

// Allergy List
* entry[allergyList].fullUrl = "http://va.gov/fhir/emi/List/allergy-list-example"
* entry[allergyList].resource = allergy-list-example

// Medication List
* entry[medicationList].fullUrl = "http://va.gov/fhir/emi/List/medication-list-example"
* entry[medicationList].resource = medication-list-example

// Individual Allergies
* entry[+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/allergy-penicillin-example"
* entry[=].resource = allergy-penicillin-example

* entry[+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/allergy-nsaid-example"
* entry[=].resource = allergy-nsaid-example

// Individual Medications
* entry[+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/medicationrequest-outpatient-lisinopril"
* entry[=].resource = medicationrequest-outpatient-lisinopril

* entry[+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/medicationrequest-outpatient-metformin"
* entry[=].resource = medicationrequest-outpatient-metformin

* entry[+].fullUrl = "http://va.gov/fhir/emi/MedicationStatement/medicationstatement-nonva-example"
* entry[=].resource = medicationstatement-nonva-example

* entry[+].fullUrl = "http://va.gov/fhir/emi/MedicationStatement/medicationstatement-nonva-herbal-example"
* entry[=].resource = medicationstatement-nonva-herbal-example

// Dispense
* entry[+].fullUrl = "http://va.gov/fhir/emi/MedicationDispense/medicationdispense-example"
* entry[=].resource = medicationdispense-example

// Counseling Observations
* entry[+].fullUrl = "http://va.gov/fhir/emi/Observation/counseling-observation-example"
* entry[=].resource = counseling-observation-example

* entry[+].fullUrl = "http://va.gov/fhir/emi/Observation/counseling-observation-refused-example"
* entry[=].resource = counseling-observation-refused-example

// Pharmacy
* entry[+].fullUrl = "http://va.gov/fhir/emi/Organization/pharmacy-example"
* entry[=].resource = pharmacy-example
