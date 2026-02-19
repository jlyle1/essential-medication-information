# Essential Medication Information Project Context

## Domain: HL7 FHIR Healthcare Interoperability

This project involves HL7 FHIR implementation guides and healthcare data standards focused on essential medication information. When answering questions, assume familiarity with:

### Core Specifications
- **FHIR R4** (v4.0.1) - https://hl7.org/fhir/R4/
- **US Core STU6** - https://hl7.org/fhir/us/core/STU6/
- **SMART App Launch** - https://hl7.org/fhir/smart-app-launch/
- **Bulk FHIR (Bulk Data Access)** - https://build.fhir.org/ig/HL7/bulk-data/

### Key FHIR Resources for This Project
- Medication, MedicationStatement, MedicationRequest
- MedicationAdministration, MedicationDispense
- MedicationKnowledge, DocumentReference
- Patient, Practitioner, Organization

### Medication-Related Specifications
- **FHIR Medication Resources** - https://hl7.org/fhir/R4/medication-module.html
- **US Core MedicationRequest** - https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html
- **RxNorm Terminology** - https://www.nlm.nih.gov/research/umls/rxnorm/
- **NDC (National Drug Code)** - https://www.fda.gov/drugs/drug-approvals-and-databases/national-drug-code-directory

### US Regulatory Context

#### HTI-5 Proposed Rule (December 2025)
Published December 29, 2025. Comment period ends February 27, 2026.

**Key provisions:**
- Removes 34 of 60 certification criteria (~57%), revises 7 others
- Estimated 1.4 million compliance hours saved industry-wide
- Removes document-based exchange (CDA) requirements
- Removes AI model card transparency requirements
- Makes FHIR-only Insights reporting permanent
- Expands information blocking definitions to include "automated and AI-driven processes"
- Removes/narrows exceptions that allowed data blocking via technical or contractual loopholes
- Standards adoption via SVAP (Standards Version Advancement Process) becomes primary path

**Focus:** Redirects certification toward FHIR-based APIs per 21st Century Cures Act mandate.

#### HTI-2 Final Rule (December 2024)
- TEFCA Manner Exception for Information Blocking
- FHIR API Exchange Manner Exception expanded to include advanced FHIR versions via SVAP
- Administrative changes to certification requirements

#### Prior Rules
- **HTI-1** (2024): Established baseline certification criteria, USCDI v3
- **HTI-4** (2025): Electronic prescribing, real-time prescription benefit, prior authorization

### Project-Specific Notes
- This is a FHIR Implementation Guide project
- Uses SUSHI (FSH) for resource definitions
- PlantUML for diagrams in `input/images-source/`
- Focus on defining essential medication information elements for patient care

---

## Project Scope: Database Query Use Case

**This IG supports querying a database for essential medication information.** It does NOT cover in-person encounter elements from VHA Directive 1164 such as:
- Whitespace/notes areas for patient annotations
- Instructions on how to request refills (online, phone, mail)
- Teach Back documentation processes
- Patient education materials

### Data Elements In Scope

#### Patient Elements
| Element | Description |
|---------|-------------|
| Patient DOB | Valid date of birth |
| Patient Name | Valid patient name |
| Patient ID | ICN or EDIPI identifier |
| Allergy/Med List Presence | At least one allergy or empty list reason |
| Med List Presence | At least one medication or empty list reason |

#### Allergy Elements
| Element | Description |
|---------|-------------|
| Allergy Substance | The substance that causes the reaction |
| Allergy Reaction | Reaction manifestation |

#### Medication Elements
| Element | Description |
|---------|-------------|
| Med Source | Rx file, inpatient file, non-VA, or pending |
| Med Name | Drug name |
| Med RxNorm | RxNorm code |
| Med Strength/Form | SBD, BPCK, SCD, GPCK |
| Med Indication | Reason for use |
| Med Sig | Instructions/directions for use |
| Med Rx# | Prescription number |
| Med Status | Active, discontinued, expired, pending, etc. |
| Med Last Released Date | Date last dispensed |
| Med Qty | Quantity dispensed |
| Med Expected Duration | Days supply |
| Med Expiration | Prescription expiration date |
| Med Remaining Refills | Number of refills remaining |
| Med Informed | Patient was informed about medication |
| Med Understood | Patient demonstrated understanding |

#### Prescriber/Pharmacy Elements
| Element | Description |
|---------|-------------|
| Provider Name | Prescriber name |
| Pharmacy Name | Dispensing pharmacy name |
| Pharmacy Address | Dispensing pharmacy address |
| Pharmacy Phone | Dispensing pharmacy phone number |

#### Bundle/List Elements
| Element | Description |
|---------|-------------|
| Effective Date | Date/time the medication list was generated |
| Status Horizon Duration | Time window for status determination (e.g., 90-180 days for discontinued/expired) |
| Source Identifier | Identifier for the data source |

---

## VHA Directive 1164: Essential Medication Information (July 13, 2023)

*Background reference - this project implements a subset of VHA Directive 1164 focused on database query elements.*

This project is informed by VHA Directive 1164, which establishes standards for medication information given to patients, caregivers, and health care providers through print, web, mobile, or point of service applications.

### Related Directives
- **VHA Directive 1345** - Medication Reconciliation (March 9, 2022)
- **VHA Directive 1070** - Adverse Drug Event Reporting and Monitoring (May 15, 2020)

