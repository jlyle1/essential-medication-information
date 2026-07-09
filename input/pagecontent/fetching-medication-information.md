### Fetching Essential Medication Information

This page provides guidance on retrieving essential medication information for patient care using standard RESTful FHIR queries. These patterns support varying server capabilities and use cases aligned with VHA Directive 1164.

A server may implement the Operation defined in this guide to provide the same functionality.

#### Background

This guidance defines standard query patterns that
- Use only standard FHIR search parameters for maximum interoperability
- Support graceful degradation based on server capabilities
- Enable client-side processing when needed
- Align with US Core query patterns where applicable

---

### Query Patterns

Essential medication information includes two categories:
1. **Active medications** - prescriptions with `status=active`
2. **Recently inactive medications** - prescriptions that were cancelled, expired, or completed within a defined status horizon (typically 90-180 days per VHA Directive 1164)

#### Query 1: Active Medications

Retrieve all currently active prescriptions:

```
GET [base]/MedicationRequest?patient=[id]
    &status=active
    &_include=MedicationRequest:medication
```

#### Query 2: Recently Inactive Medications (Status Horizon)

Recently inactive medications require retrieving non-active prescriptions and filtering by expiration or cancellation date.

**Option A: Server-side filtering using `active-end` search parameter**

Servers implementing EMI profiles **SHOULD** support the [`active-end`](SearchParameter-active-end.html) search parameter, which queries by either `dispenseRequest.validityPeriod.end` (expiration date) or `cancelDate` extension value.

```
GET [base]/MedicationRequest?patient=[id]
    &status=completed,cancelled,stopped,on-hold
    &active-end=ge[status-horizon-date]
    &_include=MedicationRequest:medication
```

**Example:** Prescriptions that ended within the last 180 days (status horizon date = 180 days ago)
```
GET /MedicationRequest?patient=Patient/123
    &status=completed,cancelled,stopped,on-hold
    &active-end=ge2026-01-10
    &_include=MedicationRequest:medication
```

**Option B: Client-side filtering (fallback)**

If the server does not support the `active-end` search parameter:

```
GET [base]/MedicationRequest?patient=[id]
    &status=completed,cancelled,stopped,on-hold
    &_include=MedicationRequest:medication
```

Client then filters results based on:
- `dispenseRequest.validityPeriod.end` (expiration date) within status horizon, OR
- `cancelDate` extension value within status horizon

---

### Server Capability Scenarios

#### Scenario 1: Server Supports EMI Extensions (Optimal)

When the server supports EMI profiles with `dateLastDispensed` and `remainingFills` extensions, clients can retrieve summary information efficiently without fetching all dispense records.

**Query Pattern:**
```
GET [base]/MedicationRequest?patient=[id]
    &status=active
    &_include=MedicationRequest:medication
```

**Expected Behavior:**
- Server returns `EMIFinishedPrescriptions` or `EMIActivePrescriptions` resources with extensions populated
- `dateLastDispensed` extension provides last dispense date
- `remainingFills` extension provides current refill count
- `validityPeriod.end` provides expiration date
- Client has complete essential information without additional queries

---

#### Scenario 2: Server Without EMI Extensions (Fallback)

When the server does not support EMI extensions, clients must retrieve dispense records separately to determine last dispense dates and calculate remaining fills.

**Query Pattern:**
```
GET [base]/MedicationRequest?patient=[id]
    &status=active
    &_include=MedicationRequest:medication
    &_revinclude=MedicationDispense:prescription
```

Using `_revinclude=MedicationDispense:prescription` returns dispenses only for the identified prescriptions in a single query.

**Client Processing Required:**
- Determine most recent dispense per prescription from `whenHandedOver` dates
- Calculate remaining fills: `numberOfRepeatsAllowed - count(dispenses)`

**Note:** Servers are encouraged to implement EMI profiles to provide pre-calculated dispense summary data.

---

### Retrieving Complete Medication Information

For a complete medication review including allergies, medications, and related resources, clients can combine multiple queries or use the `$essential-medication-information-for-review` Operation if supported.

#### Option 1: Multiple RESTful Queries

