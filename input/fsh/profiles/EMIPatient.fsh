Profile: EMIPatient
Parent: Patient
Id: emi-patient
Title: "EMI Patient"
Description: "Patient profile for Essential Medication Information, supporting patient identification requirements."

* ^status = #active
* ^version = "1.0.0"

// Source system
* meta.source 1..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Require at least one identifier (ICN or EDIPI)
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on identifier system"

* identifier contains
    ICN 0..1 MS and
    EDIPI 0..1 MS and
    IEN 0..1 MS

* identifier[ICN].system = $ICN (exactly)
* identifier[ICN].value 1..1 MS
* identifier[ICN] ^short = "VA Integration Control Number"
* identifier[ICN] ^definition = "The VA Integration Control Number (ICN) uniquely identifies a patient across VA systems."

* identifier[EDIPI].system = $EDIPI (exactly)
* identifier[EDIPI].value 1..1 MS
* identifier[EDIPI] ^short = "DoD Electronic Data Interchange Personal Identifier"
* identifier[EDIPI] ^definition = "The EDIPI uniquely identifies a patient across DoD systems."

* identifier[IEN].system = $VistAPatientIEN (exactly)
* identifier[IEN].type = $IdentifierType#MR
* identifier[IEN].value 1..1 MS
* identifier[IEN] ^short = "VistA Internal Entry Number"
* identifier[IEN] ^definition = "The VistA Internal Entry Number (IEN) for the patient record at a specific VA facility."

// Name is required by US Core, reinforce for EMI
* name 1..* MS
* name.family 1..1 MS
* name.given 1..* MS

// Date of birth required
* birthDate 1..1 MS
* birthDate ^short = "Patient date of birth"

// Invariant: should have ICN or EDIPI
* obeys emi-pat-1

// Mappings to VistA File 2
Mapping: VistAFile2
Id: vista-file-2
Title: "VistA Patient File (2)"
Source: EMIPatient
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-2"

* identifier[ICN] -> "File 2, Field 991.01 (INTEGRATION CONTROL NUMBER)"
* identifier[IEN] -> "File 2, Field .001 (Internal Entry Number)"
* name -> "File 2, Field .01 (NAME)"
* birthDate -> "File 2, Field .03 (DATE OF BIRTH)"

Invariant: emi-pat-1
Description: "Patient should have an ICN or EDIPI identifier"
Severity: #warning
Expression: "identifier.where(system = 'urn:oid:2.16.840.1.113883.4.349').exists() or identifier.where(system = 'urn:oid:2.16.840.1.113883.3.42.10001.100001.12').exists()"
XPath: "f:identifier[f:system/@value='urn:oid:2.16.840.1.113883.4.349'] or f:identifier[f:system/@value='urn:oid:2.16.840.1.113883.3.42.10001.100001.12']"
