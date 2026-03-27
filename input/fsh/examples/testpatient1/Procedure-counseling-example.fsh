Instance: counseling-procedure-example
InstanceOf: EMIMedicationCounselingProcedure
Usage: #example
Title: "EMI Medication Counseling Procedure Example"
Description: "Example of a medication counseling procedure showing patient was counseled successfully."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #completed
* code = $SCT#967006 "Medication education (procedure)"

* subject = Reference(testpatient1-patient)

* performedDateTime = "2024-01-15T11:30:00-05:00"
* performer[+].actor.display = "VA Pharmacist"

* outcome = $SCT#385669000 "Successful"

Instance: counseling-procedure-notdone-example
InstanceOf: EMIMedicationCounselingProcedure
Usage: #example
Title: "EMI Medication Counseling Procedure - Not Done"
Description: "Example of a medication counseling procedure where counseling was not done."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* status = #not-done
* code = $SCT#967006 "Medication education (procedure)"

* subject = Reference(testpatient1-patient)

* performedDateTime = "2024-02-01T09:15:00-05:00"
* performer[+].actor.display = "VA Pharmacist"

* outcome = $SCT#385671000 "Unsuccessful"
