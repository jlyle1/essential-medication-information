Profile: EMIAllButDocumentedMedications
Parent: EMIAllMedications
Id: emi-all-but-documented-medications
Title: "EMI All But Documented Medications"
Description: "Profile for ordered medications (prescriptions, pending, and in-facility). Extends EMIAllMedications to add requester (prescriber/provider). This covers all medication types except patient-documented medications."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Invariants - see Rulesets.fsh (adds requester check)
* insert OrderInvariants

// Intent - always order for prescribed/ordered medications
* intent = #order (exactly)

// Requester - prescriber/ordering provider
* requester MS
* requester ^short = "Prescriber or ordering provider"
* requester ^definition = "The provider who prescribed or ordered the medication."
