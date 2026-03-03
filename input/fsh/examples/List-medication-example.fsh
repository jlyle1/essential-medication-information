Instance: medication-list-example
InstanceOf: EMIMedicationList
Usage: #example
Title: "EMI Medication List Example"
Description: "Example of a medication list with entries from multiple sources."

* status = #current
* mode = #snapshot
* title = "Patient Medication List"

* code = $LOINC#10160-0 "History of Medication use Narrative"

* subject = Reference(patient-example)
* date = "2024-04-15T10:00:00-05:00"

// Outpatient medications
* entry[+].item = Reference(medicationrequest-outpatient-lisinopril)
* entry[=].flag = EMIMedicationSourceCS#local-va "Local VA"
* entry[=].date = "2024-01-15"

* entry[+].item = Reference(medicationrequest-outpatient-metformin)
* entry[=].flag = EMIMedicationSourceCS#local-va "Local VA"
* entry[=].date = "2024-02-01"

// External medications
* entry[+].item = Reference(medicationstatement-external-example)
* entry[=].flag = EMIMedicationSourceCS#external "External"
* entry[=].date = "2024-01-20"

* entry[+].item = Reference(medicationstatement-external-herbal-example)
* entry[=].flag = EMIMedicationSourceCS#external "External"
* entry[=].date = "2024-02-15"

Instance: medication-list-empty-example
InstanceOf: EMIMedicationList
Usage: #example
Title: "EMI Medication List Example - No Medications"
Description: "Example of an empty medication list."

* status = #current
* mode = #snapshot
* title = "Patient Medication List"

* code = $LOINC#10160-0 "History of Medication use Narrative"

* subject = Reference(patient-example)
* date = "2024-04-15T10:00:00-05:00"

* emptyReason = $ListEmptyReason#nilknown "Nil Known"
* emptyReason.text = "No current medications"
