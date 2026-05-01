Instance: test3-bundle
InstanceOf: EMIMedicationBundle
Usage: #example
Title: "Test 3 - Medication Bundle Example"
Description: "Example of a complete medication bundle returned from the $essential-medication-information-for-review operation."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* type = #collection
* timestamp = "2024-04-15T10:00:00-05:00"

// Patient
* entry[patient].fullUrl = "http://va.gov/fhir/emi/Patient/test3-patient"
* entry[patient].resource = test3-patient

// Allergies
* entry[allergy][+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/test3-allergy-penicillin"
* entry[allergy][=].resource = test3-allergy-penicillin

* entry[allergy][+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/test3-allergy-nsaid"
* entry[allergy][=].resource = test3-allergy-nsaid

// Medications
* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test3-prescription-lisinopril"
* entry[medication][=].resource = test3-prescription-lisinopril

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test3-prescription-metformin"
* entry[medication][=].resource = test3-prescription-metformin

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test3-reported-acetaminophen"
* entry[medication][=].resource = test3-reported-acetaminophen

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test3-reported-fishoil"
* entry[medication][=].resource = test3-reported-fishoil

// Dispenses
* entry[dispense][+].fullUrl = "http://va.gov/fhir/emi/MedicationDispense/test3-dispense"
* entry[dispense][=].resource = test3-dispense

// Pharmacy
* entry[pharmacy][+].fullUrl = "http://va.gov/fhir/emi/Organization/test3-pharmacy"
* entry[pharmacy][=].resource = test3-pharmacy

// Provider
* entry[provider][+].fullUrl = "http://va.gov/fhir/emi/Practitioner/test3-practitioner"
* entry[provider][=].resource = test3-practitioner