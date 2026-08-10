-- Below is the Macaulay 2 code for some chemical reaction networks from ODEbase. 

needsPackage "ReactionNetworks";

-- BIOMD0000000363
N1 = reactionNetwork {
    "II --> M",
    "M --> IIa",
    "II --> P2",
    "P2 --> IIa"
};

-- BIOMD0000000413
N2 = reactionNetwork ({
    "TIR1 + auxin --> auxinTIR1",
    "auxinTIR1 --> TIR1 + auxin",
    "VENUS + auxinTIR1 --> auxinTIR1VENUS",
    "auxinTIR1VENUS --> VENUS + auxinTIR1",
    "auxinTIR1VENUS --> auxinTIR1",
    "0 --> auxin",
    "auxin --> 0",
    "0 --> VENUS",
    "VENUS --> 0"
    }, NullSymbol => "0");


-- BIOMD0000000040
N3 = reactionNetwork {
    "Br + BrO3 --> HBrO2 + HOBr",
    "Br + HBrO2 --> 2HOBr",
    "BrO3 + HBrO2 --> Ce + 2HBrO2",
    "2HBrO2 --> BrO3 + HOBr",
    "Ce --> Br"
};


-- BIOMD0000000629
N4 = reactionNetwork {
    "L + R <--> LR",
    "CA + LR <--> LRCA"
};


-- BIOMD0000000609
N5 = reactionNetwork ({
    "p100t --> p100",
    "p100_NIK --> NIK + p52",
    "p52 --> 0",
    "p100 --> 0",
    "NIK + p100 <--> p100_NIK"
    }, NullSymbol => "0");


-- BIOMD0000000233
N6 = reactionNetwork {
    "S + Y --> 2X",
    "2X --> X + Y",
    "X + Y --> P + Y",
    "X --> P"
};


-- BIOMD0000000267
N7 = reactionNetwork {
    "bound --> translocate",
    "translocate --> lytic",
    "free --> bound"
};


-- BIOMD0000000486
N8 = reactionNetwork {
    "B --> A",
    "A --> B"
};


-- BIOMD0000000283
N9 = reactionNetwork {
    "E + X <--> P",
    "P --> E + Q"
};


-- BIOMD0000000854
N10 = reactionNetwork {
    "Pc --> Ac",
    "Ac --> Ap",
    "Ap --> Ac",
    "Pp --> Pc",
    "Pc --> Pp",
    "Pp --> Ap",
    "Ap --> Pp"
};


-- Listed as BIOMD0000000609 in your file
N11 = reactionNetwork ({
    "Paracetamol_APAP --> NAPQI",
    "NAPQI --> Paracetamol_APAP",
    "Paracetamol_APAP --> 0",
    "NAPQI --> Protein_adducts",
    "GSH + NAPQI --> 0",
    "GSH --> 0",
    "0 --> GSH",
    "Paracetamol_APAP + Sulphate__PAPS --> 0",
    "Sulphate__PAPS --> 0",
    "0 --> Sulphate__PAPS"
    }, NullSymbol => "0");


-- BIOMD0000000916
N12 = reactionNetwork {
    "The_FOD_in_the_circulation__X1 --> The_FOD_in_the_metabolizing_tissues__X4",
    "The_FOD_in_the_metabolizing_tissues__X4 <--> The_FOD_in_the_gallbladder___intestinal_lumen__X5",
    "The_FOD_in_the_gallbladder___intestinal_lumen__X5 --> The_cumulative_FOD_excreted_in_the_non_urinary_pool__X3",
    "The_FOD_in_the_metabolizing_tissues__X4 --> The_cumulative_FOD_excreted_in_the_urine__X2"
};


-- BIOMD0000000060
N13 = reactionNetwork {
    "Po1 <--> Pc1",
    "Po1 <--> Po2",
    "Po1 <--> Pc2"
};


-- BIOMD0000000092
N14 = reactionNetwork {
    "z <--> e + w",
    "e + z <--> ez",
    "ez <--> 2e + w"
};


