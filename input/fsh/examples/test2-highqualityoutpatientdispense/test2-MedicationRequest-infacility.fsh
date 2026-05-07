Instance: test2-unitdose
InstanceOf: EMIAllButDocumentedMedications
Usage: #example
Title: "Test 1 - In-Facility MedicationRequest Example"
Description: "Example of an in-facility unit dose medication order from VistA File 55.06."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* identifier[+].system = $VistAUnitDoseOrderNumber
* identifier[=].value = "789012"

* status = #active
* intent = #order
* category = $MedicationRequestCategory#inpatient

* medicationCodeableConcept = $RxNorm#197361 "amlodipine 5 MG Oral Tablet"
* medicationCodeableConcept.text = "AMLODIPINE 5MG TAB"

* subject = Reference(test2-patient)
* authoredOn = "2024-03-10"

* requester.display = "Dr. Robert Johnson"

* reasonCode[+].text = "Hypertension"

* dosageInstruction[+].text = "5MG PO QD"
* dosageInstruction[=].route = $SCT#26643006 "Oral route"
* dosageInstruction[=].timing.code.text = "QD"

Instance: test2-iv
InstanceOf: EMIAllButDocumentedMedications
Usage: #example
Title: "Test 1 - IV MedicationRequest Example"
Description: "Example of an in-facility IV medication order from VistA File 55.01."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* identifier[+].system = $VistAIVOrderNumber
* identifier[=].value = "456789"

* status = #active
* intent = #order
* category = $MedicationRequestCategory#inpatient

* medicationCodeableConcept = $RxNorm#309778 "glucose 50 MG/ML Injectable Solution"
* medicationCodeableConcept.text = "DEXTROSE 5% 1000ML (D5W)"

* subject = Reference(test2-patient)
* authoredOn = "2024-03-10"

* requester.display = "Dr. Robert Johnson"

* reasonCode[+].text = "IV hydration"

* dosageInstruction[+].text = "D5W 1000ML IV CONTINUOUS AT 125ML/HR"
* dosageInstruction[=].route = $SCT#47625008 "Intravenous route"
* dosageInstruction[=].doseAndRate[+].rateQuantity.value = 125
* dosageInstruction[=].doseAndRate[=].rateQuantity.unit = "mL/h"
* dosageInstruction[=].doseAndRate[=].rateQuantity.system = $UCUM
* dosageInstruction[=].doseAndRate[=].rateQuantity.code = #mL/h
