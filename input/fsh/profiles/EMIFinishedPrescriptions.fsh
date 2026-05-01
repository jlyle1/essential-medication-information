Profile: EMIFinishedPrescriptions
Parent: EMIPrescriptions
Id: emi-finished-prescriptions
Title: "EMI Finished Prescriptions"
Description: "Profile for completed prescription processing (VistA File 52). Extends EMIPrescriptions to add Rx number, expiration date, cancel date, last dispensed date, remaining fills, and pharmacy. Represents prescriptions that have been fully processed and dispensed at least once."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Invariants - see Rulesets.fsh (adds Rx-specific checks)
* insert PrescriptionInvariants

// Extensions for dispense summary
* extension contains
    DateLastDispensed named dateLastDispensed 0..1 MS and
    RemainingFills named remainingFills 0..1 MS and
    CancelDate named cancelDate 0..1 MS
* extension[dateLastDispensed] ^short = "Date medication was last dispensed (valueDateTime)"
* extension[remainingFills] ^short = "Number of refills remaining (valueUnsignedInt)"
* extension[cancelDate] ^short = "Date prescription was cancelled/discontinued (valueDateTime)"

// Identifier - RX number
* identifier 0..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier contains rxNumber 0..1 MS
* identifier[rxNumber].system = $VistARxNumber (exactly)
* identifier[rxNumber].value 1..1 MS
* identifier[rxNumber] ^short = "Prescription number (Rx#)"
* identifier[rxNumber] ^definition = "The VistA prescription number from File 52."

// Dispense request - additional fields for finished prescriptions
* dispenseRequest.validityPeriod.end 0..1 MS
* dispenseRequest.validityPeriod.end ^short = "Prescription expiration date"
* dispenseRequest.performer 0..1 MS
* dispenseRequest.performer only Reference(EMIPharmacyOrganization)
* dispenseRequest.performer ^short = "Dispensing pharmacy"

// Mappings to VistA File 52
Mapping: VistAFile52
Id: vista-file-52
Title: "VistA Prescription File (52)"
Source: EMIFinishedPrescriptions
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-52"

* identifier[rxNumber] -> "File 52, Field .01 (RX #)"
* medicationCodeableConcept -> "File 52, Field 6 (DRUG) -> mapped to RxNorm"
* dosageInstruction.text -> "File 52, Field 10 (SIG)"
* status -> "File 52, Field 100 (STATUS)"
* dispenseRequest.quantity -> "File 52, Field 7 (QTY)"
* dispenseRequest.expectedSupplyDuration -> "File 52, Field 8 (DAYS SUPPLY)"
* dispenseRequest.numberOfRepeatsAllowed -> "File 52, Field 9 (# OF REFILLS)"
* dispenseRequest.validityPeriod.end -> "File 52, Field 26 (EXPIRATION DATE)"
* requester -> "File 52, Field 4 (PROVIDER)"
* reasonCode -> "File 52, Field 9.5 (INDICATION) if available"
