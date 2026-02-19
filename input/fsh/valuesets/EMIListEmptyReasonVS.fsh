ValueSet: EMIListEmptyReasonVS
Id: emi-list-empty-reason-vs
Title: "EMI List Empty Reason Value Set"
Description: "Value set for reasons why an allergy or medication list may be empty."

* ^status = #active

// From standard list-empty-reason
* $ListEmptyReason#nilknown "Nil Known"
* $ListEmptyReason#notasked "Not Asked"
* $ListEmptyReason#withheld "Information Withheld"
* $ListEmptyReason#unavailable "Unavailable"
* $ListEmptyReason#notstarted "Not Started"
* $ListEmptyReason#closed "Closed"
