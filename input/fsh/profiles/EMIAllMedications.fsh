Profile: EMIAllMedications
Parent: MedicationRequest
Id: emi-all-medications
Title: "EMI All Medications"
Description: "Base medication profile for Essential Medication Information. Contains elements common to all medication types: drug name, indication, status, and SIG."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Invariants - see Rulesets.fsh
* insert AllMedsInvariants

// Source system
* meta.source 0..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Status
* status MS
* status ^short = "active | on-hold | cancelled | completed | entered-in-error | stopped"
* status.extension contains $AlternateCodes named alternateCodes 0..1 MS
* status.extension[alternateCodes] ^short = "VistA pharmacy order status"

// Medication - drug name with RxNorm coding
* medication[x] only CodeableConcept
* medicationCodeableConcept 1..1 MS
* medicationCodeableConcept from EMIRxNormWithStrengthFormVS (preferred)
* medicationCodeableConcept ^short = "Medication with RxNorm code"
* medicationCodeableConcept ^definition = "Drug name and strength, coded with RxNorm where available."

// Subject
* subject only Reference(EMIPatient)
* subject MS

// Reason for use (indication)
* reasonCode MS
* reasonCode ^short = "Indication/reason for medication"
* reasonCode ^definition = "The reason or indication for the medication."

// Dosage instructions (SIG)
* dosageInstruction 0..* MS
* dosageInstruction.text MS
* dosageInstruction.text ^short = "SIG - patient instructions"
* dosageInstruction.text ^definition = "Complete dosage instructions for the medication."
