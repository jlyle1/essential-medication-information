Profile: EMIMedicationList
Parent: List
Id: emi-medication-list
Title: "EMI Medication List"
Description: "List profile for patient medications in Essential Medication Information. Supports empty lists with emptyReason and includes medications from multiple sources (outpatient, inpatient, external)."

* ^status = #active
* ^version = "1.0.0"

// Status
* status 1..1 MS
* status = #current

// Mode
* mode 1..1 MS
* mode = #snapshot

// Title
* title MS
* title ^short = "Title of the medication list"

// Code - medication list
* code 1..1 MS
* code = $LOINC#10160-0 "History of Medication use Narrative"
* code ^short = "Medication list code"

// Subject
* subject only Reference(EMIPatient)
* subject 1..1 MS

// Date - when list was generated
* date 1..1 MS
* date ^short = "Effective date - when the medication list was generated"
* date ^definition = "The date/time the medication list was generated. Per VHA Directive 1164, the time and date the medication list was printed/published."

// Source
* source MS
* source ^short = "Who/what defined the list"

// Empty reason
* emptyReason MS
* emptyReason from EMIListEmptyReasonVS (preferred)
* emptyReason ^short = "Why the list is empty"
* emptyReason ^definition = "Required when list has no entries. Supports 'No medications' vs 'Unable to obtain' scenarios."

// Entries - can reference any medication resource type
* entry MS
* entry.item only Reference(EMIOutpatientMedicationRequest or EMIInpatientMedicationRequest or EMIIVMedicationRequest or EMIExternalMedicationStatement)
* entry.item ^short = "Medication entry from any source"
* entry.flag MS
* entry.flag from EMIMedicationSourceVS (preferred)
* entry.flag ^short = "Source of medication (local VA, remote VA, external)"

// Invariant: must have entries or emptyReason
* obeys emi-med-list-content

Invariant: emi-med-list-content
Description: "A medication list must have entries or an emptyReason"
Expression: "entry.exists() or emptyReason.exists()"
Severity: #error
