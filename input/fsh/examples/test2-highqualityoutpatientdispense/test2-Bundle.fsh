Instance: test2-bundle
InstanceOf: EMIMedicationBundle
Usage: #example
Title: "Test 2 - Medication Bundle Example (Dispense-based)"
Description: "Example of a medication bundle using dispense records for last released date instead of calculated extensions."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* type = #collection
* timestamp = "2024-04-15T10:00:00-05:00"

// Patient
* entry[patient].fullUrl = "http://va.gov/fhir/emi/Patient/test2-patient"
* entry[patient].resource = test2-patient

// Allergies
* entry[allergy][+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/test2-allergy-penicillin"
* entry[allergy][=].resource = test2-allergy-penicillin

* entry[allergy][+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/test2-allergy-nsaid"
* entry[allergy][=].resource = test2-allergy-nsaid

// Medications
* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test2-prescription-lisinopril"
* entry[medication][=].resource = test2-prescription-lisinopril

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test2-prescription-metformin"
* entry[medication][=].resource = test2-prescription-metformin

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test2-documented-acetaminophen"
* entry[medication][=].resource = test2-documented-acetaminophen

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test2-documented-fishoil"
* entry[medication][=].resource = test2-documented-fishoil

// Pharmacy
* entry[pharmacy][+].fullUrl = "http://va.gov/fhir/emi/Organization/test2-pharmacy"
* entry[pharmacy][=].resource = test2-pharmacy

// Provider
* entry[provider][+].fullUrl = "http://va.gov/fhir/emi/Practitioner/test2-practitioner"
* entry[provider][=].resource = test2-practitioner