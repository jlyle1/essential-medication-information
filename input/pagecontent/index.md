### Essential Medication Information Implementation Guide

This implementation guide defines FHIR profiles and an operation for exchanging essential medication information to support patient care in healthcare settings provided or funded by the Veterans Administration.

The purpose of this payload is to exchange known information between systems and to providers for evaluation, e.g., as input to history-taking and medication reconciliation. 

The foundation of this specification is [VHA Directive 1164, Essential Medication Information](https://www.va.gov/vhapublications/ViewPublication.asp?pub_ID=11372), though it does not support many of the patient-facing requirements of that policy such as refill instructions, space for notes, or a glossary of terms.

### Scope

#### Data
This guide is compatible with the US Core FHIR profiles, but it does not inherit constraints from the US Core IG. The Patient and Allergy profiles in US Core include specifications beyond the interest of the EIM domain. Implementers may choose to add these capabilities to exising US-Core-conformant capabilities or to provide a purpose-built interface for EMI.

This IG supports querying for essential medication information, including:

| Category | Data Element | Scope |
|:----------------|:----------------|:----------------|
| Patient | Name | Patient |
| Patient | Date of birth | Patient |
| Patient | Identifiers (ICN, EDIPI) | Patient |
| Allergy | Substance | Allergy |
| Allergy | Reaction | Allergy |
| Medication | Drug name with form and strength| All Meds |
| Medication | Sig | All Meds but IV |
| Medication | Status | All Meds |
| Medication | Source (Outpatient, Inpatient, Reported) | All Meds |
| Dispense | Last released date | Outpatient |
| Dispense | Quantity | Outpatient |
| Dispense | Remaining fills | Outpatient |
| Dispense | Pharmacy | Outpatient |
| Counseling | Counseling provided | Outpatient |
| Counseling | Patient understanding demonstrated | Outpatient |

### Operation

The guide defines the [$essential-medication-information-for-review](OperationDefinition-essential-medication-information-for-review.html) operation to retrieve a patient's complete essential medication information as a Bundle. This operation is defined as a FHIR Restful operation on the Patient resource.

It may be necessary to iterate or federate queries, e.g., in a network, or if multiple external partners are known. For that case, a system-level Operation may be more flexible. That use case, and the reconciliation of versions it may require, are not addressed here. 

Servers supporting federation may wish to advertise asynchronous operation in CapabilityStatement, and even in a Presumptive Error 412 Precondition Failed with a suggestion to try respond-async.

### Levels of constraint
There are several tactics for indicating that a given data element is desired. 
1. Cardinality: Elements may be made mandatory with a minimum cardinality of 1. Implementers with incomplete records may send null values, but not for some coded types.
2. Invariant-error: Invariants can be constructed to prohibit, e.g., sending null values.
3. Invariant-warning: Invariants can be constructed to notify senders and receivers about divergences from expectations.
4. Must-Support: Implementers are expected to send the data if available. This option can only be tested with explicit test scripts; it cannot be enforced at runtime.
5. PIQI: The Patient Information Quality Initiative defines tools and processes for assessing and sharing quality data for specific scenarios.

We avoid tactics 1 & 2 as potentially filtering clinically significant information. We adopt 3, 4, and 5 in a layered approach to maximize the visibility of our requirements.

### Example data
Test Patient 1: manually constructed
Test Patient 2: derived from a VistA test patient
Test Patient 3: constructed to exhibit a perfect PIQI score

### Background

This implementation guide is informed by:

- **VHA Directive 1164** (July 13, 2023) - Establishes standards for medication information given to patients, caregivers, and health care providers
- **The Joint Commission NPSG 03.06.01** - Maintain and Communicate Accurate Patient Medication Information

### Authors

Department of Veterans Affairs / Pharmacy Benefits Management Services (VA/PBM) & Knowledge-Based Systems (VA/KBS)
