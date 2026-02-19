Profile: EMIAllergyIntolerance
Parent: $USCoreAllergyIntolerance
Id: emi-allergyintolerance
Title: "EMI AllergyIntolerance"
Description: "Allergy/adverse reaction profile for Essential Medication Information, capturing substance and reaction information from VistA."

* ^status = #active
* ^version = "1.0.0"

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

// Type (allergy vs intolerance)
* type MS
* type ^short = "allergy | intolerance"

// Mappings to VistA File 120.8
Mapping: VistAFile120-8
Id: vista-file-120-8
Title: "VistA Allergy File (120.8)"
Source: EMIAllergyIntolerance
Target: "http://va.gov/fhir/emi/StructureDefinition/vista-file-120-8"

* code -> "File 120.8, Field .02 (REACTANT) or Field 1 (GMR ALLERGY)"
* reaction.manifestation -> "File 120.8, Field 10 (REACTIONS sub-file 120.81)"
* type -> "File 120.8, Field 3.1 (ALLERGY TYPE)"
* clinicalStatus -> "File 120.8, Field 5 (HISTORICAL/OBSERVED) combined with context"
* verificationStatus -> "File 120.8, Field 6 (MECHANISM) and verification context"
