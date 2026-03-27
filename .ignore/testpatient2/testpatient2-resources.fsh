// Test Patient 2 FHIR Resources
// Generated from testPatient.xlsx
// Naming convention: testpatient2-{resourcetype}-{identifier}

// ============================================================================
// PATIENT
// ============================================================================
Instance: testpatient2-patient
InstanceOf: EMIPatient
Usage: #example
Title: "Test Patient - MHVZZTESTVETERAN ONE A"
Description: "Test patient from VistA test data"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* identifier[+].system = $ICN
* identifier[=].value = "9999999999"
* name[+].family = "MHVZZTESTVETERAN"
* name[=].given[+] = "ONE"
* name[=].given[+] = "A"
* birthDate = "1948-03-01"

// ============================================================================
// PRACTITIONER
// ============================================================================
Instance: testpatient2-practitioner-spahn
InstanceOf: Practitioner
Usage: #example
Title: "Test Practitioner - Dr. Eric Spahn"
Description: "Prescribing provider from test data"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* identifier[+].value = "13072719"
* name[+].family = "SPAHN"
* name[=].given[+] = "ERIC"

// ============================================================================
// LOCATIONS
// ============================================================================
Instance: testpatient2-location-formulary
InstanceOf: Location
Usage: #example
Title: "Test Location - POR PHARM FORMULARY"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* identifier[+].value = "800153522"
* name = "POR PHARM FORMULARY"

Instance: testpatient2-location-clc
InstanceOf: Location
Usage: #example
Title: "Test Location - PHARM CHART CONSULT CLC CP"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* identifier[+].value = "1600410421"
* name = "PHARM CHART CONSULT CLC CP"

// ============================================================================
// ALLERGIES (deduplicated by DrugNameWithoutDose)
// ============================================================================
Instance: testpatient2-allergy-terazosin
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Terazosin"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "TERAZOSIN"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-sulfamethoxazole
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Sulfamethoxazole/Trimethoprim (Bactrim)"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "BACTRIM"
* code.coding[+].display = "SULFAMETHOXAZOLE/TRIMETHOPRIM"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-tramadol
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Tramadol"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "TRAMADOL"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-trimethoprim
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Trimethoprim"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "TRIMETHOPRIM"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-methocarbamol
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Methocarbamol"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "METHOCARBAMOL"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-imipramine
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Imipramine"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "IMIPRAMINE"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-tetracycline
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Tetracycline"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "TETRACYCLINE"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-oxycodone
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Oxycodone"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "OXYCODONE"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-penicillin
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Penicillin"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "PENICILLIN"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-trihexyphenidyl
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Trihexyphenidyl"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "TRIHEXYPHENIDYL"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-fluoxetine
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Fluoxetine"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "FLUOXETINE"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-lisinopril
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Lisinopril"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "LISINOPRIL"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-daptomycin
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Daptomycin"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "DAPTOMYCIN"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-chlorpromazine
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Chlorpromazine (Thorazine)"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "THORAZINE"
* code.coding[+].display = "CHLORPROMAZINE"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-clindamycin
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Clindamycin"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "CLINDAMYCIN HCL 75MG CAP"
* code.coding[+].display = "CLINDAMYCIN"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-metformin
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Metformin"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "METFORMIN"
* patient = Reference(testpatient2-patient)

Instance: testpatient2-allergy-acetaminophen-codeine
InstanceOf: EMIAllergyIntolerance
Usage: #example
Title: "Test Allergy - Acetaminophen/Codeine"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* category[+] = #medication
* code.text = "ACETAMINOPHEN/CODEINE"
* patient = Reference(testpatient2-patient)

// ============================================================================
// NON-VA MEDICATIONS (MedicationStatement)
// ============================================================================
Instance: testpatient2-nonva-lisinopril
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "Test Non-VA Med - Lisinopril"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #active
* category = $V3ActCode#PATDOC "patient documentation"
* medicationCodeableConcept.text = "LISINOPRIL"
* subject = Reference(testpatient2-patient)

