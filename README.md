# Comparing-Upper-Bounds-on-the-Number-of-Steady-States-of-a-Chemical-Reaction-Network
This GitHub repository contains the relevant supporting material for the paper "Comparing Upper Bounds on the Number of Steady States of a Chemical Reaction Network". 

# Brute_Force_Full_volume.m2

Brute_Force_Full_volume.m2 contains Macaulay2 code that checks if a network is full-volume the 'naive' way. The network must be encoded using the "ReactionNetworks" package. The program will first generate the augmented system of equations. Since full-volume may depend on our choice of conservation law matrix, we always choose the unique row-reduced echelon form of the conservation law matrix. Furthermore, since the support of any constant term is 0, we set the total-constant vector equal to the vector of only 1s. Once the augmented system of equations is created, the program will create the associated polytopes for the network. Finally, the program will check if every proper face of the reactant polytope has the sufficient number of associated polytopes touching it. If every proper face of the reactant polytope does have the sufficient number of associated polytopes touching it, then the program will return "True". Otherwise, the program will return "False" and will output the dimension of the problem face, the number of polytopes touching the problem face, the required number of polytopes touching the problem face, indices of the polytopes touching the problem face, and the vertices of the problem face.

# Computing_NO_Bodies.m2

Computing_NO_Bodies.m2 contains the Macaulay 2 code for computing the Newton-Okounkov body bound of a chemical reaction network. This code was written by Nida Obatake and Elise Walker for the paper "Newton-Okounkov bodies of chemical reaction systems".

# Database.csv

Database.csv contains a CSV file for whether certain networks are Full Volume. The networks can be seen in "Networks_for_database.m2". We use the Computing_NO_Bodies.m2 code to create this database.

# Example_2.28.m2

Example_2.28.m2 contains Macaulay2 code supporting the claim made in our paper about correcting an error from the paper "Mixed volume of small reaction networks" by Nida Obatake, Anne Shiu, and Dilruba Sofia. We show that the mixed volume and volume of the relevant network are equal to 5, not the claimed 6.

# Example_3.5.m2

Example_3.5.m2 contains Macaulay2 code that supports the claim made in our paper about the Newton-Okounkov body bound for the given network being equal to 4, for the given basis. 

# Networks_for_database.m2

Networks_for_database.m2 contains the Macaulay2 code for the networks used in Database.m2. These networks are from the ODEbase. We use 24 networks ranging from 3 to 8 species. We stop at only 24 networks since the ODEbase does not store the networks in a way that is easy to write in Macaulay2. Additionally, we stop at 8 species as the Computing_NO_Bodies.m2 code starts to take hours to verify a network being Full Volume. 
