Profile: EMIDocumentedMedications
Parent: EMIAllMedications
Id: emi-documented-medications
Title: "EMI Documented Medications"
Description: "Profile for patient-documented/external medications (VistA File 55.05). Extends EMIAllMedications to add recorder. Includes OTC, herbal, nutraceuticals, and outside prescriptions documented by the patient or caregiver."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Invariants - see Rulesets.fsh (adds recorder check)
* insert DocumentedInvariants

// Intent - always plan for documented medications
* intent = #plan (exactly)
* intent ^short = "plan - patient-documented medication"

// Reported - always true for patient-documented medications
* reported[x] only boolean
* reportedBoolean = true (exactly)
* reportedBoolean ^short = "Documented by patient or caregiver"

// Category - patient specified
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains patientSpecified 1..1 MS
* category[patientSpecified] = http://terminology.hl7.org/CodeSystem/medication-statement-category#patientspecified "Patient Specified"
* category[patientSpecified] ^short = "Patient-documented medication"

// Recorder - who documented the medication
* recorder MS
* recorder ^short = "Who recorded the documented medication (typically a clinician)"

// End date for non-active medications
* dispenseRequest.validityPeriod.end 0..1 MS
* dispenseRequest.validityPeriod.end ^short = "End date for documented medication"

// Mappings to VistA File 55.05
Mapping: VistAFile55-05-Documented
Id: vista-file-55-05
Title: "VistA Non-VA Meds File (55.05)"
Source: EMIDocumentedMedications
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-55-05"

* medicationCodeableConcept -> "File 55.05, Field .01 (ORDERABLE ITEM) -> mapped to RxNorm"
* status -> "File 55.05, Field 5 (STATUS)"
* reasonCode -> "File 55.05, Field 15 (INDICATION FOR USE)"
