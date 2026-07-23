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
* type = true
* instance = false

// Input parameters
* parameter[+].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The patient for whom to retrieve medication information, identified by ICN or EDIPI. Identifier-based lookup supports cross-system requests where the caller does not know the server's Patient resource id."
* parameter[=].type = #Identifier

* parameter[+].name = #statusHorizonDuration
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The time window for including recently discontinued or expired medications. Per VHA Directive 1164, typically 90-180 days. Default is 180 days if not specified. The applied value (including the default when not requested) is echoed in the returned bundle's Parameters entry."
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
* parameter[=].documentation = "A Bundle containing the patient, allergy list, medication list, and all referenced resources (individual allergies, medications, dispenses, pharmacies, and practitioners). The bundle SHOULD include a Parameters entry echoing the request parameters as applied by the server, with defaults filled in (e.g., statusHorizonDuration of 180 days when not requested), so the bundle is self-describing."
* parameter[=].type = #Bundle
* parameter[=].targetProfile = Canonical(EMIMedicationBundle)
