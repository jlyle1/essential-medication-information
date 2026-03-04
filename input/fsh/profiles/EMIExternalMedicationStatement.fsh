Profile: EMIExternalMedicationStatement
Parent: MedicationStatement
Id: emi-external-medicationstatement
Title: "EMI External MedicationStatement"
Description: "External medication profile for Essential Medication Information, representing VistA File 55.05 non-VA medications including OTC, herbal, and outside prescriptions."

* ^status = #active
* ^version = "1.0.0"

// Source system
* meta.source 1..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Status required
* status 1..1 MS
* status ^short = "active | completed | entered-in-error | intended | stopped | on-hold | unknown | not-taken"
* status.extension contains $AlternateCodes named alternateCodes 0..1 MS
* status.extension[alternateCodes] ^short = "VistA pharmacy order status (File 55.05, Field 5)"

// Category - community (external)
* category MS
* category = $MedicationStatementCategory#community
* category ^short = "Community/external medication"

// Medication
* medication[x] only CodeableConcept
* medicationCodeableConcept 1..1 MS
* medicationCodeableConcept from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.4 (preferred)
* medicationCodeableConcept ^short = "External medication with RxNorm code"
* medicationCodeableConcept ^definition = "The external medication including name, strength, and form. May include OTC, herbal, nutraceuticals, or outside prescriptions."

// Subject
* subject only Reference(EMIPatient)
* subject 1..1 MS

// Effective period
* effective[x] MS
* effective[x] ^short = "When medication is/was taken"

// Date asserted
* dateAsserted MS
* dateAsserted ^short = "When recorded in system"

// Information source
* informationSource MS
* informationSource ^short = "Person who provided the information (often patient)"

// Reason for use
* reasonCode MS
* reasonCode ^short = "Indication/reason for medication"

// Dosage
* dosage MS
* dosage.text MS
* dosage.text ^short = "Dosage instructions as reported"
* dosage.route MS
* dosage.route ^short = "Route of administration"
* dosage.route from http://hl7.org/fhir/ValueSet/route-codes (preferred)
* dosage.timing MS
* dosage.timing ^short = "Schedule/frequency"
* dosage.timing.code MS

// Mappings to VistA File 55.05
Mapping: VistAFile55-05
Id: vista-file-55-05
Title: "VistA Non-VA Meds File (55.05)"
Source: EMIExternalMedicationStatement
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-55-05"

* medicationCodeableConcept -> "File 55.05, Field .01 (ORDERABLE ITEM) -> mapped to RxNorm"
* dosage.text -> "File 55.05, Field 2 (DOSAGE)"
* dosage.route -> "File 55.05, Field 3 (ROUTE)"
* dosage.timing.code -> "File 55.05, Field 4 (SCHEDULE)"
* status -> "File 55.05, Field 5 (STATUS)"
* dateAsserted -> "File 55.05, Field 6 (START DATE) or documentation date"
* informationSource -> "File 55.05, Field 8 (DOCUMENTED BY)"
