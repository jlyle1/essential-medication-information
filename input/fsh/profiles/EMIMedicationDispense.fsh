Profile: EMIMedicationDispense
Parent: MedicationDispense
Id: emi-medicationdispense
Title: "EMI MedicationDispense"
Description: "Medication dispense profile for Essential Medication Information, capturing dispense events including last released date and pharmacy information."

* ^status = #active
* ^version = "1.0.0"

// Status
* status 1..1 MS
* status ^short = "preparation | in-progress | cancelled | on-hold | completed | entered-in-error | stopped | declined | unknown"

// Medication
* medication[x] only CodeableConcept
* medicationCodeableConcept 1..1 MS
* medicationCodeableConcept from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.4 (preferred)
* medicationCodeableConcept ^short = "Dispensed medication with RxNorm code"

// Subject
* subject only Reference(EMIPatient)
* subject 1..1 MS

// Authorizing prescription
* authorizingPrescription MS
* authorizingPrescription only Reference(EMIOutpatientMedicationRequest or EMIUnitDoseMedicationRequest or EMIIVMedicationRequest)
* authorizingPrescription ^short = "Authorizing prescription"

// Quantity
* quantity MS
* quantity ^short = "Amount dispensed"

// Days supply
* daysSupply MS
* daysSupply ^short = "Days supply dispensed"

// When handed over - CRITICAL for "Last Released Date"
* whenHandedOver 1..1 MS
* whenHandedOver ^short = "Last released/dispensed date"
* whenHandedOver ^definition = "The date the medication was last dispensed or released to the patient. This is the 'Last Released Date' element."

// When prepared
* whenPrepared MS
* whenPrepared ^short = "When prepared/filled"

// Performer - pharmacy
* performer MS
* performer ^short = "Dispensing pharmacy"
* performer.actor only Reference(EMIPharmacyOrganization or Practitioner)
* performer.actor MS

// Mappings to VistA File 52
Mapping: VistAFile52Dispense
Id: vista-file-52-dispense
Title: "VistA Prescription File (52) - Dispense Data"
Source: EMIMedicationDispense
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-52-dispense"

* medicationCodeableConcept -> "File 52, Field 6 (DRUG) -> RxNorm"
* quantity -> "File 52, Field 7 (QTY)"
* daysSupply -> "File 52, Field 8 (DAYS SUPPLY)"
* whenHandedOver -> "File 52, Sub-file 52.1 (REFILL), last fill date or File 52, Field 22 (FILL DATE)"
* whenPrepared -> "File 52, Refill sub-file fill/preparation date"
* performer.actor -> "File 52, Field 2 (PHARMACY) -> Organization"
