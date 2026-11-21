# When are Newton–Okounkov body bounds of a chemical reaction network at least as good as mixed-volume bounds?

This repository contains the Macaulay2 and Python code accompanying the paper by Paul R. Dessauer Jr.

## Computations from the paper

| Example | Result in the paper | File |
|---|---|---|
| 2.45 | The mixed volume and the normalized volume of the total polytope of the Generic Recurring Network both equal 5. | [Example_2.45.m2](./Example_2.45.m2) |
| 3.4 | For the same network, the Newton–Okounkov body bound equals 4 for the admissible space spanned by 1 and the three steady-state polynomials. | [Example_3.4.m2](./Example_3.4.m2) |
| 4.39 | The 11-species network BIOMD0000000257, introduced in Example 4.36, has six production-closed sets. | [All_Production_Closed_Sets.py](./All_Production_Closed_Sets.py) |
| 6.4 | The hybrid histidine kinase system in Figure 9(b) is full-volume. The allosteric reciprocal enzyme regulation system in Figure 9(c) fails the full-volume face criterion. | [Example_6.4.m2](./Example_6.4.m2) |

The mixed volume of 5 in Example 2.45 corrects the value of 6 reported by Obatake, Shiu, and Sofia in Example 3.15 of [*Mixed volume of small reaction networks*](https://doi.org/10.2140/involve.2020.13.845).

# All_Production_Closed_Sets.py

All_Production_Closed_Sets.py contains code to generate all production-closed sets of a network. We use the algorithm given in the paper. There are two functions given. The first function takes as an input: a set of species, the left-hand side matrix of the network, and the stoichiometric matrix of the network. It then applies the algorithm. The second function takes as an input: the left-hand side matrix of the network and the stoichiometric matrix of the network. It outputs all production_closed sets of the network.

# Brute_Force_Full_Volume.m2

Given a network `N` defined with the Macaulay2 package `ReactionNetworks`, `FullVolume N` constructs its augmented steady-state system. It uses the row-reduced echelon conservation-law matrix for the species order in `N.Species`, sets each total constant to 1, and assigns a random nonzero rational value to each rate constant.

The test requires the total polytope to have dimension equal to the number of species. It returns `true` if every nonempty proper face $F$ meets at least $\dim(F)+1$ of the Newton polytopes. If a face fails this criterion, the function returns `false` and prints the face's dimension and vertices, along with the indices of the Newton polytopes that meet it. The printed index `0` corresponds to $\Delta_1$ in the paper.

See [Example 6.4](./Example_6.4.m2) for a full-volume system and a system
with a face that fails the criterion.

# Computing_NO_Bodies.m2

Computing_NO_Bodies.m2 contains the Macaulay 2 code for computing the Newton-Okounkov body bound of a chemical reaction network. This code was written by Nida Obatake and Elise Walker for the paper "Newton-Okounkov bodies of chemical reaction systems".

# Data_Base.csv

Data_Base.csv contains a CSV file for whether certain networks are Full Volume. The networks can be seen in "Networks_for_database.m2". We use the Brute_Force_Full_Volume.m2 code to create this database.

# Networks_for_Database.m2

Networks_for_Database.m2 contains the Macaulay2 code for the networks used in Data_Base.m2. These networks are from the ODEbase. We use 23 networks ranging from 2 to 8 species. We stop at only 23 networks since the ODEbase does not store the networks in a way that is easy to write in Macaulay2. Additionally, we stop at 8 species as the Brute_Force_Full_Volume.m2 code starts to take hours to verify a network is Full Volume. 
