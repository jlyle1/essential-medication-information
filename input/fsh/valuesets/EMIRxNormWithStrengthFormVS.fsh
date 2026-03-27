ValueSet: EMIRxNormWithStrengthFormVS
Id: emi-rxnorm-strength-form-vs
Title: "EMI RxNorm With Strength and Form Value Set"
Description: "Value set containing RxNorm codes that include strength and dose form (Semantic Clinical Drug and Semantic Branded Drug term types)."

* ^status = #active
* ^experimental = true

// SCD - Semantic Clinical Drug (e.g., "Acetaminophen 500 MG Oral Tablet")
* include codes from system http://www.nlm.nih.gov/research/umls/rxnorm where TTY = "SCD"

// SBD - Semantic Branded Drug (e.g., "Tylenol 500 MG Oral Tablet")
* include codes from system http://www.nlm.nih.gov/research/umls/rxnorm where TTY = "SBD"

// GPCK - Generic Pack (e.g., multi-drug packs with strength and form)
* include codes from system http://www.nlm.nih.gov/research/umls/rxnorm where TTY = "GPCK"

// BPCK - Brand Pack (e.g., branded multi-drug packs with strength and form)
* include codes from system http://www.nlm.nih.gov/research/umls/rxnorm where TTY = "BPCK"
