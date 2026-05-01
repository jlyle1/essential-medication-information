Profile: EMIMedicationRequestInFacility
Parent: MedicationRequest
Id: emi-medicationrequest-infacility
Title: "EMI MedicationRequest In-Facility"
Description: "In-facility medication profile for Essential Medication Information, representing both IV orders (VistA File 55.01) and unit dose orders (VistA File 55.06). The identifier system indicates whether this is an IV or unit dose order."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Invariants - see Rulesets.fsh
* insert AllMedsInvariants
* insert OrderInvariants

// Source system
* meta.source 0..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Identifier - order number (IV or Unit Dose)
* identifier 0..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "Order number - system indicates IV vs Unit Dose"

* identifier contains
    ivOrderNumber 0..1 MS and
    udOrderNumber 0..1 MS

* identifier[ivOrderNumber].system = $VistAIVOrderNumber (exactly)
* identifier[ivOrderNumber].value 1..1 MS
* identifier[ivOrderNumber] ^short = "IV order number"
* identifier[ivOrderNumber] ^definition = "The VistA IV order number from File 55.01. Presence indicates this is an IV order."

* identifier[udOrderNumber].system = $VistAUnitDoseOrderNumber (exactly)
* identifier[udOrderNumber].value 1..1 MS
* identifier[udOrderNumber] ^short = "Unit dose order number"
* identifier[udOrderNumber] ^definition = "The VistA unit dose order number from File 55.06. Presence indicates this is a unit dose order."

// Status
* status MS
* status ^short = "active | on-hold | cancelled | completed | entered-in-error | stopped"
* status.extension contains $AlternateCodes named alternateCodes 0..1 MS
* status.extension[alternateCodes] ^short = "VistA pharmacy order status"

// Intent - always order
* intent = #order (exactly)

// Category - inpatient or outpatient (for clinic orders)
* category 1..* MS
* category ^short = "inpatient | outpatient (for clinic)"

// Medication
* medication[x] only CodeableConcept
* medicationCodeableConcept 1..1 MS
* medicationCodeableConcept ^short = "Medication with RxNorm code"
* medicationCodeableConcept ^definition = "The medication. For IV orders, this is the primary solution; additives may be captured in contained resources or extensions."

// Subject
* subject only Reference(EMIPatient)
* subject MS

// Requester
* requester MS
* requester ^short = "Ordering provider"

// Reason for use (indication)
* reasonCode MS
* reasonCode ^short = "Indication/reason for medication"

// Dosage instructions
* dosageInstruction 1..* MS
* dosageInstruction.text MS
* dosageInstruction.text ^short = "Administration instructions"
* dosageInstruction.route MS
* dosageInstruction.route ^short = "Route of administration"
* dosageInstruction.timing MS
* dosageInstruction.timing ^short = "Administration schedule"
* dosageInstruction.timing.code MS
* dosageInstruction.timing.code ^short = "Schedule code (e.g., BID, TID)"
* dosageInstruction.doseAndRate MS
* dosageInstruction.doseAndRate.rateQuantity MS
* dosageInstruction.doseAndRate.rateQuantity ^short = "Infusion rate (for IV orders)"

// Mappings to VistA File 55.06 (Unit Dose)
Mapping: VistAFile55-06
Id: vista-file-55-06
Title: "VistA Unit Dose File (55.06)"
Source: EMIMedicationRequestInFacility
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-55-06"

* identifier[udOrderNumber] -> "File 55.06, Field .01 (ORDER NUMBER)"
* medicationCodeableConcept -> "File 55.06, Field 2 (DISPENSE DRUG) -> mapped to RxNorm"
* dosageInstruction.route -> "File 55.06, Field 3 (ROUTE)"
* dosageInstruction.timing.code -> "File 55.06, Field 26 (SCHEDULE)"
* status -> "File 55.06, Field 28 (STATUS)"
* requester -> "File 55.06, Field .06 (PROVIDER) via parent 55"

// Mappings to VistA File 55.01 (IV)
Mapping: VistAFile55-01
Id: vista-file-55-01
Title: "VistA IV File (55.01)"
Source: EMIMedicationRequestInFacility
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-55-01"

* identifier[ivOrderNumber] -> "File 55.01, Field .01 (ORDER NUMBER)"
* medicationCodeableConcept -> "File 55.01, Additives (55.02) and Solutions (55.11) -> mapped to RxNorm"
* status -> "File 55.01, Field 100 (STATUS)"
* requester -> "File 55.01, Field .06 (PROVIDER)"
* dosageInstruction.route -> "File 55.01, IV route derived from order type"
* dosageInstruction.timing -> "File 55.01, Fields for start/stop times and schedule"
* dosageInstruction.doseAndRate.rateQuantity -> "File 55.01, Field 2 (INFUSION RATE)"