### Essential Medication Information Elements (Program Guide A)

#### All Medication Entries Must Include:
1. **Name of drug**
2. **Strength/dose of drug**
3. **Instructions/Directions for use** (when available, and for an indication on the Problem List)
4. **Notes** - Blank space for patients to write information to help manage medications (indication, description, etc.)

#### Sources of Medication Information:

**Local Active Medications:**
- Medications ordered and administered/dispensed by the treating VA facility
- Listed in the EHR as prescribed and dispensed by the local VA pharmacy

**Remote Medications:**
- Medications ordered and dispensed from any other VA facility
- Department of Defense (DoD) facility medications (when available)

**Non-VA Medications:**
- Non-VA provider prescribed medications filled at non-VA pharmacies
- VA provider prescribed medications filled at non-VA pharmacies
- Sample prescription medications from non-VA providers
- Medications obtained from family or friends
- Herbals, over-the-counter medications, nutraceuticals, and alternative medications not dispensed through VA

#### Prescription Status for Review (Essential Medication List for Review):
- **Local Active Prescriptions**
- **Recently discontinued** (90-180 days)
- **Recently expired** (90-180 days)
- **Pending** (where relevant, e.g., patient seen by multiple providers same day)
- **Non-VA Medications**
- **Remote Medications**

*Note: Recently changed doses may not be reflected in the VA EHR pharmacy orders package immediately and may be found in progress notes.*

### Self-Management Information Requirements
Applications must include:
- How to request medications, how they are received, when to re-order
- How to change addresses or order when on vacation
- Facility contact information for each institution the patient has medications from
- Instructions on patient's role in keeping information maintained/updated
- Documentation of Veteran/caregiver education and understanding (e.g., Teach Back Method)

### Communication Information Requirements

**Patient demographic information:**
1. Full name of patient (VA standards)
2. Full date of birth (VA standards)
3. Other patient identifiers as needed
4. Known patient allergies/adverse drug reactions (ALL/ADR)

**Additional required information:**
- Medication treatment plan
- Facility contact information
- Prescriber and pharmacy information (structured fields or white space)
- Time and date the medication list was printed/published
- Patient-specific factors affecting treatment (caregiver status, cultural/educational considerations, cognitive/physical impairments, pregnancy/lactation, chronic illness)

### Key Definitions from VHA Directive 1164

**Essential Medication Information:** Information that the patient, family, caregiver and health care team needs for successful medication management, relying on standards in content, data file structure, and display standards.

**Medication Lists:** Lists used by patients and staff for:
- Health care team review of patient's medication use, experience, efficacy, and self-management ability
- Sharing medication information at transitions in care
- Assisting patients with medication management and shared clinical decision making

**Medications (per directive):**
- Prescription medications from VA or other providers
- Over-the-counter medications (aspirin, acetaminophen)
- Alternative medications (CBD)
- Herbal medications (gingko)
- Nutraceuticals (multivitamins)
- Sample medications from providers outside VA

**Medication History:** Patient's current and past medication use, experience with medication (efficacy, problems, ALL/ADR, preferences), and trouble managing medications at home. Obtained in discussion with patient/caregiver and recorded in EHR.

**Medication Reconciliation:** Process of ensuring accurate, timely, and complete medication information by:
1. Obtaining medication use information from patient/caregiver/family
2. Comparing to EHR medication information to identify discrepancies
3. Assembling and documenting in EHR
4. Communicating/educating patient and caregivers
5. Communicating between VA and non-VA health care teams at transitions
6. Providing written information on medications at discharge/end of encounter

**Medication Treatment Plan:** List of all medications the patient is meant to take and associated information for successful management, including follow-up, diagnostics, and anticipatory guidance.

**Medication Use:** How a patient is or is not taking a medication, including whether taken other than as prescribed or taking a new medication.

**Patient Generated Data:** All medication data generated by patients and caregivers about medication use, experience, self-management, questions, or information to share with health care team (via paper, patient portal, mobile, digital devices).

**Allergy:** An ADR mediated by an immune response (e.g., rash, hives). Note: Allergies and ADRs are located together in EHR; patients may assume all ADRs are allergies.

**Adverse Drug Reaction (ADR):** A response to a drug which is noxious and unintended, occurring at doses normally used for prophylaxis, diagnosis, therapy, or physiologic function modification.

**Teach Back:** Method defined by AHRQ for determining level of understanding by asking patients to state in their own words what they need to know or do about their health.

### Style Guidance (Program Guide C)

**Medication images disclaimer:** "The image displayed is for identification purposes only and does not mean that is the dose to be taken. IF the medication shown does not match what you are taking then contact your VA Pharmacy."

**If image unavailable:** "Image not available."

### Accreditation Context
This directive supports compliance with **The Joint Commission National Patient Safety Goal (NPSG) 03.06.01**: "Maintain and Communicate Accurate Patient Medication Information" and Element of Performance (EP) 2: "Define the types of medication information to be collected in different settings and patient circumstances."

### Governance
- **Policy Owner:** Office of Pharmacy Benefits Management Services (12PBM)
- **NAPMIS:** National Alliance for Patient Medication Information Management Standards - reviews and approves updates to medication information standards
- **Recertification:** Scheduled on or before last working day of July 2028
