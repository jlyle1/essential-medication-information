Instance: test-patient-1-bundle
InstanceOf: EMIMedicationBundle
Usage: #example
Title: "EMI Medication Bundle Example"
Description: "Example of a complete medication bundle returned from the $essential-medication-information-for-review operation."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* type = #collection
* timestamp = "2024-04-15T10:00:00-05:00"

// Patient
* entry[patient].fullUrl = "http://va.gov/fhir/emi/Patient/test-patient-1-patient"
* entry[patient].resource = test-patient-1-patient

// Allergies
* entry[allergy][+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/test-patient-1-allergy-penicillin"
* entry[allergy][=].resource = test-patient-1-allergy-penicillin

* entry[allergy][+].fullUrl = "http://va.gov/fhir/emi/AllergyIntolerance/test-patient-1-allergy-nsaid"
* entry[allergy][=].resource = test-patient-1-allergy-nsaid

// Medications
* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test-patient-1-outpatient-lisinopril"
* entry[medication][=].resource = test-patient-1-outpatient-lisinopril

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test-patient-1-outpatient-metformin"
* entry[medication][=].resource = test-patient-1-outpatient-metformin

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test-patient-1-reported-acetaminophen"
* entry[medication][=].resource = test-patient-1-reported-acetaminophen

* entry[medication][+].fullUrl = "http://va.gov/fhir/emi/MedicationRequest/test-patient-1-reported-fishoil"
* entry[medication][=].resource = test-patient-1-reported-fishoil

// Dispenses
* entry[dispense][+].fullUrl = "http://va.gov/fhir/emi/MedicationDispense/test-patient-1-dispense"
* entry[dispense][=].resource = test-patient-1-dispense

// Counseling Procedures
* entry[counseling][+].fullUrl = "http://va.gov/fhir/emi/Procedure/test-patient-1-counseling-done"
* entry[counseling][=].resource = test-patient-1-counseling-done

* entry[counseling][+].fullUrl = "http://va.gov/fhir/emi/Procedure/test-patient-1-counseling-notdone"
* entry[counseling][=].resource = test-patient-1-counseling-notdone

// Pharmacy
* entry[pharmacy][+].fullUrl = "http://va.gov/fhir/emi/Organization/test-patient-1-pharmacy"
* entry[pharmacy][=].resource = test-patient-1-pharmacy

// Provider
* entry[provider][+].fullUrl = "http://va.gov/fhir/emi/Practitioner/test-patient-1-practitioner"
* entry[provider][=].resource = test-patient-1-practitioner