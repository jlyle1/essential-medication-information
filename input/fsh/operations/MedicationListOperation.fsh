Instance: medication-list
InstanceOf: OperationDefinition
Usage: #definition
Title: "EMI Medication List Operation"
Description: "Retrieve a patient's essential medication information including allergies, medications from all sources, dispense history, and counseling status."

* status = #active
* kind = #operation
* name = "MedicationList"
* code = #medication-list
* system = true
* type = false
* instance = false

// Input parameters
* parameter[+].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The patient identifier (ICN or EDIPI) or reference for whom to retrieve medication information."
* parameter[=].type = #string
* parameter[=].searchType = #reference

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

* parameter[+].name = #includeCounseling
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Whether to include medication counseling observation resources. Default is true."
* parameter[=].type = #boolean

* parameter[+].name = #includeSources
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "Filter to specific medication sources (local-va, remote-va, non-va, etc.). If not specified, all sources are included."
* parameter[=].type = #code
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = Canonical(EMIMedicationSourceVS)

// Output parameter
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A Bundle containing the patient, allergy list, medication list, and all referenced resources (individual allergies, medications, dispenses, counseling observations, pharmacies, and practitioners)."
* parameter[=].type = #Bundle
