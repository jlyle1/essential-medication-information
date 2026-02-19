Instance: counseling-observation-example
InstanceOf: EMIMedicationCounselingObservation
Usage: #example
Title: "EMI Medication Counseling Observation Example"
Description: "Example of a medication counseling observation showing patient was counseled and understood."

* status = #final
* category[survey] = $ObservationCategory#survey

* code = $LOINC#98214-8 "Medication counseling provided"

* subject = Reference(patient-example)
* focus = Reference(medicationrequest-outpatient-lisinopril)

* effectiveDateTime = "2024-01-15T11:30:00-05:00"
* performer[+].display = "VA Pharmacist"

* component[wasCounseled].code = $EMICounselingStatus#was-counseled "Was Patient Counseled"
* component[wasCounseled].valueCodeableConcept = EMICounselingStatusCS#yes "Yes"

* component[wasUnderstood].code = $EMICounselingStatus#was-understood "Was Counseling Understood"
* component[wasUnderstood].valueCodeableConcept = EMICounselingStatusCS#yes "Yes"

Instance: counseling-observation-refused-example
InstanceOf: EMIMedicationCounselingObservation
Usage: #example
Title: "EMI Medication Counseling Observation - Refused"
Description: "Example of a medication counseling observation where patient refused counseling."

* status = #final
* category[survey] = $ObservationCategory#survey

* code = $LOINC#98214-8 "Medication counseling provided"

* subject = Reference(patient-example)
* focus = Reference(medicationrequest-outpatient-metformin)

* effectiveDateTime = "2024-02-01T09:15:00-05:00"
* performer[+].display = "VA Pharmacist"

* component[wasCounseled].code = $EMICounselingStatus#was-counseled "Was Patient Counseled"
* component[wasCounseled].valueCodeableConcept = EMICounselingStatusCS#refused "Refused"

* component[wasUnderstood].code = $EMICounselingStatus#was-understood "Was Counseling Understood"
* component[wasUnderstood].valueCodeableConcept = EMICounselingStatusCS#not-applicable "Not Applicable"
