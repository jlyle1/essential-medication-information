Instance: test1-prescription-lisinopril
InstanceOf: EMIMedicationRequestPrescription
Usage: #example
Title: "Test 1 - Prescription MedicationRequest - Lisinopril"
Description: "Example of a prescription for Lisinopril from VistA File 52."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

// Extensions for dispense summary
* extension[dateLastDispensed].valueDateTime = "2026-01-05"
* extension[remainingFills].valueUnsignedInt = 2

* identifier[rxNumber].system = "http://va.gov/fhir/sid/648/52-.01"
* identifier[rxNumber].value = "12345678"

* status = #active
* intent = #order
* category[community] = $MedicationRequestCategory#community

* medicationCodeableConcept = $RxNorm#314076 "lisinopril 10 MG Oral Tablet"
* medicationCodeableConcept.text = "LISINOPRIL 10MG TAB"

* subject = Reference(test1-patient)
* authoredOn = "2025-10-01"

* requester = Reference(test1-practitioner)

* reasonCode[+] = $SCT#38341003 "Hypertensive disorder"
* reasonCode[=].text = "Hypertension"

* dosageInstruction[+].text = "TAKE ONE TABLET BY MOUTH EVERY DAY FOR BLOOD PRESSURE"
* dosageInstruction[=].timing.repeat.frequency = 1
* dosageInstruction[=].timing.repeat.period = 1
* dosageInstruction[=].timing.repeat.periodUnit = #d
* dosageInstruction[=].route = $SCT#26643006 "Oral route"
* dosageInstruction[=].doseAndRate[+].doseQuantity.value = 1
* dosageInstruction[=].doseAndRate[=].doseQuantity.unit = "tablet"

* dispenseRequest.quantity.value = 90
* dispenseRequest.quantity.unit = "tablet"
* dispenseRequest.expectedSupplyDuration.value = 90
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = $UCUM
* dispenseRequest.expectedSupplyDuration.code = #d
* dispenseRequest.numberOfRepeatsAllowed = 3
* dispenseRequest.validityPeriod.start = "2025-10-01"
* dispenseRequest.validityPeriod.end = "2026-10-01"
* dispenseRequest.performer = Reference(test1-pharmacy)

Instance: test1-prescription-metformin
InstanceOf: EMIMedicationRequestPrescription
Usage: #example
Title: "Test 1 - Prescription MedicationRequest - Metformin"
Description: "Example of a prescription for Metformin."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

// Extensions for dispense summary
* extension[dateLastDispensed].valueDateTime = "2025-12-20"
* extension[remainingFills].valueUnsignedInt = 1

* identifier[rxNumber].system = "http://va.gov/fhir/sid/648/52-.01"
* identifier[rxNumber].value = "12345679"

* status = #active
* intent = #order
* category[community] = $MedicationRequestCategory#community

* medicationCodeableConcept = $RxNorm#861004 "metformin hydrochloride 1000 MG Oral Tablet"
* medicationCodeableConcept.text = "METFORMIN 1000MG TAB"

* subject = Reference(test1-patient)
* authoredOn = "2025-09-15"

* requester = Reference(test1-practitioner)

* reasonCode[+] = $SCT#73211009 "Diabetes mellitus"
* reasonCode[=].text = "Diabetes"

* dosageInstruction[+].text = "TAKE ONE TABLET BY MOUTH TWICE DAILY WITH MEALS"
* dosageInstruction[=].timing.repeat.frequency = 2
* dosageInstruction[=].timing.repeat.period = 1
* dosageInstruction[=].timing.repeat.periodUnit = #d
* dosageInstruction[=].route = $SCT#26643006 "Oral route"
* dosageInstruction[=].doseAndRate[+].doseQuantity.value = 1
* dosageInstruction[=].doseAndRate[=].doseQuantity.unit = "tablet"

* dispenseRequest.quantity.value = 180
* dispenseRequest.quantity.unit = "tablet"
* dispenseRequest.expectedSupplyDuration.value = 90
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = $UCUM
* dispenseRequest.expectedSupplyDuration.code = #d
* dispenseRequest.numberOfRepeatsAllowed = 3
* dispenseRequest.validityPeriod.start = "2025-09-15"
* dispenseRequest.validityPeriod.end = "2026-09-15"
* dispenseRequest.performer = Reference(test1-pharmacy)

Instance: test1-prescription-atorvastatin
InstanceOf: EMIMedicationRequestPrescription
Usage: #example
Title: "Test 1 - Prescription MedicationRequest - Atorvastatin (Cancelled)"
Description: "Example of a cancelled prescription for Atorvastatin."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

// Extensions for dispense summary
* extension[dateLastDispensed].valueDateTime = "2025-11-10"
* extension[remainingFills].valueUnsignedInt = 2
* extension[cancelDate].valueDateTime = "2026-02-15"

* identifier[rxNumber].system = "http://va.gov/fhir/sid/648/52-.01"
* identifier[rxNumber].value = "12345680"

* status = #cancelled
* intent = #order
* category[community] = $MedicationRequestCategory#community

* medicationCodeableConcept = $RxNorm#617312 "atorvastatin 10 MG Oral Tablet"
* medicationCodeableConcept.text = "ATORVASTATIN 10MG TAB"

* subject = Reference(test1-patient)
* authoredOn = "2025-08-10"

* requester = Reference(test1-practitioner)

* reasonCode[+] = $SCT#13644009 "Hypercholesterolemia"
* reasonCode[=].text = "High Cholesterol"

* dosageInstruction[+].text = "TAKE ONE TABLET BY MOUTH EVERY EVENING"
* dosageInstruction[=].timing.repeat.frequency = 1
* dosageInstruction[=].timing.repeat.period = 1
* dosageInstruction[=].timing.repeat.periodUnit = #d
* dosageInstruction[=].route = $SCT#26643006 "Oral route"
* dosageInstruction[=].doseAndRate[+].doseQuantity.value = 1
* dosageInstruction[=].doseAndRate[=].doseQuantity.unit = "tablet"

* dispenseRequest.quantity.value = 90
* dispenseRequest.quantity.unit = "tablet"
* dispenseRequest.expectedSupplyDuration.value = 90
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = $UCUM
* dispenseRequest.expectedSupplyDuration.code = #d
* dispenseRequest.numberOfRepeatsAllowed = 3
* dispenseRequest.validityPeriod.start = "2025-08-10"
* dispenseRequest.validityPeriod.end = "2026-08-10"
* dispenseRequest.performer = Reference(test1-pharmacy)