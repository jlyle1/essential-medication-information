Instance: medicationrequest-unitdose-example
InstanceOf: EMIInpatientMedicationRequest
Usage: #example
Title: "EMI Inpatient MedicationRequest Example"
Description: "Example of an inpatient unit dose medication order from VistA File 55.06."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* identifier[orderNumber].system = "http://va.gov/fhir/emi/sid/order-number"
* identifier[orderNumber].value = "UD789012"

* status = #active
* intent = #order
* category[inpatient] = $MedicationRequestCategory#inpatient

* medicationCodeableConcept = $RxNorm#197361 "amlodipine 5 MG Oral Tablet"
* medicationCodeableConcept.text = "AMLODIPINE 5MG TAB"

* subject = Reference(patient-example)
* authoredOn = "2024-03-10"

* requester.display = "Dr. Robert Johnson"

* dosageInstruction[+].text = "5MG PO QD"
* dosageInstruction[=].route = $SCT#26643006 "Oral route"
* dosageInstruction[=].timing.code.text = "QD"

Instance: medicationrequest-iv-example
InstanceOf: EMIIVMedicationRequest
Usage: #example
Title: "EMI IV MedicationRequest Example"
Description: "Example of an inpatient IV medication order from VistA File 55.01."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* identifier[orderNumber].system = "http://va.gov/fhir/emi/sid/order-number"
* identifier[orderNumber].value = "IV456789"

* status = #active
* intent = #order
* category[inpatient] = $MedicationRequestCategory#inpatient

* medicationCodeableConcept = $RxNorm#309778 "sodium chloride 0.9% Injectable Solution"
* medicationCodeableConcept.text = "SODIUM CHLORIDE 0.9% 1000ML"

* subject = Reference(patient-example)
* authoredOn = "2024-03-10"

* requester.display = "Dr. Robert Johnson"

* dosageInstruction[+].text = "1000ML IV CONTINUOUS AT 125ML/HR"
* dosageInstruction[=].route = $SCT#47625008 "Intravenous route"
* dosageInstruction[=].doseAndRate[+].rateQuantity.value = 125
* dosageInstruction[=].doseAndRate[=].rateQuantity.unit = "mL/h"
* dosageInstruction[=].doseAndRate[=].rateQuantity.system = $UCUM
* dosageInstruction[=].doseAndRate[=].rateQuantity.code = #mL/h
