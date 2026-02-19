Profile: EMIOutpatientMedicationRequest
Parent: $USCoreMedicationRequest
Id: emi-outpatient-medicationrequest
Title: "EMI Outpatient MedicationRequest"
Description: "Outpatient prescription profile for Essential Medication Information, representing VistA File 52 prescriptions."

* ^status = #active
* ^version = "1.0.0"

// Identifier - RX number
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier contains rxNumber 1..1 MS
* identifier[rxNumber].system = $VistARxNumber (exactly)
* identifier[rxNumber].value 1..1 MS
* identifier[rxNumber] ^short = "Prescription number (Rx#)"
* identifier[rxNumber] ^definition = "The VistA prescription number from File 52."

// Status
* status MS
* status ^short = "active | on-hold | cancelled | completed | entered-in-error | stopped | draft"
* status ^definition = "Current status of the prescription."

// Intent - always order for prescriptions
* intent = #order (exactly)

// Category - outpatient
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains outpatient 1..1 MS
* category[outpatient] = $MedicationRequestCategory#outpatient

// Medication - drug name with RxNorm coding
* medication[x] only CodeableConcept
* medicationCodeableConcept 1..1 MS
* medicationCodeableConcept ^short = "Medication with RxNorm code"
* medicationCodeableConcept ^definition = "Drug name and strength, coded with RxNorm where available."

// Subject
* subject only Reference(EMIPatient)
* subject MS

// Requester - prescriber
* requester MS
* requester ^short = "Prescriber"
* requester ^definition = "The provider who prescribed the medication."

// Reason for use (indication)
* reasonCode MS
* reasonCode ^short = "Indication/reason for medication"
* reasonCode ^definition = "The reason or indication for the medication."

// Dosage instructions (SIG)
* dosageInstruction 1..* MS
* dosageInstruction.text 1..1 MS
* dosageInstruction.text ^short = "SIG - patient instructions"
* dosageInstruction.text ^definition = "Complete dosage instructions as written on the prescription."

// Dispense request details
* dispenseRequest 1..1 MS
* dispenseRequest.quantity MS
* dispenseRequest.quantity ^short = "Quantity dispensed"
* dispenseRequest.expectedSupplyDuration MS
* dispenseRequest.expectedSupplyDuration ^short = "Days supply"
* dispenseRequest.numberOfRepeatsAllowed MS
* dispenseRequest.numberOfRepeatsAllowed ^short = "Number of refills"
* dispenseRequest.validityPeriod MS
* dispenseRequest.validityPeriod.end MS
* dispenseRequest.validityPeriod.end ^short = "Prescription expiration date"

// Mappings to VistA File 52
Mapping: VistAFile52
Id: vista-file-52
Title: "VistA Prescription File (52)"
Source: EMIOutpatientMedicationRequest
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
