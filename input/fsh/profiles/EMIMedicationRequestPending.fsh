Profile: EMIMedicationRequestPending
Parent: MedicationRequest
Id: emi-medicationrequest-pending
Title: "EMI MedicationRequest Pending"
Description: "Pending prescription profile for Essential Medication Information, representing prescriptions that have been ordered but not yet dispensed."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Invariants - see Rulesets.fsh
* insert AllMedsInvariants
* insert OrderInvariants
* insert PendingInvariants

// Source system
* meta.source 0..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Status - typically active for pending
* status MS
* status ^short = "active | on-hold | cancelled | entered-in-error"
* status.extension contains $AlternateCodes named alternateCodes 0..1 MS
* status.extension[alternateCodes] ^short = "VistA pharmacy order status"

// Intent - always order for prescriptions
* intent = #order (exactly)

// Category - community
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains community 1..1 MS
* category[community] = $MedicationRequestCategory#community

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
* dosageInstruction.text MS
* dosageInstruction.text ^short = "SIG - patient instructions"
* dosageInstruction.text ^definition = "Complete dosage instructions as written on the prescription."

// Dispense request details (subset - no prescription-specific fields)
* dispenseRequest 0..1 MS
* dispenseRequest.quantity 0..1 MS
* dispenseRequest.quantity ^short = "Quantity to dispense"
* dispenseRequest.expectedSupplyDuration 0..1 MS
* dispenseRequest.expectedSupplyDuration ^short = "Days supply"
* dispenseRequest.numberOfRepeatsAllowed 0..1 MS
* dispenseRequest.numberOfRepeatsAllowed ^short = "Number of refills"
