Profile: EMIRequestParameters
Parent: Parameters
Id: emi-request-parameters
Title: "EMI Request Parameters"
Description: "Parameters profile for the $medication-list operation input, including patient identifier and status horizon duration."

* ^status = #active
* ^version = "1.0.0"

// Parameters slicing
* parameter 1..* MS
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open

* parameter contains
    patient 1..1 MS and
    statusHorizonDuration 0..1 MS and
    includeDispenses 0..1 MS and
    includeCounseling 0..1 MS

// Patient identifier parameter
* parameter[patient].name = "patient" (exactly)
* parameter[patient].value[x] only Identifier or Reference
* parameter[patient] ^short = "Patient identifier or reference"
* parameter[patient] ^definition = "The patient for whom to retrieve medication information. Can be an ICN, EDIPI, or direct reference."

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

// Include counseling flag
* parameter[includeCounseling].name = "includeCounseling" (exactly)
* parameter[includeCounseling].value[x] only boolean
* parameter[includeCounseling] ^short = "Include counseling observations"
* parameter[includeCounseling] ^definition = "Whether to include medication counseling observation resources."