Instance: testpatient2-nonva-pravastatin
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "Test Non-VA Med - Pravastatin"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #active
* category = $V3ActCode#PATDOC "patient documentation"
* medicationCodeableConcept.text = "PRAVASTATIN"
* subject = Reference(testpatient2-patient)

Instance: testpatient2-nonva-stjohnswort
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "Test Non-VA Med - St. John's Wort"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #active
* category = $V3ActCode#PATDOC "patient documentation"
* medicationCodeableConcept.text = "ST. JOHN'S WORT"
* subject = Reference(testpatient2-patient)

Instance: testpatient2-nonva-fishoil
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "Test Non-VA Med - Fish Oil"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #active
* category = $V3ActCode#PATDOC "patient documentation"
* medicationCodeableConcept.text = "FISH OIL"
* subject = Reference(testpatient2-patient)

Instance: testpatient2-nonva-ginkgo
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "Test Non-VA Med - Ginkgo"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #active
* category = $V3ActCode#PATDOC "patient documentation"
* medicationCodeableConcept.text = "GINKGO"
* subject = Reference(testpatient2-patient)

Instance: testpatient2-nonva-aspirin
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "Test Non-VA Med - Aspirin"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #active
* category = $V3ActCode#PATDOC "patient documentation"
* medicationCodeableConcept.text = "ASPIRIN"
* subject = Reference(testpatient2-patient)

Instance: testpatient2-nonva-turmeric
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "Test Non-VA Med - Turmeric"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #active
* category = $V3ActCode#PATDOC "patient documentation"
* medicationCodeableConcept.text = "TURMERIC"
* subject = Reference(testpatient2-patient)

Instance: testpatient2-nonva-kava
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "Test Non-VA Med - Kava"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #active
* category = $V3ActCode#PATDOC "patient documentation"
* medicationCodeableConcept.text = "KAVA"
* subject = Reference(testpatient2-patient)

Instance: testpatient2-nonva-sawpalmetto
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "Test Non-VA Med - Saw Palmetto"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #active
* category = $V3ActCode#PATDOC "patient documentation"
* medicationCodeableConcept.text = "SAW PALMETTO"
* subject = Reference(testpatient2-patient)

Instance: testpatient2-nonva-cannabis
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "Test Non-VA Med - Cannabis"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #active
* category = $V3ActCode#PATDOC "patient documentation"
* medicationCodeableConcept.text = "CANNABIS"
* subject = Reference(testpatient2-patient)

Instance: testpatient2-nonva-oxycodone
InstanceOf: EMIExternalMedicationStatement
Usage: #example
Title: "Test Non-VA Med - Oxycodone (Immediate Release)"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #active
* category = $V3ActCode#PATDOC "patient documentation"
* medicationCodeableConcept.text = "OXYCODONE (IMMEDIATE RELEASE)"
* subject = Reference(testpatient2-patient)

// ============================================================================
// OUTPATIENT MEDICATION REQUESTS
// ============================================================================
Instance: testpatient2-outpat-15700856
InstanceOf: EMIOutpatientMedicationRequest
Usage: #example
Title: "Test Rx - Amlodipine (Discontinued)"
Description: "Amlodipine Besylate 5MG - DISCONTINUED"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* identifier[+].system = "http://va.gov/fhir/emi/sid/rx-number"
* identifier[=].value = "15700856"
* status = #stopped
* intent = #order
* category[+] = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient
* medicationCodeableConcept = $RxNorm#197361 "amlodipine 5 MG Oral Tablet"
* medicationCodeableConcept.text = "AMLODIPINE BESYLATE 5MG TAB"
* subject = Reference(testpatient2-patient)
* requester = Reference(testpatient2-practitioner-spahn)
* reasonCode[+].text = "FOR BLOOD PRESSURE"
* dosageInstruction[+].text = "TAKE ONE TABLET BY MOUTH EVERY DAY FOR BLOOD PRESSURE"
* dispenseRequest.numberOfRepeatsAllowed = 5
* dispenseRequest.expectedSupplyDuration.value = 30
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
* dispenseRequest.expectedSupplyDuration.code = #d
* dispenseRequest.validityPeriod.end = "2025-04-07"

