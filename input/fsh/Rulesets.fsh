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

Invariant: emi-all-1
Severity: #warning
Description: "meta.source SHOULD be populated to identify the originating system"
Expression: "meta.source.exists()"

Invariant: emi-all-2
Severity: #warning
Description: "reasonCode SHOULD be populated to capture the indication for the medication"
Expression: "reasonCode.exists()"

// -----------------------------------------------------------------------------
// 2. SigInvariants - All profiles except IV
// -----------------------------------------------------------------------------

RuleSet: SigInvariants
* obeys emi-sig-1

Invariant: emi-sig-1
Severity: #warning
Description: "dosageInstruction.text (SIG) SHOULD be populated to provide patient instructions"
Expression: "dosageInstruction.text.exists()"

// -----------------------------------------------------------------------------
// 3. ReportedInvariants - Reported/External profile only
// -----------------------------------------------------------------------------

RuleSet: ReportedInvariants
* obeys emi-rep-1

Invariant: emi-rep-1
Severity: #warning
Description: "End date SHOULD be populated for non-active reported medications"
Expression: "status = 'active' or dispenseRequest.validityPeriod.end.exists()"

// -----------------------------------------------------------------------------
// 4. OrderInvariants - All profiles except Reported (orders have a prescriber)
// -----------------------------------------------------------------------------

RuleSet: OrderInvariants
* obeys emi-ord-1

Invariant: emi-ord-1
Severity: #warning
Description: "requester SHOULD be populated to identify the prescriber/provider"
Expression: "requester.exists()"

// -----------------------------------------------------------------------------
// 5. OutpatientInvariants - Outpatient profile only
// -----------------------------------------------------------------------------

RuleSet: OutpatientInvariants
* obeys emi-out-1
* obeys emi-out-2
* obeys emi-out-3
* obeys emi-out-4
* obeys emi-out-5
* obeys emi-out-6
* obeys emi-out-7
* obeys emi-out-8
* obeys emi-out-9

Invariant: emi-out-1
Severity: #warning
Description: "identifier (RxNumber) SHOULD be populated to uniquely identify the prescription"
Expression: "identifier.where(system = 'http://va.gov/fhir/sid/648/52-.01').value.exists()"

Invariant: emi-out-2
Severity: #warning
Description: "dispenseRequest.quantity SHOULD be populated to indicate the quantity dispensed"
Expression: "dispenseRequest.quantity.exists()"

Invariant: emi-out-3
Severity: #warning
Description: "dispenseRequest.expectedSupplyDuration SHOULD be populated to indicate days supply"
Expression: "dispenseRequest.expectedSupplyDuration.exists()"

Invariant: emi-out-4
Severity: #warning
Description: "dispenseRequest.validityPeriod.end SHOULD be populated to indicate prescription expiration date"
Expression: "dispenseRequest.validityPeriod.end.exists()"

Invariant: emi-out-5
Severity: #warning
Description: "cancelDate extension SHOULD be populated for cancelled, completed, or stopped prescriptions"
Expression: "status in ('cancelled' | 'completed' | 'stopped') implies extension('http://va.gov/fhir/emi/StructureDefinition/emi-cancel-date').exists()"

Invariant: emi-out-6
Severity: #warning
Description: "dateLastDispensed extension SHOULD be populated to indicate last release date"
Expression: "extension('http://va.gov/fhir/emi/StructureDefinition/emi-date-last-dispensed').exists()"

Invariant: emi-out-7
Severity: #warning
Description: "remainingFills extension SHOULD be populated to indicate refills remaining"
Expression: "extension('http://va.gov/fhir/emi/StructureDefinition/emi-remaining-fills').exists()"

Invariant: emi-out-8
Severity: #warning
Description: "dispenseRequest.performer SHOULD be populated to identify the pharmacy"
Expression: "dispenseRequest.performer.exists()"

Invariant: emi-out-9
Severity: #warning
Description: "supportingInformation (counseling) SHOULD be populated to indicate medication counseling status"
Expression: "supportingInformation.exists()"