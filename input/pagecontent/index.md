### Essential Medication Information Implementation Guide

This implementation guide defines FHIR profiles and operations for exchanging essential medication information to support patient care in VA healthcare settings. It implements a subset of VHA Directive 1164 focused on database query use cases.

### Scope

This IG supports querying a database for essential medication information, including:

- **Patient Information**: Name, date of birth, identifiers (ICN, EDIPI)
- **Allergy Information**: Substances and reactions
- **Medication Information**: From multiple sources including local VA, remote VA, and non-VA medications
- **Dispense Information**: Last released date, quantity, pharmacy details
- **Counseling Information**: Whether patient was counseled and demonstrated understanding

### Key Profiles

| Profile | Description | VistA Source |
|---------|-------------|--------------|
| [EMIPatient](StructureDefinition-emi-patient.html) | VA patient with ICN/EDIPI identifiers | File 2 |
| [EMIAllergyIntolerance](StructureDefinition-emi-allergyintolerance.html) | Allergy/adverse reaction | File 120.8 |
| [EMIOutpatientMedicationRequest](StructureDefinition-emi-outpatient-medicationrequest.html) | Outpatient prescription | File 52 |
| [EMIUnitDoseMedicationRequest](StructureDefinition-emi-unitdose-medicationrequest.html) | Inpatient unit dose medication | File 55.06 |
| [EMIIVMedicationRequest](StructureDefinition-emi-iv-medicationrequest.html) | Inpatient IV medication | File 55.01 |
| [EMINonVAMedicationStatement](StructureDefinition-emi-nonva-medicationstatement.html) | Non-VA medication | File 55.05 |
| [EMIMedicationDispense](StructureDefinition-emi-medicationdispense.html) | Medication dispense event | File 52 refills |
| [EMIPharmacyOrganization](StructureDefinition-emi-pharmacy-organization.html) | Dispensing pharmacy | Institution data |
| [EMIMedicationCounselingObservation](StructureDefinition-emi-medication-counseling-observation.html) | Counseling status | File 52 fields 41, 42 |
| [EMIAllergyList](StructureDefinition-emi-allergy-list.html) | Patient allergy list | - |
| [EMIMedicationList](StructureDefinition-emi-medication-list.html) | Patient medication list | - |
| [EMIMedicationBundle](StructureDefinition-emi-medication-bundle.html) | Response bundle | - |
| [EMIRequestParameters](StructureDefinition-emi-request-parameters.html) | Operation input parameters | - |

### Operation

The [$medication-list](OperationDefinition-medication-list.html) operation retrieves a patient's complete essential medication information as a Bundle.

### Background

This implementation guide is informed by:

- **VHA Directive 1164** (July 13, 2023) - Establishes standards for medication information given to patients, caregivers, and health care providers
- **The Joint Commission NPSG 03.06.01** - Maintain and Communicate Accurate Patient Medication Information

### Authors

Department of Veterans Affairs / Pharmacy Benefits Management Services (VA/PBM)
