Extension: CancelDate
Id: emi-cancel-date
Title: "Cancel Date"
Description: "The date the medication request was cancelled or discontinued. Use this extension on MedicationRequest when the cancellation date needs to be conveyed."

* ^status = #active
* ^version = "1.0.0"
* ^context[0].type = #element
* ^context[0].expression = "MedicationRequest"

* value[x] only dateTime
* valueDateTime 0..1
* valueDateTime ^short = "Cancellation/discontinuation date"
* valueDateTime ^definition = "The date the medication request was cancelled or discontinued."