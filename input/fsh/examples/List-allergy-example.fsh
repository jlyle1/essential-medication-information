Instance: allergy-list-example
InstanceOf: EMIAllergyList
Usage: #example
Title: "EMI Allergy List Example"
Description: "Example of an allergy list with entries."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #current
* mode = #snapshot
* title = "Patient Allergy List"

* code = $LOINC#52472-8 "Allergy list"

* subject = Reference(patient-example)
* date = "2024-04-15T10:00:00-05:00"

* entry[+].item = Reference(allergy-penicillin-example)
* entry[+].item = Reference(allergy-nsaid-example)

Instance: allergy-list-empty-example
InstanceOf: EMIAllergyList
Usage: #example
Title: "EMI Allergy List Example - No Known Allergies"
Description: "Example of an empty allergy list with no known allergies."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #current
* mode = #snapshot
* title = "Patient Allergy List"

* code = $LOINC#52472-8 "Allergy list"

* subject = Reference(patient-example)
* date = "2024-04-15T10:00:00-05:00"

* emptyReason = $ListEmptyReason#nilknown "Nil Known"
* emptyReason.text = "No known allergies"
