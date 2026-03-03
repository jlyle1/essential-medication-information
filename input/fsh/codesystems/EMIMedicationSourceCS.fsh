CodeSystem: EMIMedicationSourceCS
Id: emi-medication-source
Title: "EMI Medication Source Code System"
Description: "Code system identifying the source of a medication entry (local VA, remote VA, external, pending, etc.)."

* ^status = #active
* ^caseSensitive = true
* ^content = #complete

* #local-va "Local VA" "Medication ordered and dispensed by the treating VA facility."
* #remote-va "Remote VA" "Medication ordered and dispensed from another VA facility."
* #dod "DoD" "Medication from a Department of Defense facility."
* #external "External" "Medication from outside the VA system, including OTC, herbal, community pharmacy."
* #pending "Pending" "Medication order is pending."
* #outpatient "Outpatient" "Outpatient prescription medication."
* #inpatient-ud "Inpatient Unit Dose" "Inpatient unit dose medication."
* #inpatient-iv "Inpatient IV" "Inpatient IV medication."
