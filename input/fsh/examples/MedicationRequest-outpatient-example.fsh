Instance: medicationrequest-outpatient-lisinopril
InstanceOf: EMIOutpatientMedicationRequest
Usage: #example
Title: "EMI Outpatient MedicationRequest - Lisinopril"
Description: "Example of an outpatient prescription for Lisinopril from VistA File 52."

* identifier[rxNumber].system = "http://va.gov/fhir/emi/sid/rx-number"
* identifier[rxNumber].value = "RX12345678"

* status = #active
* intent = #order
* category[outpatient] = $MedicationRequestCategory#outpatient

* medicationCodeableConcept = $RxNorm#314076 "lisinopril 10 MG Oral Tablet"
* medicationCodeableConcept.text = "LISINOPRIL 10MG TAB"

* subject = Reference(patient-example)
* authoredOn = "2024-01-15"

* requester.display = "Dr. Jane Doe"

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
* dispenseRequest.validityPeriod.start = "2024-01-15"
* dispenseRequest.validityPeriod.end = "2025-01-15"

Instance: medicationrequest-outpatient-metformin
InstanceOf: EMIOutpatientMedicationRequest
Usage: #example
Title: "EMI Outpatient MedicationRequest - Metformin"
Description: "Example of an outpatient prescription for Metformin."

* identifier[rxNumber].system = "http://va.gov/fhir/emi/sid/rx-number"
* identifier[rxNumber].value = "RX12345679"

* status = #active
* intent = #order
* category[outpatient] = $MedicationRequestCategory#outpatient

* medicationCodeableConcept = $RxNorm#861004 "metformin hydrochloride 500 MG Oral Tablet"
* medicationCodeableConcept.text = "METFORMIN 500MG TAB"

* subject = Reference(patient-example)
* authoredOn = "2024-02-01"

* requester.display = "Dr. Jane Doe"

* reasonCode[+].text = "Diabetes"

* dosageInstruction[+].text = "TAKE ONE TABLET BY MOUTH TWICE DAILY WITH MEALS"
* dosageInstruction[=].timing.repeat.frequency = 2
* dosageInstruction[=].timing.repeat.period = 1
* dosageInstruction[=].timing.repeat.periodUnit = #d

* dispenseRequest.quantity.value = 180
* dispenseRequest.quantity.unit = "tablet"
* dispenseRequest.expectedSupplyDuration.value = 90
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = $UCUM
* dispenseRequest.expectedSupplyDuration.code = #d
* dispenseRequest.numberOfRepeatsAllowed = 3
* dispenseRequest.validityPeriod.end = "2025-02-01"
