Profile: EMIMedicationCounselingObservation
Parent: Observation
Id: emi-medication-counseling-observation
Title: "EMI Medication Counseling Observation"
Description: "Observation profile for medication counseling status, capturing whether the patient was counseled and whether they demonstrated understanding."

* ^status = #active
* ^version = "1.0.0"

// Source system
* meta.source 1..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

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
* code = $SCT#423076000 "Medication prescription education, guidance and counseling (procedure)"
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
* component[wasCounseled].code = $SCT#408730004 "Procedure context (attribute)"
* component[wasCounseled].code ^short = "Was the patient counseled"
* component[wasCounseled].value[x] only CodeableConcept
* component[wasCounseled].valueCodeableConcept from EMICounselingProvidedVS (required)
* component[wasCounseled].valueCodeableConcept ^short = "Done | Not done"

// Was counseling understood?
* component[wasUnderstood].code = $SCT#66216009 "Understanding, function (observable entity)"
* component[wasUnderstood].code ^short = "Was counseling understood"
* component[wasUnderstood].value[x] only CodeableConcept
* component[wasUnderstood].valueCodeableConcept from EMICounselingUnderstoodVS (required)
* component[wasUnderstood].valueCodeableConcept ^short = "Verbalizes understanding | Disturbance of understanding"

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
