Profile: EMIPatient
Parent: $USCorePatient
Id: emi-patient
Title: "EMI Patient"
Description: "Patient profile for Essential Medication Information, supporting VA patient identification requirements."

* ^status = #active
* ^version = "1.0.0"

// Require at least one identifier (ICN or EDIPI)
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on identifier system"

* identifier contains
    ICN 0..1 MS and
    EDIPI 0..1 MS

* identifier[ICN].system = $ICN (exactly)
* identifier[ICN].value 1..1 MS
* identifier[ICN] ^short = "VA Integration Control Number"
* identifier[ICN] ^definition = "The VA Integration Control Number (ICN) uniquely identifies a patient across VA systems."

* identifier[EDIPI].system = $EDIPI (exactly)
* identifier[EDIPI].value 1..1 MS
* identifier[EDIPI] ^short = "DoD Electronic Data Interchange Personal Identifier"
* identifier[EDIPI] ^definition = "The EDIPI uniquely identifies a patient across DoD systems."

// Name is required by US Core, reinforce for EMI
* name 1..* MS
* name.family 1..1 MS
* name.given 1..* MS

// Date of birth required
* birthDate 1..1 MS
* birthDate ^short = "Patient date of birth"

// Mappings to VistA File 2
Mapping: VistAFile2
Id: vista-file-2
Title: "VistA Patient File (2)"
Source: EMIPatient
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-2"

* identifier[ICN] -> "File 2, Field 991.01 (INTEGRATION CONTROL NUMBER)"
* name -> "File 2, Field .01 (NAME)"
* birthDate -> "File 2, Field .03 (DATE OF BIRTH)"
