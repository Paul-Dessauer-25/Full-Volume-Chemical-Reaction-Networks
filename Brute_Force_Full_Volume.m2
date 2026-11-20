-- We present a brute-force checker for full-volume.

needsPackage "Polyhedra";
needsPackage "ReactionNetworks";


randomNonzeroQQ = () -> (
    a := random QQ;
    while a == 0 do a = random QQ;
    a
);

-- This gives the augmented system of equations with all conservation constants equal to 1 and conservation law matrix being the unique Row-reduced-Echelon Form.
augmentedSystem = N -> (

    -- Steady-state equations
    SS := flatten entries steadyStateEquations N;

    -- Columns span the left kernel of the stoichiometric matrix
    Z := stoichSubspaceKer N;

    -- No conservation laws
    if numColumns Z == 0 then return SS;

    -- Row-reduced-Echelon Form conservation-law matrix
    W := reducedRowEchelonForm sub(transpose Z, QQ);
    
    -- Pivot columns of W
    pivotIndices := apply(numRows W, i ->
        position(numColumns W, j -> W_(i,j) != 0)
    );

    -- Concentration variables
    xx := apply(N.ConcentrationRates, x -> value x);

    -- Number of conservation laws
    d := numRows W;

    -- Conservation equations W*x - c, with every c_i = 1
    CE := flatten entries (
        matrix{xx} * transpose sub(W, N.ReactionRing)
        -
        sub(matrix{apply(d, i -> 1)}, N.ReactionRing)
    );

    -- Replace the pivot-indexed steady-state equations
    apply(#SS, i -> (
        j := position(pivotIndices, p -> p == i);

        if j === null
        then SS#i
        else CE#j
    ))
);

-- This checks if every face of the reactant polytope has a sufficient number of associated polytopes checking it. If the face does not, this will output the relevant information about the face.
FullVolume = N -> (

    R := createRing(N, QQ);

    -- Augmented steady-state system
    SS := augmentedSystem N;

    -- Assign nonzero random rational values to reaction rates
    rateValues := apply(
        #N.ReactionRates,
        i -> randomNonzeroQQ()
    );

    reactionRates := N.ReactionRates / value;

    substitutions := apply(
        #reactionRates,
        i -> reactionRates#i => sub(rateValues#i, R)
    );

    SS = apply(SS, f -> sub(f, substitutions));

    -- Newton polytopes of the augmented equations
    polytopes := apply(SS, f -> newtonPolytope f);

    -- Convex hull of their union
    Delta := convexHull polytopes;

    n := #N.Species;
    d := dim Delta;

    print("dimension of Delta = " | toString d);

    -- The face criterion being used assumes Delta is n-dimensional
    if d != n then
        error "The total Newton polytope is not full-dimensional.";

    touches := (F, Q) -> (
        not isEmpty intersection(F, Q)
    );

    numTouching := F -> (
        #select(polytopes, Q -> touches(F, Q))
    );

    isFullVolumeFace := F -> (
        dim(F) + 1 <= numTouching(F)
    );

    -- Check every non-vertex proper face
    for codim from 1 to d - 1 do (

        currentFaces := facesAsPolyhedra(codim, Delta);

        for F in currentFaces do (

            if not isFullVolumeFace(F) then (

                touchingIndices := select(
                    toList(0 .. (#polytopes - 1)),
                    i -> touches(F, polytopes#i)
                );

                print "----------------------------------------";
                print "A face is not full volume.";
                print("dimension of face = " | toString dim(F));
                print(
                    "number of touching Newton polytopes = "
                    | toString numTouching(F)
                );
                print(
                    "required number of touching polytopes = "
                    | toString(dim(F) + 1)
                );
                print(
                    "indices of touching Newton polytopes = "
                    | toString touchingIndices
                );
                print(
                    "vertices of the face = "
                    | toString vertices(F)
                );
                print "----------------------------------------";

                return false;
            );
        );
    );

    true
);


### Example 6.4

-- Figure 9(b). Hybrid histidine kinase
hybrid = reactionNetwork {
    "HK00 --> HKp0",
    "HKp0 --> HK0p",
    "HK0p --> HKpp",
    "HK0p + Hpt --> HK00 + Hptp",
    "HKpp + Hpt --> HKp0 + Hptp",
    "Hptp --> Hpt"
};
FullVolume hybrid      -- returns: true

-- Figure 9(c). Allosteric reciprocal enzyme regulation
allosteric = reactionNetwork {
    "S + KL <--> SKL",
    "SKL --> Sp + KL",
    "Sp + P <--> SpP",
    "SpP --> S + P",
    "K + L <--> KL",
    "P + L <--> PL"
};
FullVolume allosteric  -- returns: false