Instance: testpatient2-outpat-15700856A
InstanceOf: EMIOutpatientMedicationRequest
Usage: #example
Title: "Test Rx - Amlodipine (Active)"
Description: "Amlodipine Besylate 5MG - ACTIVE"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* identifier[+].system = "http://va.gov/fhir/emi/sid/rx-number"
* identifier[=].value = "15700856A"
* status = #active
* intent = #order
* category[+] = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient
* medicationCodeableConcept = $RxNorm#197361 "amlodipine 5 MG Oral Tablet"
* medicationCodeableConcept.text = "AMLODIPINE BESYLATE 5MG TAB"
* subject = Reference(testpatient2-patient)
* requester = Reference(testpatient2-practitioner-spahn)
* encounter.extension[+].url = "http://va.gov/fhir/emi/StructureDefinition/location-reference"
* encounter.extension[=].valueReference = Reference(testpatient2-location-formulary)
* reasonCode[+].text = "FOR BLOOD PRESSURE"
* dosageInstruction[+].text = "TAKE ONE TABLET BY MOUTH EVERY DAY FOR BLOOD PRESSURE"
* dispenseRequest.numberOfRepeatsAllowed = 4
* dispenseRequest.expectedSupplyDuration.value = 30
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
* dispenseRequest.expectedSupplyDuration.code = #d

Instance: testpatient2-outpat-21590416A
InstanceOf: EMIOutpatientMedicationRequest
Usage: #example
Title: "Test Rx - APAP/ASA/Caffeine (Discontinued)"
Description: "Acetaminophen/Aspirin/Caffeine - DISCONTINUED"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* identifier[+].system = "http://va.gov/fhir/emi/sid/rx-number"
* identifier[=].value = "21590416A"
* status = #stopped
* intent = #order
* category[+] = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient
* medicationCodeableConcept = $RxNorm#308297 "acetaminophen 250 MG / aspirin 250 MG / caffeine 65 MG Oral Tablet"
* medicationCodeableConcept.text = "APAP 250MG/ASA 250MG/CAFN 65MG TAB"
* subject = Reference(testpatient2-patient)
* requester = Reference(testpatient2-practitioner-spahn)
* reasonCode[+].text = "FOR HEADACHE"
* dosageInstruction[+].text = "TAKE 1 TABLET BY MOUTH EVERY DAY FOR HEADACHE DO NOT TAKE MORE THAN 4,000MG A DAY OF ACETAMINOPHEN FROM ALL SOURCES DUE TO RISK OF LIVER DAMAGE"
* dispenseRequest.numberOfRepeatsAllowed = 5
* dispenseRequest.expectedSupplyDuration.value = 30
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
* dispenseRequest.expectedSupplyDuration.code = #d
* dispenseRequest.validityPeriod.end = "2026-02-13"

Instance: testpatient2-outpat-21590416
InstanceOf: EMIOutpatientMedicationRequest
Usage: #example
Title: "Test Rx - APAP/ASA/Caffeine (Original Discontinued)"
Description: "Acetaminophen/Aspirin/Caffeine - DISCONTINUED"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* identifier[+].system = "http://va.gov/fhir/emi/sid/rx-number"
* identifier[=].value = "21590416"
* status = #stopped
* intent = #order
* category[+] = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient
* medicationCodeableConcept = $RxNorm#308297 "acetaminophen 250 MG / aspirin 250 MG / caffeine 65 MG Oral Tablet"
* medicationCodeableConcept.text = "APAP 250MG/ASA 250MG/CAFN 65MG TAB"
* subject = Reference(testpatient2-patient)
* requester = Reference(testpatient2-practitioner-spahn)
* reasonCode[+].text = "FOR HEADACHE"
* dosageInstruction[+].text = "TAKE 1 TABLET BY MOUTH EVERY DAY FOR HEADACHE DO NOT TAKE MORE THAN 4,000MG A DAY OF ACETAMINOPHEN FROM ALL SOURCES DUE TO RISK OF LIVER DAMAGE"
* dispenseRequest.numberOfRepeatsAllowed = 5
* dispenseRequest.expectedSupplyDuration.value = 30
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
* dispenseRequest.expectedSupplyDuration.code = #d
* dispenseRequest.validityPeriod.end = "2026-02-13"

