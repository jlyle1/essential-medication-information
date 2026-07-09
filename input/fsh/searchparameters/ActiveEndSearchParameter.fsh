Instance: active-end
InstanceOf: SearchParameter
Usage: #definition
Title: "MedicationRequest Active End Date"
Description: "Search MedicationRequest by the date the prescription ended (either expiration date or cancellation date). This enables server-side filtering for status horizon queries."

* status = #active
* code = #active-end
* name = "ActiveEnd"
* base = #MedicationRequest
* type = #date
* expression = "MedicationRequest.dispenseRequest.validityPeriod.end | MedicationRequest.extension('http://va.gov/fhir/emi/StructureDefinition/medicationrequest-cancelDate').value"
* comparator[+] = #eq
* comparator[+] = #gt
* comparator[+] = #lt
* comparator[+] = #ge
* comparator[+] = #le
* comparator[+] = #sa
* comparator[+] = #eb
* purpose = "Allows querying for prescriptions that ended (expired or were cancelled) within a specific date range, supporting VHA Directive 1164 status horizon requirements."
