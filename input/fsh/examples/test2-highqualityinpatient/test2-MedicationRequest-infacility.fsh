Instance: test2-vancomycin
InstanceOf: EMIAllButDocumentedMedications
Usage: #example
Title: "Test 2 - Vancomycin IV"
Description: "Example of an IV vancomycin order for an inpatient."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* identifier[+].system = $VistAIVOrderNumber
* identifier[=].value = "112233"

* status = #active
* intent = #order
* category = $MedicationRequestCategory#inpatient

* medicationCodeableConcept = $RxNorm#1807508 "200 ML vancomycin 5 MG/ML Injection"
* medicationCodeableConcept.text = "VANCOMYCIN 1GM IV"

* subject = Reference(test2-patient)
* authoredOn = "2024-03-15"

* requester.display = "Dr. Robert Johnson"

* reasonCode[+].text = "Cellulitis"

* dosageInstruction[+].text = "1GM IV Q12H"
* dosageInstruction[=].route = $SCT#47625008 "Intravenous route"
* dosageInstruction[=].timing.code.text = "Q12H"
* dosageInstruction[=].doseAndRate[+].rateQuantity.value = 100
* dosageInstruction[=].doseAndRate[=].rateQuantity.unit = "mL/h"
* dosageInstruction[=].doseAndRate[=].rateQuantity.system = $UCUM
* dosageInstruction[=].doseAndRate[=].rateQuantity.code = #mL/h

Instance: test2-esomeprazole
InstanceOf: EMIAllButDocumentedMedications
Usage: #example
Title: "Test 2 - Esomeprazole IV"
Description: "Example of an IV esomeprazole order for stress ulcer prophylaxis."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* identifier[+].system = $VistAIVOrderNumber
* identifier[=].value = "112234"

* status = #active
* intent = #order
* category = $MedicationRequestCategory#inpatient

* medicationCodeableConcept = $RxNorm#283742 "esomeprazole"
* medicationCodeableConcept.text = "ESOMEPRAZOLE 40MG IV"

* subject = Reference(test2-patient)
* authoredOn = "2024-03-15"

* requester.display = "Dr. Robert Johnson"

* reasonCode[+].text = "Stress ulcer prophylaxis"

* dosageInstruction[+].text = "40MG IV DAILY"
* dosageInstruction[=].route = $SCT#47625008 "Intravenous route"
* dosageInstruction[=].timing.code.text = "DAILY"

Instance: test2-metoprolol
InstanceOf: EMIAllButDocumentedMedications
Usage: #example
Title: "Test 2 - Metoprolol PO"
Description: "Example of a unit dose metoprolol order for an inpatient."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* identifier[+].system = $VistAUnitDoseOrderNumber
* identifier[=].value = "445566"

* status = #active
* intent = #order
* category = $MedicationRequestCategory#inpatient

* medicationCodeableConcept = $RxNorm#866924 "metoprolol tartrate 25 MG Oral Tablet"
* medicationCodeableConcept.text = "METOPROLOL 25MG TAB"

* subject = Reference(test2-patient)
* authoredOn = "2024-03-15"

* requester.display = "Dr. Robert Johnson"

* reasonCode[+].text = "Hypertension"

* dosageInstruction[+].text = "25MG PO BID"
* dosageInstruction[=].route = $SCT#26643006 "Oral route"
* dosageInstruction[=].timing.code.text = "BID"
