Instance: request-parameters-example
InstanceOf: EMIRequestParameters
Usage: #example
Title: "EMI Request Parameters Example"
Description: "Example of parameters for the $medication-list operation request."

* parameter[patient].name = "patient"
* parameter[patient].valueIdentifier.system = "urn:oid:2.16.840.1.113883.4.349"
* parameter[patient].valueIdentifier.value = "1012345678V123456"

* parameter[statusHorizonDuration].name = "statusHorizonDuration"
* parameter[statusHorizonDuration].valueDuration.value = 180
* parameter[statusHorizonDuration].valueDuration.unit = "days"
* parameter[statusHorizonDuration].valueDuration.system = "http://unitsofmeasure.org"
* parameter[statusHorizonDuration].valueDuration.code = #d

* parameter[includeDispenses].name = "includeDispenses"
* parameter[includeDispenses].valueBoolean = true

* parameter[includeCounseling].name = "includeCounseling"
* parameter[includeCounseling].valueBoolean = true

Instance: request-parameters-minimal-example
InstanceOf: EMIRequestParameters
Usage: #example
Title: "EMI Request Parameters - Minimal"
Description: "Example of minimal parameters for the $medication-list operation."

* parameter[patient].name = "patient"
* parameter[patient].valueReference.reference = "Patient/12345"
