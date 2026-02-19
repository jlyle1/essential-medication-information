Instance: allergy-penicillin-example
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "EMI Allergy Example - Penicillin"
Description: "Example of a penicillin allergy with rash reaction."

* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* type = #allergy
* category[+] = #medication

* code = $RxNorm#7984 "Penicillin V"
* code.text = "Penicillin"

* patient = Reference(patient-example)

* reaction[+].manifestation[+] = $SCT#271807003 "Eruption of skin"
* reaction[=].manifestation[=].text = "Rash"
* reaction[=].severity = #moderate

Instance: allergy-nsaid-example
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "EMI Allergy Example - NSAID Intolerance"
Description: "Example of an NSAID intolerance with GI upset."

* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* type = #intolerance
* category[+] = #medication

* code = $RxNorm#850789 "Ibuprofen"
* code.text = "Ibuprofen"

* patient = Reference(patient-example)

* reaction[+].manifestation[+] = $SCT#422587007 "Nausea"
* reaction[=].manifestation[=].text = "GI upset"
* reaction[=].severity = #mild
