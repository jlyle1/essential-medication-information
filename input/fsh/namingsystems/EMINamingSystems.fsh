// VA Enterprise Identifiers

Instance: icn-naming-system
InstanceOf: NamingSystem
Usage: #definition
Title: "VA Integration Control Number (ICN)"
Description: "The VA Master Patient Index Integration Control Number, a unique identifier for patients (and providers) across VA systems."
* name = "VAICN"
* status = #active
* kind = #identifier
* date = "2024-01-01"
* publisher = "Department of Veterans Affairs"
* responsible = "VA Master Patient Index"
* type = $IdentifierType#PN "Person number"
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* usage = "Used to uniquely identify patients (and providers) across all VA healthcare facilities."
* uniqueId[+].type = #oid
* uniqueId[=].value = "2.16.840.1.113883.4.349"
* uniqueId[=].preferred = true

Instance: edipi-naming-system
InstanceOf: NamingSystem
Usage: #definition
Title: "DoD Electronic Data Interchange Personal Identifier (EDIPI)"
Description: "The Department of Defense unique identifier for service members and beneficiaries."
* name = "DoDEDIPI"
* status = #active
* kind = #identifier
* date = "2024-01-01"
* publisher = "Department of Defense"
* responsible = "Defense Manpower Data Center"
* type = $IdentifierType#PN "Person number"
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* usage = "Used to identify DoD beneficiaries, including veterans receiving care through VA/DoD sharing."
* uniqueId[+].type = #oid
* uniqueId[=].value = "2.16.840.1.113883.3.42.10001.100001.12"
* uniqueId[=].preferred = true

// VistA File-Based Identifiers

Instance: vista-patient-ien-naming-system
InstanceOf: NamingSystem
Usage: #definition
Title: "VistA Patient IEN"
Description: "Internal Entry Number for patients in VistA File 2 (PATIENT file)."
* name = "VistAPatientIEN"
* status = #active
* kind = #identifier
* date = "2024-01-01"
* publisher = "Department of Veterans Affairs"
* responsible = "Veterans Health Information Systems and Technology Architecture (VistA)"
* type = $IdentifierType#MR "Medical record number"
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* usage = "Local patient identifier within a single VistA instance. The station number (sta3n) in meta.source identifies which VistA system."
* uniqueId[+].type = #uri
* uniqueId[=].value = $VistAPatientIEN
* uniqueId[=].preferred = true

Instance: vista-rx-number-naming-system
InstanceOf: NamingSystem
Usage: #definition
Title: "VistA Prescription Number"
Description: "Prescription number from VistA File 52 (PRESCRIPTION file), field .01."
* name = "VistARxNumber"
* status = #active
* kind = #identifier
* date = "2024-01-01"
* publisher = "Department of Veterans Affairs"
* responsible = "Veterans Health Information Systems and Technology Architecture (VistA)"
* type = $IdentifierType#FILL "Filler Identifier"
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* usage = "Identifies outpatient prescriptions. Combined with station number to ensure uniqueness across VA."
* uniqueId[+].type = #uri
* uniqueId[=].value = $VistARxNumber
* uniqueId[=].preferred = true

Instance: vista-unit-dose-order-naming-system
InstanceOf: NamingSystem
Usage: #definition
Title: "VistA Unit Dose Order Number"
Description: "Order number from VistA File 55.06 (UNIT DOSE file), field .001."
* name = "VistAUnitDoseOrderNumber"
* status = #active
* kind = #identifier
* date = "2024-01-01"
* publisher = "Department of Veterans Affairs"
* responsible = "Veterans Health Information Systems and Technology Architecture (VistA)"
* type = $IdentifierType#PLAC "Placer Identifier"
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* usage = "Identifies inpatient unit dose medication orders."
* uniqueId[+].type = #uri
* uniqueId[=].value = $VistAUnitDoseOrderNumber
* uniqueId[=].preferred = true

Instance: vista-iv-order-naming-system
InstanceOf: NamingSystem
Usage: #definition
Title: "VistA IV Order Number"
Description: "Order number from VistA File 55.01 (IV file), field .001."
* name = "VistAIVOrderNumber"
* status = #active
* kind = #identifier
* date = "2024-01-01"
* publisher = "Department of Veterans Affairs"
* responsible = "Veterans Health Information Systems and Technology Architecture (VistA)"
* type = $IdentifierType#PLAC "Placer Identifier"
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* usage = "Identifies inpatient IV medication orders."
* uniqueId[+].type = #uri
* uniqueId[=].value = $VistAIVOrderNumber
* uniqueId[=].preferred = true
