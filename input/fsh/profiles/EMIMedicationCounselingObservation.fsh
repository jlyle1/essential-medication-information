Profile: EMIMedicationCounselingObservation
Parent: Observation
Id: emi-medication-counseling-observation
Title: "EMI Medication Counseling Observation"
Description: "Observation profile for medication counseling status, capturing whether the patient was counseled and whether they demonstrated understanding."

* ^status = #active
* ^version = "1.0.0"

// Status
* status MS
* status = #final

// Category - survey/patient-reported
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains survey 1..1 MS
* category[survey] = $ObservationCategory#survey

// Code - medication counseling
* code 1..1 MS
* code = $LOINC#98214-8 "Medication counseling provided"
* code ^short = "Medication counseling observation"

// Subject
* subject only Reference(EMIPatient)
* subject 1..1 MS

// Focus - the medication request this counseling relates to
* focus MS
* focus only Reference(EMIOutpatientMedicationRequest)
* focus ^short = "The prescription this counseling relates to"

// Effective date - when counseling occurred
* effectiveDateTime MS
* effectiveDateTime ^short = "When counseling was provided"

// Performer - who did the counseling
* performer MS
* performer ^short = "Who provided counseling"

// No top-level value - use components
* value[x] 0..0

// Components for counseling details
* component 2..2 MS
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed
* component ^short = "Counseling status components"

* component contains
    wasCounseled 1..1 MS and
    wasUnderstood 1..1 MS

// Was the patient counseled?
* component[wasCounseled].code = $EMICounselingStatus#was-counseled "Was Patient Counseled"
* component[wasCounseled].code ^short = "Was the patient counseled"
* component[wasCounseled].value[x] only CodeableConcept
* component[wasCounseled].valueCodeableConcept from EMICounselingStatusVS (required)
* component[wasCounseled].valueCodeableConcept ^short = "yes | no | not-applicable"

// Was counseling understood?
* component[wasUnderstood].code = $EMICounselingStatus#was-understood "Was Counseling Understood"
* component[wasUnderstood].code ^short = "Was counseling understood"
* component[wasUnderstood].value[x] only CodeableConcept
* component[wasUnderstood].valueCodeableConcept from EMICounselingStatusVS (required)
* component[wasUnderstood].valueCodeableConcept ^short = "yes | no | not-applicable"

// Mappings to VistA File 52
Mapping: VistAFile52Counseling
Id: vista-file-52-counseling
Title: "VistA Prescription File (52) - Counseling"
Source: EMIMedicationCounselingObservation
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-52-counseling"

* focus -> "Reference to MedicationRequest from File 52"
* component[wasCounseled].valueCodeableConcept -> "File 52, Field 41 (WAS THE PATIENT COUNSELED)"
* component[wasUnderstood].valueCodeableConcept -> "File 52, Field 42 (WAS COUNSELING UNDERSTOOD)"
* effectiveDateTime -> "File 52, counseling date from context"
* performer -> "File 52, pharmacist who provided counseling"
