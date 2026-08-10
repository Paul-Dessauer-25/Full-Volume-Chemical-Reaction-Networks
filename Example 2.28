-- In Example 2.28, we claim that the mixed volume and volume of the chemical reaction network given in Example 2.3 are equal to 5.
-- Below is Macaulay 2 code verifying this claim.

needsPackage "Polyhedra";

-- Rate parameters
K = QQ[k1,k2,k3,k4,k5,k6,k7,k8,k9,k10];

-- Species variables
R = K[x,y,z];

-- Steady-state equations
f1 = k1 - k6*x - k4*x^2 + k9*x*y - k5*x*y + k10*y*z;

f2 = k2 - k7*y + k4*x^2 - k9*x*y;

f3 = k3 - k8*z + k5*x*y - k10*y*z;

-- Newton polytopes
P1 = newtonPolytope f1;
P2 = newtonPolytope f2;
P3 = newtonPolytope f3;

-- Mixed volume of the network
MV = mixedVolume {P1,P2,P3};

-- Volume of the network
P = convexHull {P1,P2,P3};
V = 3!*volume P

MV -- Returns 5
V  -- Returns 5

