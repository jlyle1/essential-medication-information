Profile: EMIPharmacyOrganization
Parent: Organization
Id: emi-pharmacy-organization
Title: "EMI Pharmacy Organization"
Description: "Pharmacy organization profile for Essential Medication Information, capturing pharmacy name, address, and phone."

* ^status = #active
* ^version = "1.0.0"

// Name required
* name 1..1 MS
* name ^short = "Pharmacy name"
* name ^definition = "The name of the dispensing pharmacy."

// Type - pharmacy
* type MS
* type ^slicing.discriminator.type = #pattern
* type ^slicing.discriminator.path = "$this"
* type ^slicing.rules = #open
* type contains pharmacy 0..1 MS
* type[pharmacy] = $V3ActCode#OUTPHARM
* type[pharmacy] ^short = "Outpatient pharmacy"

// Address required
* address 1..* MS
* address ^short = "Pharmacy address"
* address.line MS
* address.city MS
* address.state MS
* address.postalCode MS

// Phone required
* telecom 1..* MS
* telecom ^slicing.discriminator.type = #pattern
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom contains phone 1..* MS
* telecom[phone].system = #phone (exactly)
* telecom[phone].value 1..1 MS
* telecom[phone] ^short = "Pharmacy phone number"

// Active status
* active MS
* active ^short = "Whether pharmacy is active"

// Mappings to VistA
Mapping: VistAPharmacy
Id: vista-pharmacy
Title: "VistA Pharmacy Data"
Source: EMIPharmacyOrganization
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-pharmacy"

* name -> "Pharmacy name from institution file or File 52 Field 2"
* address -> "Institution address data"
* telecom[phone] -> "Pharmacy phone from institution file"
