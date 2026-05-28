Instance: test4-allergy-penicillin
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test 4 - Allergy Example - Penicillin"
Description: "Example of a penicillin allergy with rash reaction."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* type = #allergy
* category[+] = #medication

* code = $RxNorm#7984 "Penicillin V"
* code.text = "Penicillin"

* patient = Reference(test4-patient)

* reaction[+].manifestation[+] = $SCT#271807003 "Eruption of skin"
* reaction[=].manifestation[=].text = "Rash"
* reaction[=].severity = #moderate

Instance: test4-allergy-nsaid
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test 4 - Allergy Example - NSAID Intolerance (Missing Reaction)"
Description: "Example of an NSAID intolerance WITHOUT reaction details - common data gap."

* meta.source = "http://va.gov/fhir/sid/sta3n/520"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* type = #intolerance
* category[+] = #medication

* code = $RxNorm#5640 "Ibuprofen"
* code.text = "Ibuprofen"

* patient = Reference(test4-patient)

// QUALITY GAP: No reaction.manifestation - triggers emi-allergy-2 warning