Instance: medicationstatement-external-example
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "EMI External MedicationStatement Example"
Description: "Example of an external medication (patient-reported OTC) from VistA File 55.05."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #active
* category = $MedicationStatementCategory#community

* medicationCodeableConcept = $RxNorm#198436 "aspirin 325 MG Oral Tablet"
* medicationCodeableConcept.text = "ASPIRIN 325MG (OTC)"

* subject = Reference(patient-example)
* dateAsserted = "2024-01-20"
* informationSource = Reference(patient-example)
* informationSource.display = "Patient-reported"

* reasonCode[+].text = "Heart health"

* dosage[+].text = "Take 1 tablet daily"
* dosage[=].route = $SCT#26643006 "Oral route"
* dosage[=].timing.repeat.frequency = 1
* dosage[=].timing.repeat.period = 1
* dosage[=].timing.repeat.periodUnit = #d

Instance: medicationstatement-external-herbal-example
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "EMI External MedicationStatement - Herbal"
Description: "Example of an external herbal supplement."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #active
* category = $MedicationStatementCategory#community

* medicationCodeableConcept.text = "Fish Oil 1000mg"
* medicationCodeableConcept.coding[+].display = "Fish Oil Supplement"

* subject = Reference(patient-example)
* dateAsserted = "2024-02-15"
* informationSource = Reference(patient-example)

* reasonCode[+].text = "Cholesterol support"

* dosage[+].text = "Take 2 capsules daily with food"
* dosage[=].route = $SCT#26643006 "Oral route"
