Extension: DateLastDispensed
Id: emi-date-last-dispensed
Title: "Date Last Dispensed"
Description: "The date the medication was last dispensed or released to the patient. Use this extension on MedicationRequest or MedicationStatement when dispense history needs to be conveyed without a separate MedicationDispense resource."

* ^status = #active
* ^version = "1.0.0"
* ^mapping[0].identity = "vista-file-52"
* ^mapping[0].uri = "http://va.gov/fhir/emi/StructureDefinition/vista-file-52"
* ^mapping[0].name = "VistA Prescription File (52)"
* ^context[0].type = #element
* ^context[0].expression = "MedicationRequest"
* ^context[1].type = #element
* ^context[1].expression = "MedicationStatement"

* value[x] only dateTime
* valueDateTime 1..1
* valueDateTime ^short = "Last released/dispensed date"
* valueDateTime ^definition = "The date the medication was last dispensed or released to the patient."
* valueDateTime ^mapping[0].identity = "vista-file-52"
* valueDateTime ^mapping[0].map = "File 52, Sub-file 52.1 (REFILL) last fill date or Field 22 (FILL DATE)"
