Profile: EMIInpatientMedicationRequest
Parent: $USCoreMedicationRequest
Id: emi-inpatient-medicationrequest
Title: "EMI Inpatient MedicationRequest"
Description: "Inpatient unit dose medication profile for Essential Medication Information, representing VistA File 55.06 orders."

* ^status = #active
* ^version = "1.0.0"

// Identifier - order number
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier contains orderNumber 1..1 MS
* identifier[orderNumber].system = $VistAOrderNumber (exactly)
* identifier[orderNumber].value 1..1 MS
* identifier[orderNumber] ^short = "Inpatient order number"
* identifier[orderNumber] ^definition = "The VistA unit dose order number from File 55.06."

// Status
* status MS
* status ^short = "active | on-hold | cancelled | completed | entered-in-error | stopped"

// Intent - always order
* intent = #order (exactly)

// Category - inpatient
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains inpatient 1..1 MS
* category[inpatient] = $MedicationRequestCategory#inpatient

// Medication
* medication[x] only CodeableConcept
* medicationCodeableConcept 1..1 MS
* medicationCodeableConcept ^short = "Dispense drug with RxNorm code"

// Subject
* subject only Reference(EMIPatient)
* subject MS

// Requester
* requester MS
* requester ^short = "Ordering provider"

// Dosage instructions
* dosageInstruction 1..* MS
* dosageInstruction.text MS
* dosageInstruction.route MS
* dosageInstruction.route ^short = "Route of administration"
* dosageInstruction.timing MS
* dosageInstruction.timing ^short = "Administration schedule"
* dosageInstruction.timing.code MS
* dosageInstruction.timing.code ^short = "Schedule code (e.g., BID, TID)"

// Mappings to VistA File 55.06
Mapping: VistAFile55-06
Id: vista-file-55-06
Title: "VistA Unit Dose File (55.06)"
Source: EMIInpatientMedicationRequest
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-55-06"

* identifier[orderNumber] -> "File 55.06, Field .01 (ORDER NUMBER)"
* medicationCodeableConcept -> "File 55.06, Field 2 (DISPENSE DRUG) -> mapped to RxNorm"
* dosageInstruction.route -> "File 55.06, Field 3 (ROUTE)"
* dosageInstruction.timing.code -> "File 55.06, Field 26 (SCHEDULE)"
* status -> "File 55.06, Field 28 (STATUS)"
* requester -> "File 55.06, Field .06 (PROVIDER) via parent 55"