```
# Step 1: Get patient allergies
GET [base]/AllergyIntolerance?patient=[id]
    &clinical-status=active,inactive

# Step 2: Get active medications (with dispenses if extensions not available)
GET [base]/MedicationRequest?patient=[id]
    &status=active
    &_include=MedicationRequest:medication
    &_revinclude=MedicationDispense:prescription

# Step 3: Get recently inactive medications (client filters by date)
GET [base]/MedicationRequest?patient=[id]
    &status=completed,cancelled,stopped,on-hold
    &_include=MedicationRequest:medication
    &_revinclude=MedicationDispense:prescription
```

#### Option 2: Using the Operation (if supported)

```
POST [base]/Patient/[id]/$essential-medication-information-for-review
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "statusHorizonDuration",
      "valueDuration": {
        "value": 180,
        "unit": "days",
        "system": "http://unitsofmeasure.org",
        "code": "d"
      }
    },
    {
      "name": "includeDispenses",
      "valueBoolean": true
    }
  ]
}
```

**Returns:** A Bundle of type `collection` conforming to `EMIMedicationBundle` with all related resources.

**Note on Bundle Types:** RESTful search queries return Bundles of type `searchset`, while the Operation returns a Bundle of type `collection`. These are distinct bundle types and do not conflict.

**Guidance:** Systems **SHALL** support the RESTful query patterns. Systems **MAY** additionally support the `$essential-medication-information-for-review` Operation as a convenience wrapper.

---

### Implementation Considerations

#### Server Responsibilities

1. **Minimum Support:**
   - **SHALL** support `MedicationRequest` queries with `patient`, `status`, and `_include=MedicationRequest:medication`
   - **SHALL** support `MedicationDispense` queries with `prescription.patient` and `status`

2. **Optimal Support:**
   - **SHOULD** support EMI profiles (`EMIFinishedPrescriptions`, `EMIActivePrescriptions`)
   - **SHOULD** populate `dateLastDispensed` and `remainingFills` extensions to minimize dispense queries
   - **SHOULD** support the [`active-end`](SearchParameter-active-end.html) search parameter for status horizon queries
   - **MAY** support `$essential-medication-information-for-review` Operation

#### Client Responsibilities

1. **Capability Detection:**
   - Query server's CapabilityStatement to detect supported profiles and search parameters
   - Check for `active-end` search parameter support for efficient status horizon queries
   - Select appropriate query pattern based on server capabilities

2. **Data Processing:**
   - When EMI extensions unavailable, calculate remaining fills from dispense history
   - Filter recently inactive medications by expiration/cancellation date client-side
   - Implement de-duplication logic if same medication appears multiple times

3. **Error Handling:**
   - Handle cases where dispense history is incomplete or unavailable
   - Gracefully handle servers that return partial results

---

### Future Enhancements

This implementation guide currently focuses on ambulatory (outpatient) medication scenarios. Future versions will address:

- **Inpatient Medications:** Query patterns for active orders and medication administrations
- **Reconciliation:** Patterns for medication reconciliation across care transitions

---

### Examples

#### Example 1: Basic Query for Active Medications

**Request:**
```
GET /MedicationRequest?patient=Patient/test1-patient
    &status=active
    &_include=MedicationRequest:medication
```

**Response:** Bundle (type: searchset) containing:
- MedicationRequest resources with status=active
- Referenced Medication resources (included)
- Extensions with dispense summary (if server supports EMI profiles)

#### Example 2: Complete Medication Review

**Request Sequence:**
```
# Allergies
GET /AllergyIntolerance?patient=Patient/test1-patient
    &clinical-status=active

# Active medications (with dispenses if extensions not available)
GET /MedicationRequest?patient=Patient/test1-patient
    &status=active
    &_include=MedicationRequest:medication
    &_revinclude=MedicationDispense:prescription

# Recently inactive (client filters by expiration/cancel date)
GET /MedicationRequest?patient=Patient/test1-patient
    &status=completed,cancelled,stopped,on-hold
    &_include=MedicationRequest:medication
    &_revinclude=MedicationDispense:prescription
```

**Client combines results** into comprehensive medication review for clinical decision support, filtering recently inactive medications to include only those expired or cancelled within the status horizon period.

---

### Relationship to US Core

These query patterns align with [US Core Medication List guidance](https://hl7.org/fhir/us/core/STU6/medication-list.html), with extensions specific to VA essential medication information requirements:

- **Alignment:** Uses `MedicationRequest` as primary resource with `intent=order,plan`
- **Extension:** Adds dispense summary extensions to reduce query overhead
- **VA-Specific:** Addresses VHA Directive 1164 status horizon requirements
