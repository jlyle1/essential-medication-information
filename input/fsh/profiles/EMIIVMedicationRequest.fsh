Profile: EMIIVMedicationRequest
Parent: MedicationRequest
Id: emi-iv-medicationrequest
Title: "EMI IV MedicationRequest"
Description: "Inpatient IV medication profile for Essential Medication Information, representing VistA File 55.01 IV orders."

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
* identifier[orderNumber] ^short = "IV order number"
* identifier[orderNumber] ^definition = "The VistA IV order number from File 55.01."

// Status
* status MS
* status ^short = "active | on-hold | cancelled | completed | entered-in-error | stopped"
* status.extension contains $AlternateCodes 0..1 MS
* status.extension[$AlternateCodes] ^short = "VistA pharmacy order status (File 55.01, Field 100)"

// Intent - always order
* intent = #order (exactly)

// Category - inpatient
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains inpatient 1..1 MS
* category[inpatient] = $MedicationRequestCategory#inpatient

// Medication - for IV, may be a solution with additives
* medication[x] only CodeableConcept
* medicationCodeableConcept 1..1 MS
* medicationCodeableConcept ^short = "IV solution/additive with RxNorm code"
* medicationCodeableConcept ^definition = "For complex IV orders with multiple components, the primary solution. Additives may be captured in contained resources or extensions."

// Subject
* subject only Reference(EMIPatient)
* subject MS

// Requester
* requester MS
* requester ^short = "Ordering provider"

// Dosage instructions
* dosageInstruction 1..* MS
* dosageInstruction.text MS
* dosageInstruction.text ^short = "Complete IV administration instructions"
* dosageInstruction.route MS
* dosageInstruction.route ^short = "IV route (e.g., IV, IV Piggyback)"
* dosageInstruction.timing MS
* dosageInstruction.timing ^short = "Infusion schedule"
* dosageInstruction.doseAndRate MS
* dosageInstruction.doseAndRate.rateQuantity MS
* dosageInstruction.doseAndRate.rateQuantity ^short = "Infusion rate"

// Mappings to VistA File 55.01
Mapping: VistAFile55-01
Id: vista-file-55-01
Title: "VistA IV File (55.01)"
Source: EMIIVMedicationRequest
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-55-01"

* identifier[orderNumber] -> "File 55.01, Field .01 (ORDER NUMBER)"
* medicationCodeableConcept -> "File 55.01, Additives (55.02) and Solutions (55.11) -> mapped to RxNorm"
* status -> "File 55.01, Field 100 (STATUS)"
* requester -> "File 55.01, Field .06 (PROVIDER)"
* dosageInstruction.route -> "File 55.01, IV route derived from order type"
* dosageInstruction.timing -> "File 55.01, Fields for start/stop times and schedule"
* dosageInstruction.doseAndRate.rateQuantity -> "File 55.01, Field 2 (INFUSION RATE)"
