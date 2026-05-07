Instance: test4-bundle
InstanceOf: EMIMedicationBundle
Usage: #example
Title: "Test 4 - Medication Bundle Example"
Description: "Example of a complete medication bundle returned from the $essential-medication-information-for-review operation."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* type = #collection
* timestamp = "2024-04-15T10:00:00-05:00"

// Patient
* entry[patient].fullUrl = "http://va.gov/fhir/emi/Patient/test4-patient"
* entry[patient].resource = test4-patient

// Allergies
* entry[allergy][+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/test4-allergy-penicillin"
* entry[allergy][=].resource = test4-allergy-penicillin

* entry[allergy][+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/test4-allergy-nsaid"
* entry[allergy][=].resource = test4-allergy-nsaid

// Medications
* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test4-prescription-lisinopril"
* entry[medication][=].resource = test4-prescription-lisinopril

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test4-prescription-metformin"
* entry[medication][=].resource = test4-prescription-metformin

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test4-documented-acetaminophen"
* entry[medication][=].resource = test4-documented-acetaminophen

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test4-documented-fishoil"
* entry[medication][=].resource = test4-documented-fishoil

// Dispenses
* entry[dispense][+].fullUrl = "http://va.gov/fhir/emi/MedicationDispense/test4-dispense"
* entry[dispense][=].resource = test4-dispense

// Pharmacy
* entry[pharmacy][+].fullUrl = "http://va.gov/fhir/emi/Organization/test4-pharmacy"
* entry[pharmacy][=].resource = test4-pharmacy

// Provider
* entry[provider][+].fullUrl = "http://va.gov/fhir/emi/Practitioner/test4-practitioner"
* entry[provider][=].resource = test4-practitioner