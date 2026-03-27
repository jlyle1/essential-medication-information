Instance: medication-bundle-example
InstanceOf: EMIMedicationBundle
Usage: #example
Title: "EMI Medication Bundle Example"
Description: "Example of a complete medication bundle returned from the $essential-medication-information-for-review operation."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* type = #collection
* timestamp = "2024-04-15T10:00:00-05:00"

// Patient
* entry[patient].fullUrl = "http://va.gov/fhir/emi/Patient/testpatient1-patient"
* entry[patient].resource = testpatient1-patient

// Allergies
* entry[allergy][+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/allergy-penicillin-example"
* entry[allergy][=].resource = allergy-penicillin-example

* entry[allergy][+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/allergy-nsaid-example"
* entry[allergy][=].resource = allergy-nsaid-example

// Medications
* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/medicationrequest-outpatient-lisinopril"
* entry[medication][=].resource = medicationrequest-outpatient-lisinopril

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/medicationrequest-outpatient-metformin"
* entry[medication][=].resource = medicationrequest-outpatient-metformin

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationStatement/medicationstatement-external-example"
* entry[medication][=].resource = medicationstatement-external-example

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationStatement/medicationstatement-external-herbal-example"
* entry[medication][=].resource = medicationstatement-external-herbal-example

// Dispenses
* entry[dispense][+].fullUrl = "http://va.gov/fhir/emi/MedicationDispense/medicationdispense-example"
* entry[dispense][=].resource = medicationdispense-example

// Counseling Procedures
* entry[counseling][+].fullUrl = "http://va.gov/fhir/emi/Procedure/counseling-procedure-example"
* entry[counseling][=].resource = counseling-procedure-example

* entry[counseling][+].fullUrl = "http://va.gov/fhir/emi/Procedure/counseling-procedure-notdone-example"
* entry[counseling][=].resource = counseling-procedure-notdone-example

// Pharmacy
* entry[pharmacy][+].fullUrl = "http://va.gov/fhir/emi/Organization/pharmacy-example"
* entry[pharmacy][=].resource = pharmacy-example