Instance: testpatient2-outpat-15980011
InstanceOf: EMIOutpatientMedicationRequest
Usage: #example
Title: "Test Rx - Warfarin (Hold)"
Description: "Warfarin 1MG - HOLD (mapped to active)"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* identifier[+].system = "http://va.gov/fhir/emi/sid/rx-number"
* identifier[=].value = "15980011"
* status = #active
* statusReason.text = "HOLD"
* intent = #order
* category[+] = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient
* medicationCodeableConcept = $RxNorm#855288 "warfarin sodium 1 MG Oral Tablet"
* medicationCodeableConcept.text = "WARFARIN NA (GOLDEN STATE) 1MG TAB"
* subject = Reference(testpatient2-patient)
* requester = Reference(testpatient2-practitioner-spahn)
* reasonCode[+].text = "FOR BLOOD CLOT PREVENTION/TREATMENT"
* dosageInstruction[+].text = "TAKE 1MG BY MOUTH AS DIRECTED FOR BLOOD CLOT PREVENTION/TREATMENT - FOLLOW MOST RECENT INSTRUCTIONS FROM THE ANTICOAG CLINIC OR YOUR DOCTOR."
* dispenseRequest.numberOfRepeatsAllowed = 5
* dispenseRequest.expectedSupplyDuration.value = 30
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
* dispenseRequest.expectedSupplyDuration.code = #d

Instance: testpatient2-outpat-21577509
InstanceOf: EMIOutpatientMedicationRequest
Usage: #example
Title: "Test Rx - Atorvastatin (Active)"
Description: "Atorvastatin 10MG - ACTIVE"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* identifier[+].system = "http://va.gov/fhir/emi/sid/rx-number"
* identifier[=].value = "21577509"
* status = #active
* intent = #order
* category[+] = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient
* medicationCodeableConcept = $RxNorm#617312 "atorvastatin 10 MG Oral Tablet"
* medicationCodeableConcept.text = "ATORVASTATIN CA 10MG TAB"
* subject = Reference(testpatient2-patient)
* requester = Reference(testpatient2-practitioner-spahn)
* reasonCode[+].text = "FOR CHOLESTEROL"
* dosageInstruction[+].text = "TAKE ONE TABLET BY MOUTH EVERY EVENING FOR CHOLESTEROL TO LOWER CHOLESTEROL *AVOID GRAPEFRUIT PRODUCTS WITH THIS MEDICINE"
* dispenseRequest.numberOfRepeatsAllowed = 5
* dispenseRequest.expectedSupplyDuration.value = 30
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
* dispenseRequest.expectedSupplyDuration.code = #d

