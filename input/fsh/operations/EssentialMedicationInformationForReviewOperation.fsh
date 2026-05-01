Instance: essential-medication-information-for-review
InstanceOf: OperationDefinition
Usage: #definition
Title: "Essential Medication Information for Review Operation"
Description: "Retrieve a patient's essential medication information including allergies, medications from all sources, and dispense history."

* status = #active
* kind = #operation
* name = "EssentialMedicationInformationForReview"
* code = #essential-medication-information-for-review
* resource = #Patient
* system = false
* type = false
* instance = true

// Input parameters
* parameter[+].name = #statusHorizonDuration
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The time window for including recently discontinued or expired medications. Per VHA Directive 1164, typically 90-180 days. Default is 180 days if not specified."
* parameter[=].type = #Duration

* parameter[+].name = #includeDispenses
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Whether to include MedicationDispense resources with last released date. Default is true."
* parameter[=].type = #boolean

* parameter[+].name = #includeSources
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "Filter to specific medication sources (local-va, remote-va, external, etc.). If not specified, all sources are included."
* parameter[=].type = #code
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = Canonical(EMIMedicationSourceVS)

// Output parameter
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A Bundle containing the patient, allergy list, medication list, and all referenced resources (individual allergies, medications, dispenses, pharmacies, and practitioners)."
* parameter[=].type = #Bundle
* parameter[=].targetProfile = Canonical(EMIMedicationBundle)
