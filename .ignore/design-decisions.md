# EMI IG Design Decisions and Questions Log

## Decisions Made

### Profile Structure
1. **Counseling modeled as single Observation with 2 components** - WAS THE PATIENT COUNSELED (52-41) and WAS COUNSELING UNDERSTOOD (52-42) as two components in EMIMedicationCounselingObservation

2. **Separate MedicationRequest profiles per VistA source** - Different VistA files have different field structures, warranting distinct profiles

3. **List resource for empty list handling** - Using List with emptyReason rather than Composition

4. **Bundle as operation response** - EMIMedicationBundle returned from $medication-list operation

5. **Status horizon duration as operation parameter** - Included in EMIRequestParameters for the operation input

### Technical Choices
1. **Canonical URL**: `http://va.gov/fhir/emi`
2. **Publisher**: VA/PBM
3. **Base profiles**: US Core where available

## Design Questions & Best Guesses

### Q1: MedicationRequest.medication - CodeableConcept vs Reference?
**Decision**: Use CodeableConcept with RxNorm coding. VistA stores drug names and can be mapped to RxNorm. Reference to Medication resource adds complexity without clear benefit for this use case.

### Q2: How to represent "Med Source" (Rx file, inpatient file, non-VA, pending)?
**Decision**: Use separate profiles per source type. The profile itself indicates the source. Additionally, could use category or extension if more granularity needed.

### Q3: Indication/Reason - where to map?
**Decision**: MedicationRequest.reasonCode for coded reasons, MedicationRequest.reasonReference for references to Condition.

### Q4: "Med Informed" and "Med Understood" - what codes?
**Decision**: Create local CodeSystem for counseling status with codes: `counseled`, `not-counseled`, `understood`, `not-understood`.

### Q5: How to represent pharmacy information?
**Decision**: EMIMedicationDispense.performer.actor references EMIPharmacyOrganization. Organization includes name, address (telecom for phone).

### Q6: File 52 "LAST RELEASED DATE" - which element?
**Decision**: MedicationDispense.whenHandedOver or MedicationDispense.extension with specific dispense date.

### Q7: Patient identifiers (ICN, EDIPI)?
**Decision**: Use Patient.identifier with appropriate system URIs:
- ICN: `urn:oid:2.16.840.1.113883.4.349` (VA ICN)
- EDIPI: `urn:oid:2.16.840.1.113883.3.42.10001.100001.12` (DoD EDIPI)

### Q8: Allergy reaction coding?
**Decision**: Use SNOMED CT for reaction manifestation codes where available, allow text fallback.

### Q9: Prescription status mapping?
**Decision**: Map VistA status values to FHIR MedicationRequest.status + MedicationRequest.statusReason for detailed status.

### Q10: Days supply / expected duration representation?
**Decision**: MedicationRequest.dispenseRequest.expectedSupplyDuration for days supply.

## VistA File Mappings Reference

### File 2 - Patient
- .01 NAME -> Patient.name
- .03 DATE OF BIRTH -> Patient.birthDate
- 991.01 INTEGRATION CONTROL NUMBER -> Patient.identifier (ICN)

### File 120.8 - Allergy
- .02 REACTANT -> AllergyIntolerance.code
- 1 GMR ALLERGY -> AllergyIntolerance.code (coded)
- 10 REACTIONS -> AllergyIntolerance.reaction.manifestation

### File 52 - Prescription
- .01 RX # -> MedicationRequest.identifier
- 6 DRUG -> MedicationRequest.medicationCodeableConcept
- 10 SIG -> MedicationRequest.dosageInstruction.text
- 100 STATUS -> MedicationRequest.status
- 7 QTY -> MedicationRequest.dispenseRequest.quantity
- 8 DAYS SUPPLY -> MedicationRequest.dispenseRequest.expectedSupplyDuration
- 9 # OF REFILLS -> MedicationRequest.dispenseRequest.numberOfRepeatsAllowed
- 26 EXPIRATION DATE -> MedicationRequest.dispenseRequest.validityPeriod.end
- 4 PROVIDER -> MedicationRequest.requester
- 41 WAS THE PATIENT COUNSELED -> Observation.component[counseled]
- 42 WAS COUNSELING UNDERSTOOD -> Observation.component[understood]

### File 55.06 - Unit Dose
- .01 ORDER NUMBER -> MedicationRequest.identifier
- 2 DISPENSE DRUG -> MedicationRequest.medicationCodeableConcept
- 3 ROUTE -> MedicationRequest.dosageInstruction.route
- 26 SCHEDULE -> MedicationRequest.dosageInstruction.timing
- 28 STATUS -> MedicationRequest.status

### File 55.01 - IV
- .01 ORDER NUMBER -> MedicationRequest.identifier
- .06 PROVIDER -> MedicationRequest.requester
- 100 STATUS -> MedicationRequest.status
- Additives/Solutions -> MedicationRequest.medicationCodeableConcept (may need extension for complex IV)

### File 55.05 - Non-VA Meds
- .01 ORDERABLE ITEM -> MedicationStatement.medicationCodeableConcept
- 2 DOSAGE -> MedicationStatement.dosage.text
- 3 ROUTE -> MedicationStatement.dosage.route
- 4 SCHEDULE -> MedicationStatement.dosage.timing
- 5 STATUS -> MedicationStatement.status

## Build Status

### IG Publisher Results (2026-02-19)
- SUSHI: 0 Errors, 0 Warnings
- Publisher: 72 Errors, 47 Warnings, 63 Info messages, 3 Broken Links
- Most errors are validation issues with examples that need refinement
- Output generated in `output/` folder

### GitHub Push Instructions
Since `gh` CLI is not available, push manually:
```bash
# Create repository on GitHub first, then:
git remote add origin https://github.com/YOUR_USERNAME/essential-medication-information.git
git branch -M main
git push -u origin main
```

## Future Work / Known Issues
1. Example validation errors need to be addressed
2. May need to add extensions for complex IV orders (multiple additives/solutions)
3. VistA status codes need formal ValueSet definition
4. Consider adding Practitioner profile for prescriber information
