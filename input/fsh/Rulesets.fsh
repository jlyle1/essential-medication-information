// =============================================================================
// EMI Medication Invariant Rulesets
// Organized by scope per index.md table
// =============================================================================

// -----------------------------------------------------------------------------
// 1. AllMedsInvariants - All 4 medication profiles
// -----------------------------------------------------------------------------

RuleSet: AllMedsInvariants
* obeys emi-all-1
* obeys emi-all-2
* obeys emi-all-3
* obeys emi-all-4
* obeys emi-all-5

Invariant: emi-all-1
Severity: #warning
Description: "meta.source SHOULD be populated to identify the originating system"
Expression: "meta.source.exists()"

Invariant: emi-all-2
Severity: #warning
Description: "medicationCodeableConcept SHOULD be populated with drug name, form, and strength"
Expression: "medication.exists()"

Invariant: emi-all-3
Severity: #warning
Description: "reasonCode SHOULD be populated to capture the indication for the medication"
Expression: "reasonCode.exists()"

Invariant: emi-all-4
Severity: #warning
Description: "status SHOULD be populated"
Expression: "status.exists()"

Invariant: emi-all-5
Severity: #warning
Description: "dosageInstruction.text (SIG) SHOULD be populated to provide patient instructions"
Expression: "dosageInstruction.text.exists()"

// -----------------------------------------------------------------------------
// 2. DocumentedInvariants - Documented/External profile only
// -----------------------------------------------------------------------------

RuleSet: DocumentedInvariants
* obeys emi-doc-1

Invariant: emi-doc-1
Severity: #warning
Description: "recorder SHOULD be populated to identify who recorded the documented medication"
Expression: "recorder.exists()"

// -----------------------------------------------------------------------------
// 3. OrderInvariants - All profiles except Documented (orders have a prescriber)
// -----------------------------------------------------------------------------

RuleSet: OrderInvariants
* obeys emi-ord-1

Invariant: emi-ord-1
Severity: #warning
Description: "requester SHOULD be populated to identify the prescriber/provider"
Expression: "requester.exists()"

// -----------------------------------------------------------------------------
// 4. PendingInvariants - Pending and Prescription profiles
// -----------------------------------------------------------------------------

RuleSet: PendingInvariants
* obeys emi-pend-1
* obeys emi-pend-2
* obeys emi-pend-3

Invariant: emi-pend-1
Severity: #warning
Description: "dispenseRequest.quantity SHOULD be populated to indicate the quantity to dispense"
Expression: "dispenseRequest.quantity.exists()"

Invariant: emi-pend-2
Severity: #warning
Description: "dispenseRequest.numberOfRepeatsAllowed SHOULD be populated to indicate refills"
Expression: "dispenseRequest.numberOfRepeatsAllowed.exists()"

Invariant: emi-pend-3
Severity: #warning
Description: "dispenseRequest.expectedSupplyDuration SHOULD be populated to indicate days supply"
Expression: "dispenseRequest.expectedSupplyDuration.exists()"

// -----------------------------------------------------------------------------
// 5. PrescriptionInvariants - Prescription profile only
// -----------------------------------------------------------------------------

RuleSet: PrescriptionInvariants
* obeys emi-out-1
* obeys emi-out-4
* obeys emi-out-5
* obeys emi-out-6
* obeys emi-out-7
* obeys emi-out-8

Invariant: emi-out-1
Severity: #warning
Description: "identifier (RxNumber) SHOULD be populated to uniquely identify the prescription"
Expression: "identifier.where(system = 'http://va.gov/fhir/sid/648/52-.01').value.exists()"

Invariant: emi-out-4
Severity: #warning
Description: "dispenseRequest.validityPeriod.end SHOULD be populated to indicate prescription expiration date"
Expression: "dispenseRequest.validityPeriod.end.exists()"

Invariant: emi-out-5
Severity: #warning
Description: "cancelDate extension SHOULD be populated for cancelled, completed, or stopped prescriptions"
Expression: "status in ('cancelled' | 'completed' | 'stopped') implies extension('http://va.gov/fhir/emi/StructureDefinition/medicationrequest-cancelDate').exists()"

Invariant: emi-out-6
Severity: #warning
Description: "dateLastDispensed extension SHOULD be populated to indicate last release date"
Expression: "extension('http://va.gov/fhir/emi/StructureDefinition/medicationrequest-dateLastDispensed').exists()"

Invariant: emi-out-7
Severity: #warning
Description: "remainingFills extension SHOULD be populated to indicate refills remaining"
Expression: "extension('http://va.gov/fhir/emi/StructureDefinition/medicationrequest-refillsRemaining').exists()"

Invariant: emi-out-8
Severity: #warning
Description: "dispenseRequest.performer SHOULD be populated to identify the pharmacy"
Expression: "dispenseRequest.performer.exists()"