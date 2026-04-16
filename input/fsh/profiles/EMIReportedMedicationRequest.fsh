Profile: EMIReportedMedicationRequest
Parent: MedicationRequest
Id: emi-reported-medicationrequest
Title: "EMI Reported MedicationRequest"
Description: "Reported/external medication profile for Essential Medication Information, representing VistA File 55.05 non-VA medications including OTC, herbal, and outside prescriptions. Uses MedicationRequest with intent=plan and reportedBoolean=true."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Invariants - see Rulesets.fsh
* insert AllMedsInvariants
* insert SigInvariants
* insert ReportedInvariants

// Source system
* meta.source 0..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Status
* status MS
* status ^short = "active | on-hold | cancelled | completed | entered-in-error | stopped"
* status.extension contains $AlternateCodes named alternateCodes 0..1 MS
* status.extension[alternateCodes] ^short = "VistA pharmacy order status (File 55.05, Field 5)"

// Intent - always plan for reported medications
* intent = #plan (exactly)
* intent ^short = "plan - patient-reported medication"

// Reported - always true for patient-reported medications
* reported[x] only boolean
* reportedBoolean = true (exactly)
* reportedBoolean ^short = "Reported by patient or caregiver"

// Category - patient specified
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains patientSpecified 1..1 MS
* category[patientSpecified] = http://terminology.hl7.org/CodeSystem/medication-statement-category#patientspecified "Patient Specified"
* category[patientSpecified] ^short = "Patient-reported medication"

// Medication
* medication[x] only CodeableConcept
* medicationCodeableConcept 1..1 MS
* medicationCodeableConcept from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.4 (preferred)
* medicationCodeableConcept ^short = "External medication with RxNorm code"
* medicationCodeableConcept ^definition = "The external medication including name, strength, and form. May include OTC, herbal, nutraceuticals, or outside prescriptions."

// Subject
* subject only Reference(EMIPatient)
* subject 1..1 MS

// Requester - typically the patient for self-reported meds
* requester MS
* requester ^short = "Who reported the medication (often the patient)"

// Reason for use
* reasonCode MS
* reasonCode ^short = "Indication/reason for medication"

// Dosage instructions
* dosageInstruction MS
* dosageInstruction.text MS
* dosageInstruction.text ^short = "Free text dosage instructions"
* dosageInstruction.route MS

// End date for non-active medications
* dispenseRequest.validityPeriod.end 0..1 MS
* dispenseRequest.validityPeriod.end ^short = "End date for reported medication"

// Mappings to VistA File 55.05
Mapping: VistAFile55-05-Reported
Id: vista-file-55-05
Title: "VistA Non-VA Meds File (55.05)"
Source: EMIReportedMedicationRequest
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-55-05"

* medicationCodeableConcept -> "File 55.05, Field .01 (ORDERABLE ITEM) -> mapped to RxNorm"
* status -> "File 55.05, Field 5 (STATUS)"
* reasonCode -> "File 55.05, Field 15 (INDICATION FOR USE)"

// Invariants defined in Rulesets.fsh
