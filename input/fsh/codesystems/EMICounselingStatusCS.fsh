CodeSystem: EMICounselingStatusCS
Id: emi-counseling-status
Title: "EMI Counseling Status Code System"
Description: "Code system for medication counseling status values used in EMI counseling observations."

* ^status = #active
* ^caseSensitive = true
* ^content = #complete

// Component codes (for identifying the component type)
* #was-counseled "Was Patient Counseled" "Indicates whether the patient was counseled on the medication."
* #was-understood "Was Counseling Understood" "Indicates whether the patient demonstrated understanding of the counseling."

// Value codes
* #yes "Yes" "The patient was counseled or demonstrated understanding."
* #no "No" "The patient was not counseled or did not demonstrate understanding."
* #not-applicable "Not Applicable" "Counseling status is not applicable to this situation."
* #refused "Refused" "The patient refused counseling."
* #unknown "Unknown" "Counseling status is unknown."
