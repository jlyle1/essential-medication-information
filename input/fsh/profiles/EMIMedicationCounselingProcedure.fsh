Profile: EMIMedicationCounselingProcedure
Parent: Procedure
Id: emi-medication-counseling-procedure
Title: "EMI Medication Counseling Procedure"
Description: "Procedure profile for Essential Medication Information, capturing whether medication counseling was performed for the patient."

* ^status = #active
* ^version = "1.0.0"

// Invariants
* obeys emi-counsel-1

// Source system
* meta.source 0..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Status - completed (1/Yes) or not-done (0/No)
* status 1..1 MS
* status from EMIMedicationCounselingStatusVS (required)
* status ^short = "completed | not-done"
* status ^definition = "completed = counseling was performed (1/Yes); not-done = counseling was not performed (0/No)"

// Code - fixed to Medication education
* code 1..1 MS
* code = $SCT#967006 "Medication education (procedure)"
* code ^short = "Medication education (procedure)"

// Subject
* subject only Reference(EMIPatient)
* subject 1..1 MS

// Outcome - Successful (1/Yes) or Unsuccessful (0/No)
* outcome MS
* outcome from EMIMedicationCounselingOutcomeVS (required)
* outcome ^short = "Successful | Unsuccessful"
* outcome ^definition = "Successful (385669000) = counseling was successful (1/Yes); Unsuccessful (385671000) = counseling was unsuccessful (0/No)"

// Invariants
Invariant: emi-counsel-1
Severity: #warning
Description: "meta.source SHOULD be populated to identify the originating system for counseling data"
Expression: "meta.source.exists()"

// Value Sets
ValueSet: EMIMedicationCounselingStatusVS
Id: emi-medication-counseling-status-vs
Title: "EMI Medication Counseling Status Value Set"
Description: "Status values for medication counseling procedure"
* http://hl7.org/fhir/event-status#completed "Completed"
* http://hl7.org/fhir/event-status#not-done "Not Done"

ValueSet: EMIMedicationCounselingOutcomeVS
Id: emi-medication-counseling-outcome-vs
Title: "EMI Medication Counseling Outcome Value Set"
Description: "Outcome values for medication counseling procedure"
* $SCT#385669000 "Successful"
* $SCT#385671000 "Unsuccessful"
