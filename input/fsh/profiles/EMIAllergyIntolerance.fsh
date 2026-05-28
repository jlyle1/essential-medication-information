Profile: EMIAllergyIntolerance
Parent: AllergyIntolerance
Id: emi-allergyintolerance
Title: "EMI AllergyIntolerance"
Description: "Allergy/adverse reaction profile for Essential Medication Information, capturing substance and reaction information from VistA."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Invariants
* obeys emi-allergy-1
* obeys emi-allergy-2

// Source system
* meta.source 0..1 MS
* meta.source ^short = "Source system (sta3n for VA)"
* meta.source ^definition = "URI identifying the source system. For VA, use format http://va.gov/fhir/sid/sta3n/{sta3n} (e.g., http://va.gov/fhir/sid/sta3n/520)."

// Patient reference required
* patient only Reference(EMIPatient)
* patient MS

// Code/substance is required - the reactant
* code 1..1 MS
* code ^short = "Allergy/adverse reaction substance"
* code ^definition = "The substance that causes the allergic or adverse reaction."

// Reaction information
* reaction MS
* reaction ^short = "Adverse reaction events"
* reaction.manifestation 1..* MS
* reaction.manifestation ^short = "Clinical symptoms/signs"
* reaction.manifestation ^definition = "Clinical symptoms or signs of the reaction (e.g., rash, hives, anaphylaxis)."

// Clinical status recommended
* clinicalStatus MS
* clinicalStatus ^short = "active | inactive | resolved"

// Verification status
* verificationStatus MS

// Mappings to VistA File 120.8
Mapping: VistAFile120-8
Id: vista-file-120-8
Title: "VistA Allergy File (120.8)"
Source: EMIAllergyIntolerance
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-120-8"

* code -> "File 120.8, Field .02 (REACTANT) or Field 1 (GMR ALLERGY)"
* reaction.manifestation -> "File 120.8, Field 10 (REACTIONS sub-file 120.81)"
* clinicalStatus -> "File 120.8, Field 5 (HISTORICAL/OBSERVED) combined with context"
* verificationStatus -> "File 120.8, Field 6 (MECHANISM) and verification context"

// Invariants
Invariant: emi-allergy-1
Severity: #warning
Description: "meta.source SHOULD be populated to identify the originating system for allergy data"
Expression: "meta.source.exists()"

Invariant: emi-allergy-2
Severity: #warning
Description: "reaction.manifestation SHOULD be populated when code is not in the Allergy Refutation value set"
Expression: "code.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1186.5').not() implies reaction.manifestation.exists()"
