Profile: EMIRequestParameters
Parent: Parameters
Id: emi-request-parameters
Title: "EMI Request Parameters"
Description: "Parameters profile for the $essential-medication-information-for-review operation input, including patient identifier and status horizon duration."

* ^status = #active
* ^experimental = true
* ^version = "1.0.0"

// Parameters slicing
* parameter 1..* MS
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open

* parameter contains
    patient 1..1 MS and
    statusHorizonDuration 0..1 MS and
    includeDispenses 0..1 MS

// Patient identifier parameter
* parameter[patient].name = "patient" (exactly)
* parameter[patient].value[x] only Identifier
* parameter[patient] ^short = "Patient identifier (ICN or EDIPI)"
* parameter[patient] ^definition = "The patient for whom to retrieve medication information, identified by ICN or EDIPI. Identifier-based lookup supports cross-system requests where the caller does not know the server's Patient resource id."

// Status horizon duration - for determining discontinued/expired lookback
* parameter[statusHorizonDuration].name = "statusHorizonDuration" (exactly)
* parameter[statusHorizonDuration].value[x] only Duration
* parameter[statusHorizonDuration].valueDuration ^short = "Status horizon (e.g., 90-180 days)"
* parameter[statusHorizonDuration] ^definition = "The time window for including recently discontinued or expired medications. Per VHA Directive 1164, typically 90-180 days."

// Include dispenses flag
* parameter[includeDispenses].name = "includeDispenses" (exactly)
* parameter[includeDispenses].value[x] only boolean
* parameter[includeDispenses] ^short = "Include dispense information"
* parameter[includeDispenses] ^definition = "Whether to include MedicationDispense resources with last released date."
