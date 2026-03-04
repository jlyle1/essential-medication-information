Profile: EMIAllergyList
Parent: List
Id: emi-allergy-list
Title: "EMI Allergy List"
Description: "List profile for patient allergies in Essential Medication Information. Supports empty lists with emptyReason."

* ^status = #active
* ^version = "1.0.0"

// Source system
* meta.source 1..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Status
* status 1..1 MS
* status = #current

// Mode
* mode 1..1 MS
* mode = #snapshot

// Title
* title MS
* title ^short = "Title of the allergy list"

// Code - allergy list
* code 1..1 MS
* code = $LOINC#52472-8 "Allergy list"
* code ^short = "Allergy list code"

// Subject
* subject only Reference(EMIPatient)
* subject 1..1 MS

// Date
* date MS
* date ^short = "When the list was prepared"

// Source
* source MS
* source ^short = "Who/what defined the list"

// Empty reason - critical for EMI
* emptyReason MS
* emptyReason from EMIListEmptyReasonVS (preferred)
* emptyReason ^short = "Why the list is empty"
* emptyReason ^definition = "Required when list has no entries. Supports 'No known allergies' vs 'Unable to obtain' scenarios."

// Entries
* entry MS
* entry.item only Reference(EMIAllergyIntolerance)
* entry.item ^short = "Allergy/adverse reaction entry"

// Invariant: must have entries or emptyReason
* obeys emi-list-content

Invariant: emi-list-content
Description: "A list must have entries or an emptyReason"
Expression: "entry.exists() or emptyReason.exists()"
Severity: #error
