-- The following is the computation supporting the claim made in example 3.4.
-- Using the methods and code from the "Newton-Okounkov bodies of chemical reaction systems" paper we show that with the chosen basis, the chemical reaction network
-- from example 2.3 is equal to 4.

needsPackage "SubalgebraBases"
needsPackage "Polyhedra"
needsPackage "PHCpack"
needsPackage "Cremona"
needsPackage "Bertini"
needs "./Computing_NO_Bodies.m2"



-- Step 0: Choose monomial term order. We use the default of grvlex
-- WNT pathway model with random rational coefficients and conservation laws
for i in 1..10 do k_i = random(QQ, Height => 1000); 
R = QQ[x_1, x_2, x_3]; -- default term order of grvlex

f1 = k_1 - k_6*x_1 - k_4*x_1^2 + k_9*x_1*x_2 - k_5*x_1*x_2 + k_10*x_2*x_3;
f2 = k_2 - k_7*x_2 + k_4*x_1^2 - k_9*x_1*x_2;
f3 = k_3 - k_8*x_3 + k_5*x_1*x_2 - k_10*x_2*x_3;

-- Step 1:
-- Choose a vector space basis s.t. each polynomial from 'system' is in the vector space
basisV = {1, f1, f2, f3}

-- Step 3: Compute a finite Khovanksii basis for R_V
-- first homogenize as in R_V
Rs = QQ[gens R |{s}];
basisVs = for i in basisV list sub(i, Rs)*s;
-- Check if basis is a SAGBI basis
(isSAGBI basisVs) --returns false 
SB = flatten entries gens sagbi(basisVs, Limit=>20)
(isSAGBI SB) --returns true

-- Step 6:
-----Computing a Newton-Okounkov Body-----
------------------------------------------
NObodyVol = computeNObodyVol(SB) --returns 1 for the normalized volume of the NObody


-- Step 4:
-----Computing the Degree of the Kodaira Map-----
-------------------------------------------------
dehomBasisV = for i in basisVs list sub(i, s=>1_Rs);
basisVHomToSameDegree = homToSameDegree(dehomBasisV, s);
-- Create Kodaira map
S = QQ[y_1..y_(#dehomBasisV)];
phi = map(Rs, S, basisVHomToSameDegree);
kodairaDegree = degreeMap phi --returns 4

-- Step 5: 
-----Computing the Index of the Lattice-----
--------------------------------------------
latticeIndex = computeIndexSNF(SB) -- returns 1


-- Step 7:
-----Computing the Birationally Invariant Self-Intersection Index-----
----------------------------------------------------------------------
kodairaDegree * NObodyVol / latticeIndex -- biii of the network, returns 4
