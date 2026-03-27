Profile: EMIExternalMedicationStatement
Parent: MedicationStatement
Id: emi-external-medicationstatement
Title: "EMI External MedicationStatement"
Description: "External medication profile for Essential Medication Information, representing VistA File 55.05 non-VA medications including OTC, herbal, and outside prescriptions."

* ^status = #active
* ^version = "1.0.0"

// Invariants
* obeys emi-ext-med-1
* obeys emi-ext-med-2

// Source system
* meta.source 0..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Status required by core
* status.extension contains $AlternateCodes named alternateCodes 0..1 MS
* status.extension[alternateCodes] ^short = "VistA pharmacy order status (File 55.05, Field 5)"

// Medication
* medication[x] only CodeableConcept
* medicationCodeableConcept 1..1 MS
* medicationCodeableConcept from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.4 (preferred)
* medicationCodeableConcept ^short = "External medication with RxNorm code"
* medicationCodeableConcept ^definition = "The external medication including name, strength, and form. May include OTC, herbal, nutraceuticals, or outside prescriptions."

// Subject
* subject only Reference(EMIPatient)
* subject 1..1 MS

// Reason for use
* reasonCode MS
* reasonCode ^short = "Indication/reason for medication"

// Mappings to VistA File 55.05
Mapping: VistAFile55-05
Id: vista-file-55-05
Title: "VistA Non-VA Meds File (55.05)"
Source: EMIExternalMedicationStatement
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-55-05"

* medicationCodeableConcept -> "File 55.05, Field .01 (ORDERABLE ITEM) -> mapped to RxNorm"
* status -> "File 55.05, Field 5 (STATUS)"
* reasonCode -> "File 55.05, Field 15 (INDICATION FOR USE)"

// Invariants
Invariant: emi-ext-med-1
Severity: #warning
Description: "meta.source SHOULD be populated to identify the originating system for external medication data"
Expression: "meta.source.exists()"

Invariant: emi-ext-med-2
Severity: #warning
Description: "reasonCode SHOULD be populated to capture the indication for the external medication"
Expression: "reasonCode.exists()"
