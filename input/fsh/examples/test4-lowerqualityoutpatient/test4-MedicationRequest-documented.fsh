Instance: test4-documented-acetaminophen
InstanceOf: EMIDocumentedMedications
Usage: #example
Title: "Test 4 - Documented MedicationRequest Example (Minimal Data)"
Description: "Example of a documented medication with minimal data - common for patient-reported meds."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #active
* intent = #plan
* reportedBoolean = true
* category[patientSpecified] = http://terminology.hl7.org/CodeSystem/medication-statement-category#patientspecified "Patient Specified"

// QUALITY GAP: No RxNorm code, only text
* medicationCodeableConcept.text = "Tylenol"

* subject = Reference(test4-patient)
* authoredOn = "2024-01-20"

* recorder = Reference(test4-practitioner)

// QUALITY GAP: No reasonCode
// QUALITY GAP: No dosageInstruction - patient just said "I take Tylenol"

Instance: test4-documented-fishoil
InstanceOf: EMIDocumentedMedications
Usage: #example
Title: "Test 4 - Documented MedicationRequest - Herbal"
Description: "Example of a documented herbal supplement."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #active
* intent = #plan
* reportedBoolean = true
* category[patientSpecified] = http://terminology.hl7.org/CodeSystem/medication-statement-category#patientspecified "Patient Specified"

* medicationCodeableConcept.text = "Fish Oil 1000mg"

* subject = Reference(test4-patient)
* authoredOn = "2024-02-15"

* recorder = Reference(test4-practitioner)

* reasonCode[+].text = "Cholesterol support"

* dosageInstruction[+].text = "Take 2 capsules daily with food"
* dosageInstruction[=].route = $SCT#26643006 "Oral route"
