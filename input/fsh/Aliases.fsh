// Base FHIR Resources (US Core dependency removed)

// Terminology
Alias: $RxNorm = http://www.nlm.nih.gov/research/umls/rxnorm
Alias: $NDC = http://hl7.org/fhir/sid/ndc
Alias: $SCT = http://snomed.info/sct
Alias: $LOINC = http://loinc.org
Alias: $UCUM = http://unitsofmeasure.org

// Identifier Systems
Alias: $ICN = urn:oid:2.16.840.1.113883.4.349
Alias: $EDIPI = urn:oid:2.16.840.1.113883.3.42.10001.100001.12
Alias: $VistAPatientIEN = http://va.gov/fhir/sid/648/2-.001
Alias: $VistARxNumber = http://va.gov/fhir/sid/648/52-.01
Alias: $VistAUnitDoseOrderNumber = http://va.gov/fhir/sid/648/55.06-.001
Alias: $VistAIVOrderNumber = http://va.gov/fhir/sid/648/55.01-.001
Alias: $IdentifierType = http://terminology.hl7.org/CodeSystem/v2-0203

// FHIR Core Extensions
Alias: $AlternateCodes = http://hl7.org/fhir/StructureDefinition/alternate-codes

// FHIR Core
Alias: $ObservationCategory = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $MedicationRequestCategory = http://terminology.hl7.org/CodeSystem/medicationrequest-category
Alias: $MedicationStatementCategory = http://terminology.hl7.org/CodeSystem/medication-statement-category
Alias: $ListEmptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason
Alias: $V3ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $V3RoleCode = http://terminology.hl7.org/CodeSystem/v3-RoleCode

// EMI-specific
Alias: $EMIMedicationSource = http://va.gov/fhir/emi/CodeSystem/medication-source
Alias: $DateLastDispensed = http://va.gov/fhir/emi/StructureDefinition/medicationrequest-dateLastDispensed
Alias: $RemainingFills = http://va.gov/fhir/emi/StructureDefinition/medicationrequest-refillsRemaining
