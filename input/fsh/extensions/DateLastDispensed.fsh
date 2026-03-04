Extension: DateLastDispensed
Id: emi-date-last-dispensed
Title: "Date Last Dispensed"
Description: "The date the medication was last dispensed or released to the patient. Use this extension on MedicationRequest or MedicationStatement when dispense history needs to be conveyed without a separate MedicationDispense resource. If the medication has not yet been dispensed, use the data-absent-reason extension with code 'not-performed'."

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
* valueDateTime 0..1
* valueDateTime ^short = "Last released/dispensed date"
* valueDateTime ^definition = "The date the medication was last dispensed or released to the patient."
* valueDateTime.extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named dataAbsentReason 0..1
* valueDateTime.extension[dataAbsentReason] ^short = "Use 'not-performed' if not yet dispensed"
* valueDateTime ^mapping[0].identity = "vista-file-52"
* valueDateTime ^mapping[0].map = "File 52, Sub-file 52.1 (REFILL) last fill date or Field 22 (FILL DATE)"
