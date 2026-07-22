Extension: RefillsRemaining
Id: medicationrequest-refillsRemaining
Title: "Count of Refills Remaining"
Description: "The number of refills remaining on a prescription. Use this extension on MedicationRequest when the remaining fill count needs to be conveyed explicitly rather than being calculated from authorized number of refills minus count of refills. MedicationDispense context is provide to align with vx130 migration to Oracle Health."

* ^status = #active
* ^version = "1.0.0"
* ^mapping[0].identity = "vista-file-52"
* ^mapping[0].uri = "http://va.gov/fhir/emi/StructureDefinition/vista-file-52"
* ^mapping[0].name = "VistA Prescription File (52)"
* ^context[0].type = #element
* ^context[0].expression = "MedicationRequest"
* ^context[1].type = #element
* ^context[1].expression = "MedicationDispense"

* value[x] only unsignedInt
* valueUnsignedInt 1..1
* valueUnsignedInt ^short = "Number of refills remaining"
* valueUnsignedInt ^definition = "The number of refills remaining on the prescription."
* valueUnsignedInt ^mapping[0].identity = "vista-file-52"
* valueUnsignedInt ^mapping[0].map = "File 52, Field 9 (# OF REFILLS) minus count of Sub-file 52.1 (REFILL) entries"
