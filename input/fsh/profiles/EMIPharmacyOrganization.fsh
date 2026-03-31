Profile: EMIPharmacyOrganization
Parent: Organization
Id: emi-pharmacy-organization
Title: "EMI Pharmacy Organization"
Description: "Pharmacy organization profile for Essential Medication Information, capturing pharmacy name, address, and phone."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Invariants
* obeys emi-pharm-1
* obeys emi-pharm-2
* obeys emi-pharm-3

// Source system
* meta.source 0..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

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
* type[pharmacy] = $V3RoleCode#OUTPHARM
* type[pharmacy] ^short = "Outpatient pharmacy"

// Address required
* address 0..* MS
* address ^short = "Pharmacy address"
* address.line MS
* address.city MS
* address.state MS
* address.postalCode MS

// Phone required
* telecom 0..* MS
* telecom ^slicing.discriminator.type = #pattern
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom contains phone 0..* MS
* telecom[phone].system = #phone (exactly)
* telecom[phone].value 1..1 MS
* telecom[phone] ^short = "Pharmacy phone number"


// Mappings to VistA
Mapping: VistAPharmacy
Id: vista-pharmacy
Title: "VistA Pharmacy Data"
Source: EMIPharmacyOrganization
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-pharmacy"

* name -> "Pharmacy name from institution file or File 52 Field 2"
* address -> "Institution address data"
* telecom[phone] -> "Pharmacy phone from institution file"

// Invariants
Invariant: emi-pharm-1
Severity: #warning
Description: "meta.source SHOULD be populated to identify the originating system for pharmacy data"
Expression: "meta.source.exists()"

Invariant: emi-pharm-2
Severity: #warning
Description: "address SHOULD be populated to provide pharmacy location"
Expression: "address.exists()"

Invariant: emi-pharm-3
Severity: #warning
Description: "telecom (phone) SHOULD be populated to provide pharmacy contact information"
Expression: "telecom.where(system = 'phone').exists()"
