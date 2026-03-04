Instance: counseling-observation-example
InstanceOf: EMIMedicationCounselingObservation
Usage: #example
Title: "EMI Medication Counseling Observation Example"
Description: "Example of a medication counseling observation showing patient was counseled and understood."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #final
* category[survey] = $ObservationCategory#survey

* code = $SCT#423076000 "Medication prescription education, guidance and counseling (procedure)"

* subject = Reference(patient-example)
* focus = Reference(medicationrequest-outpatient-lisinopril)

* effectiveDateTime = "2024-01-15T11:30:00-05:00"
* performer[+].display = "VA Pharmacist"

* component[wasCounseled].code = $SCT#408730004 "Procedure context (attribute)"
* component[wasCounseled].valueCodeableConcept = $SCT#385658003 "Done (qualifier value)"

* component[wasUnderstood].code = $SCT#66216009 "Understanding, function (observable entity)"
* component[wasUnderstood].valueCodeableConcept = $SCT#445651000124107 "Verbalizes understanding (finding)"

Instance: counseling-observation-refused-example
InstanceOf: EMIMedicationCounselingObservation
Usage: #example
Title: "EMI Medication Counseling Observation - Not Done"
Description: "Example of a medication counseling observation where counseling was not done."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #final
* category[survey] = $ObservationCategory#survey

* code = $SCT#423076000 "Medication prescription education, guidance and counseling (procedure)"

* subject = Reference(patient-example)
* focus = Reference(medicationrequest-outpatient-metformin)

* effectiveDateTime = "2024-02-01T09:15:00-05:00"
* performer[+].display = "VA Pharmacist"

* component[wasCounseled].code = $SCT#408730004 "Procedure context (attribute)"
* component[wasCounseled].valueCodeableConcept = $SCT#385660001 "Not done (qualifier value)"

* component[wasUnderstood].code = $SCT#66216009 "Understanding, function (observable entity)"
* component[wasUnderstood].valueCodeableConcept = $SCT#64270008 "Disturbance of understanding (finding)"
