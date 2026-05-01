Instance: test3-documented-acetaminophen
InstanceOf: EMIDocumentedMedications
Usage: #example
Title: "Test 3 - Documented MedicationRequest Example"
Description: "Example of a documented medication (patient-documented OTC) from VistA File 55.05."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #active
* intent = #plan
* reportedBoolean = true
* category[patientSpecified] = http://terminology.hl7.org/CodeSystem/medication-statement-category#patientspecified "Patient Specified"

* medicationCodeableConcept = $RxNorm#198436 "acetaminophen 325 MG Oral Capsule"
* medicationCodeableConcept.text = "ACETAMINOPHEN 325MG CAP (OTC)"

* subject = Reference(test3-patient)
* authoredOn = "2024-01-20"

* recorder = Reference(test3-practitioner)
* recorder.display = "Clinician who recorded patient-documented medication"

* reasonCode[+].text = "Pain relief"

* dosageInstruction[+].text = "Take 1 tablet daily"
* dosageInstruction[=].route = $SCT#26643006 "Oral route"
* dosageInstruction[=].timing.repeat.frequency = 1
* dosageInstruction[=].timing.repeat.period = 1
* dosageInstruction[=].timing.repeat.periodUnit = #d

Instance: test3-documented-fishoil
InstanceOf: EMIDocumentedMedications
Usage: #example
Title: "Test 3 - Documented MedicationRequest - Herbal"
Description: "Example of a documented herbal supplement."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #active
* intent = #plan
* reportedBoolean = true
* category[patientSpecified] = http://terminology.hl7.org/CodeSystem/medication-statement-category#patientspecified "Patient Specified"

* medicationCodeableConcept.text = "Fish Oil 1000mg"

* subject = Reference(test3-patient)
* authoredOn = "2024-02-15"

* recorder = Reference(test3-practitioner)

* reasonCode[+].text = "Cholesterol support"

* dosageInstruction[+].text = "Take 2 capsules daily with food"
* dosageInstruction[=].route = $SCT#26643006 "Oral route"
