Profile: EMIPrescriptions
Parent: EMIAllButDocumentedMedications
Id: emi-prescriptions
Title: "EMI Prescriptions"
Description: "Profile for prescriptions with dispense details. Extends EMIAllButDocumentedMedications to add quantity, refills, and expected supply duration. Used for pending prescriptions and as a base for finished prescriptions."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Invariants - see Rulesets.fsh (adds quantity, refills, duration checks)
* insert PendingInvariants

// Category - community
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains community 1..1 MS
* category[community] = $MedicationRequestCategory#community

// Dispense request details
* dispenseRequest 0..1 MS
* dispenseRequest.quantity 0..1 MS
* dispenseRequest.quantity ^short = "Quantity to dispense"
* dispenseRequest.expectedSupplyDuration 0..1 MS
* dispenseRequest.expectedSupplyDuration ^short = "Days supply"
* dispenseRequest.numberOfRepeatsAllowed 0..1 MS
* dispenseRequest.numberOfRepeatsAllowed ^short = "Number of refills"
