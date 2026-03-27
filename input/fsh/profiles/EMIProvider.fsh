Profile: EMIPractitioner
Parent: Practitioner
Id: emi-practitioner
Title: "EMI Practitioner"
Description: "Practitioner profile for Essential Medication Information, representing prescribers and other healthcare providers."

* ^status = #active
* ^version = "1.0.0"

// Invariants
* obeys emi-prov-1
* obeys emi-prov-2

// Source system
* meta.source 0..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Name required with family and given
* name 1..* MS
* name.family 1..1 MS
* name.family ^short = "Provider last name"
* name.given 1..* MS
* name.given ^short = "Provider first name"

// Credential/qualification
* qualification MS
* qualification.code MS
* qualification.code ^short = "Provider credential (e.g., MD, DO, NP, PA)"

// Invariants
Invariant: emi-prov-1
Severity: #warning
Description: "meta.source SHOULD be populated to identify the originating system for provider data"
Expression: "meta.source.exists()"

Invariant: emi-prov-2
Severity: #warning
Description: "qualification SHOULD be populated to indicate provider credentials"
Expression: "qualification.exists()"