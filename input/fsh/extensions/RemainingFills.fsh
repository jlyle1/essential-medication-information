Extension: RemainingFills
Id: emi-remaining-fills
Title: "Remaining Fills"
Description: "The number of refills remaining on a prescription. Use this extension on MedicationRequest when the remaining fill count needs to be conveyed separately from the originally authorized number of refills."

* ^status = #active
* ^version = "1.0.0"
* ^mapping[0].identity = "vista-file-52"
* ^mapping[0].uri = "http://va.gov/fhir/emi/StructureDefinition/vista-file-52"
* ^mapping[0].name = "VistA Prescription File (52)"
* ^context[0].type = #element
* ^context[0].expression = "MedicationRequest"

* value[x] only unsignedInt
* valueUnsignedInt 1..1
* valueUnsignedInt ^short = "Number of refills remaining"
* valueUnsignedInt ^definition = "The number of refills remaining on the prescription."
* valueUnsignedInt ^mapping[0].identity = "vista-file-52"
* valueUnsignedInt ^mapping[0].map = "File 52, Field 9 (# OF REFILLS) minus count of Sub-file 52.1 (REFILL) entries"
