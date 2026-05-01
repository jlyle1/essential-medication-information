Instance: test1-bundle
InstanceOf: EMIMedicationBundle
Usage: #example
Title: "Test 1 - Medication Bundle Example"
Description: "Example of a complete medication bundle returned from the $essential-medication-information-for-review operation."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* type = #collection
* timestamp = "2024-04-15T10:00:00-05:00"

// Patient
* entry[patient].fullUrl = "http://va.gov/fhir/emi/Patient/test1-patient"
* entry[patient].resource = test1-patient

// Allergies
* entry[allergy][+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/test1-allergy-penicillin"
* entry[allergy][=].resource = test1-allergy-penicillin

* entry[allergy][+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/test1-allergy-nsaid"
* entry[allergy][=].resource = test1-allergy-nsaid

// Medications
* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test1-prescription-lisinopril"
* entry[medication][=].resource = test1-prescription-lisinopril

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test1-prescription-metformin"
* entry[medication][=].resource = test1-prescription-metformin

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test1-documented-acetaminophen"
* entry[medication][=].resource = test1-documented-acetaminophen

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test1-documented-fishoil"
* entry[medication][=].resource = test1-documented-fishoil

// Dispenses
* entry[dispense][+].fullUrl = "http://va.gov/fhir/emi/MedicationDispense/test1-dispense"
* entry[dispense][=].resource = test1-dispense

// Pharmacy
* entry[pharmacy][+].fullUrl = "http://va.gov/fhir/emi/Organization/test1-pharmacy"
* entry[pharmacy][=].resource = test1-pharmacy

// Provider
* entry[provider][+].fullUrl = "http://va.gov/fhir/emi/Practitioner/test1-practitioner"
* entry[provider][=].resource = test1-practitioner