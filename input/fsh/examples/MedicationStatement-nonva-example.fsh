Instance: medicationstatement-nonva-example
InstanceOf: EMINonVAMedicationStatement
Usage: #example
Title: "EMI Non-VA MedicationStatement Example"
Description: "Example of a non-VA medication (patient-reported OTC) from VistA File 55.05."

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

Instance: medicationstatement-nonva-herbal-example
InstanceOf: EMINonVAMedicationStatement
Usage: #example
Title: "EMI Non-VA MedicationStatement - Herbal"
Description: "Example of a non-VA herbal supplement."

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
