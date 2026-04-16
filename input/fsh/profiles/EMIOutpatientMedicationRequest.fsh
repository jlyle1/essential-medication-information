Profile: EMIOutpatientMedicationRequest
Parent: MedicationRequest
Id: emi-outpatient-medicationrequest
Title: "EMI Outpatient MedicationRequest"
Description: "Outpatient prescription profile for Essential Medication Information, representing VistA File 52 prescriptions."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Invariants - see Rulesets.fsh
* insert AllMedsInvariants
* insert SigInvariants
* insert OrderInvariants
* insert OutpatientInvariants

// Source system
* meta.source 0..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Extensions for dispense summary (alternative to sending MedicationDispense resources)
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

// Status
* status.extension contains $AlternateCodes named alternateCodes 0..1 MS
* status.extension[alternateCodes] ^short = "VistA pharmacy order status (File 52, Field 100)"

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
* medicationCodeableConcept from EMIRxNormWithStrengthFormVS (preferred)
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
* dosageInstruction 0..* MS
* dosageInstruction.text 1..1 MS
* dosageInstruction.text ^short = "SIG - patient instructions"
* dosageInstruction.text ^definition = "Complete dosage instructions as written on the prescription."

// Dispense request details
* dispenseRequest 0..1 MS
* dispenseRequest.quantity 0..1 MS
* dispenseRequest.quantity ^short = "Quantity dispensed"
* dispenseRequest.expectedSupplyDuration 0..1 MS
* dispenseRequest.expectedSupplyDuration ^short = "Days supply"
* dispenseRequest.numberOfRepeatsAllowed 0..1 MS
* dispenseRequest.numberOfRepeatsAllowed ^short = "Number of refills"
* dispenseRequest.validityPeriod.end 0..1 MS
* dispenseRequest.validityPeriod.end ^short = "Prescription expiration date"
* dispenseRequest.performer 0..1 MS
* dispenseRequest.performer only Reference(EMIPharmacyOrganization)
* dispenseRequest.performer ^short = "Dispensing pharmacy"

// Supporting information - medication counseling
* supportingInformation 0..* MS
* supportingInformation ^slicing.discriminator.type = #type
* supportingInformation ^slicing.discriminator.path = "resolve()"
* supportingInformation ^slicing.rules = #open

* supportingInformation contains counseling 0..* MS
* supportingInformation[counseling] only Reference(Procedure)
* supportingInformation[counseling] ^short = "Medication counseling procedure"
* supportingInformation[counseling] ^definition = "Reference to medication counseling procedure (EMIMedicationCounselingProcedure) indicating whether counseling was performed."

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

// Invariants defined in Rulesets.fsh
