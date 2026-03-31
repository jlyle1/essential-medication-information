Profile: EMIMedicationBundle
Parent: Bundle
Id: emi-medication-bundle
Title: "EMI Medication Bundle"
Description: "Bundle profile for Essential Medication Information, serving as the response to the $essential-medication-information-for-review operation. Contains patient, allergies, medications, dispenses, counseling observations, and supporting resources."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Source system
* meta.source 1..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Type - collection bundle returned by operation
* type = #collection (exactly)
* type ^short = "Collection bundle"

// Timestamp
* timestamp 1..1 MS
* timestamp ^short = "When the bundle was assembled"

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
    allergy 0..* MS and
    medication 0..* MS and
    dispense 0..* MS and
    counseling 0..* MS and
    pharmacy 0..* MS and
    provider 0..* MS

// Patient entry
* entry[patient].resource only EMIPatient
* entry[patient] ^short = "Patient information"

// Allergy entries
* entry[allergy].resource only EMIAllergyIntolerance
* entry[allergy] ^short = "Allergy or adverse reaction"

// Medication entries (outpatient, inpatient, IV, or external)
* entry[medication].resource only EMIOutpatientMedicationRequest or EMIInpatientMedicationRequest or EMIIVMedicationRequest or EMIExternalMedicationStatement
* entry[medication] ^short = "Medication from any source"

// Dispense entries
* entry[dispense].resource only EMIMedicationDispense
* entry[dispense] ^short = "Medication dispense record"

// Counseling observation entries
* entry[counseling].resource only EMIMedicationCounselingProcedure
* entry[counseling] ^short = "Patient medication counseling"

// Pharmacy organization entries
* entry[pharmacy].resource only EMIPharmacyOrganization
* entry[pharmacy] ^short = "Dispensing pharmacy"

// Provider entries
* entry[provider].resource only EMIPractitioner
* entry[provider] ^short = "Prescribing or ordering provider"