-- BIOMD0000000057
N15 = reactionNetwork {
    "R <--> O",
    "R <--> I1",
    "O <--> S",
    "O <--> A",
    "A <--> I2"
};


-- BIOMD0000000271
N16 = reactionNetwork ({
    "0 --> EpoR",
    "EpoR --> 0",
    "Epo + EpoR --> Epo_EpoR",
    "Epo_EpoR --> Epo + EpoR",
    "Epo_EpoR --> Epo_EpoRi",
    "Epo_EpoRi --> Epo + EpoR",
    "Epo_EpoRi --> dEpoi",
    "Epo_EpoRi --> dEpoe"
    }, NullSymbol => "0");


-- BIOMD0000000272
N17 = reactionNetwork ({
    "0 --> EpoR",
    "EpoR --> 0",
    "EpoR + SAv --> SAv_EpoR",
    "SAv_EpoR --> EpoR + SAv",
    "SAv_EpoR --> SAv_EpoRi",
    "SAv_EpoRi --> SAv",
    "SAv_EpoRi --> dSAvi",
    "SAv_EpoRi --> dSAve"
    }, NullSymbol => "0");


-- BIOMD0000000282
N18 = reactionNetwork {
    "e + x <--> p",
    "p + x --> e + p1",
    "a + p --> e + p2"
};


-- BIOMD0000000405
N19 = reactionNetwork ({
    "species_1 + species_5 --> species_3",
    "species_2 + species_5 --> species_4",
    "0 --> species_1",
    "0 --> species_2",
    "species_3 --> species_5",
    "species_4 --> species_5",
    "species_1 --> 0",
    "species_2 --> 0"
    }, NullSymbol => "0");


-- BIOMD0000000487
N20 = reactionNetwork {
    "S1 + S2 --> S3",
    "S3 --> S1 + S2",
    "S3 --> S1 + S5",
    "S4 + S5 --> S6",
    "S6 --> S4 + S5",
    "S6 --> S2 + S4"
};


-- BIOMD0000000870
N21 = reactionNetwork ({
    "p100t --> p100",
    "p100_NIK --> NIK + p52",
    "p52 --> 0",
    "p100 --> 0",
    "2p100 <--> IkBd",
    "IkBd --> 0",
    "IkBd_NIK --> NIK",
    "NIK + p100 <--> p100_NIK",
    "IkBd + NIK <--> IkBd_NIK"
    }, NullSymbol => "0");


-- BIOMD0000000361
N22 = reactionNetwork {
    "VIIa_TF + X <--> VIIa_TF_X",
    "VIIa_TF_X --> VIIa_TF_Xa",
    "VIIa_TF_Xa <--> VIIa_TF + Xa",
    "TFPI + Xa <--> Xa_TFPI",
    "VIIa_TF + Xa_TFPI <--> Xa_TFPI_VIIa_TF"
};


-- BIOMD0000000692
N23 = reactionNetwork {
    "RasGTP_minus_NF1_star_ <--> RasGDP_minus_NF1_Pi",
    "RasGDP_minus_NF1_Pi <--> Pi + RasGDP_NF1",
    "RasGTP_minus_NF1 <--> RasGTP_minus_NF1_star_",
    "RasGDP_NF1 <--> NF1 + RasGDP",
    "NF1 + RasGTP <--> RasGTP_minus_NF1"
};


-- BIOMD0000000871
N24 = reactionNetwork ({
    "0 --> p100",
    "p100_NIK --> NIK + p52",
    "p52 --> 0",
    "p100 --> 0",
    "2p100 <--> IkBd",
    "IkBd --> 0",
    "IkBd_NIK --> NIK",
    "NIK + p100 <--> p100_NIK",
    "IkBd + NIK <--> IkBd_NIK",
    "0 --> RelB",
    "RelB + p52 <--> RelB_p52",
    "RelB_p52 --> 0",
    "RelB --> 0"
    }, NullSymbol => "0");