Instance: testpatient2-outpat-21577517
InstanceOf: EMIOutpatientMedicationRequest
Usage: #example
Title: "Test Rx - Glipizide (Suspended)"
Description: "Glipizide 10MG - SUSPENDED (mapped to active)"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* identifier[+].system = "http://va.gov/fhir/emi/sid/rx-number"
* identifier[=].value = "21577517"
* status = #active
* statusReason.text = "SUSPENDED"
* intent = #order
* category[+] = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient
* medicationCodeableConcept = $RxNorm#310488 "glipizide 10 MG Oral Tablet"
* medicationCodeableConcept.text = "GLIPIZIDE 10MG TAB"
* subject = Reference(testpatient2-patient)
* requester = Reference(testpatient2-practitioner-spahn)
* encounter.extension[+].url = "http://va.gov/fhir/emi/StructureDefinition/location-reference"
* encounter.extension[=].valueReference = Reference(testpatient2-location-clc)
* reasonCode[+].text = "FOR DIABETES"
* dosageInstruction[+].text = "TAKE ONE TABLET BY MOUTH EVERY DAY AS NEEDED FOR DIABETES TAKE 30 MINUTES BEFORE A MEAL. TESTING AS NEEDED"
* dispenseRequest.numberOfRepeatsAllowed = 3
* dispenseRequest.expectedSupplyDuration.value = 1
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
* dispenseRequest.expectedSupplyDuration.code = #d

// ============================================================================
// COUNSELING PROCEDURES (linked to MedicationRequests)
// All have CounseledFlag = N, so status = not-done
// ============================================================================
Instance: testpatient2-counseling-15700856
InstanceOf: Procedure
Usage: #example
Title: "Test Counseling - Amlodipine 15700856"
Description: "Medication counseling for Rx 15700856 - Not performed"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #not-done
* code = $SCT#410265008 "Medication administration education, guidance, and counseling"
* subject = Reference(testpatient2-patient)
* reasonReference = Reference(testpatient2-outpat-15700856)

Instance: testpatient2-counseling-15700856A
InstanceOf: Procedure
Usage: #example
Title: "Test Counseling - Amlodipine 15700856A"
Description: "Medication counseling for Rx 15700856A - Not performed"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #not-done
* code = $SCT#410265008 "Medication administration education, guidance, and counseling"
* subject = Reference(testpatient2-patient)
* reasonReference = Reference(testpatient2-outpat-15700856A)

Instance: testpatient2-counseling-21590416A
InstanceOf: Procedure
Usage: #example
Title: "Test Counseling - APAP/ASA/Caffeine 21590416A"
Description: "Medication counseling for Rx 21590416A - Not performed"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #not-done
* code = $SCT#410265008 "Medication administration education, guidance, and counseling"
* subject = Reference(testpatient2-patient)
* reasonReference = Reference(testpatient2-outpat-21590416A)

Instance: testpatient2-counseling-21590416
InstanceOf: Procedure
Usage: #example
Title: "Test Counseling - APAP/ASA/Caffeine 21590416"
Description: "Medication counseling for Rx 21590416 - Not performed"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #not-done
* code = $SCT#410265008 "Medication administration education, guidance, and counseling"
* subject = Reference(testpatient2-patient)
* reasonReference = Reference(testpatient2-outpat-21590416)

Instance: testpatient2-counseling-15980011
InstanceOf: Procedure
Usage: #example
Title: "Test Counseling - Warfarin 15980011"
Description: "Medication counseling for Rx 15980011 - Not performed"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #not-done
* code = $SCT#410265008 "Medication administration education, guidance, and counseling"
* subject = Reference(testpatient2-patient)
* reasonReference = Reference(testpatient2-outpat-15980011)

Instance: testpatient2-counseling-21577509
InstanceOf: Procedure
Usage: #example
Title: "Test Counseling - Atorvastatin 21577509"
Description: "Medication counseling for Rx 21577509 - Not performed"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #not-done
* code = $SCT#410265008 "Medication administration education, guidance, and counseling"
* subject = Reference(testpatient2-patient)
* reasonReference = Reference(testpatient2-outpat-21577509)

Instance: testpatient2-counseling-21577517
InstanceOf: Procedure
Usage: #example
Title: "Test Counseling - Glipizide 21577517"
Description: "Medication counseling for Rx 21577517 - Not performed"

* meta.source = "http://va.gov/fhir/sid/sta3n/648"
* status = #not-done
* code = $SCT#410265008 "Medication administration education, guidance, and counseling"
* subject = Reference(testpatient2-patient)
* reasonReference = Reference(testpatient2-outpat-21577517)
