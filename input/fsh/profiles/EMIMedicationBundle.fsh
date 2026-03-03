Profile: EMIMedicationBundle
Parent: Bundle
Id: emi-medication-bundle
Title: "EMI Medication Bundle"
Description: "Bundle profile for Essential Medication Information, serving as the response to the $essential-medication-information-for-review operation. Contains patient, allergy list, medication list, and all referenced resources."

* ^status = #active
* ^version = "1.0.0"

// Type - collection bundle returned by operation
* type = #collection (exactly)
* type ^short = "Collection bundle"

// Timestamp
* timestamp 1..1 MS
* timestamp ^short = "When the bundle was assembled"

// Total not needed for collection
* total 0..0

// Entries
* entry 1..* MS
* entry ^short = "Resources in the medication information response"
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.ordered = false
* entry ^slicing.description = "Slices for required resource types"

* entry contains
    patient 1..1 MS and
    allergyList 1..1 MS and
    medicationList 1..1 MS

// Patient entry
* entry[patient].resource only EMIPatient
* entry[patient] ^short = "Patient information"

// Allergy list entry
* entry[allergyList].resource only EMIAllergyList
* entry[allergyList] ^short = "Allergy/ADR list"

// Medication list entry
* entry[medicationList].resource only EMIMedicationList
* entry[medicationList] ^short = "Medication list"

// Additional entries for referenced resources (open slicing allows these)
// - Individual AllergyIntolerance resources
// - Individual MedicationRequest/MedicationStatement resources
// - MedicationDispense resources
// - MedicationCounselingObservation resources
// - Organization (pharmacy) resources
// - Practitioner resources
