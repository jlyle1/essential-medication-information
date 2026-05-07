Instance: test3-nka
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test 3 - No Known Allergies"
Description: "Example of No Known Allergies (NKA) assertion."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed

* code = $SCT#716186003 "No known allergy"
* code.text = "No Known Allergies"

* patient = Reference(test3-patient)
