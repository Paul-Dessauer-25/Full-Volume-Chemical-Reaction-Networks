import numpy as np

# Given a set of species S\subset [n], the left-hand side matrix L, and the stoichiometric matrix N, this will run algorithm 2 
def production_closed(S, L, N):
    
    n = len(L)
    r = len(L[0])
    T = {j - 1 for j in S}

    while True:
        complement = set(range(n)) - T

        C = {
            ell
            for ell in range(r)
            if all(L[j][ell] == 0 for j in complement)
        }

        new_T = T | {
            j
            for j in range(n)
            if any(N[j][ell] != 0 for ell in C)
        }

        if new_T == T:
            return {j + 1 for j in T}

        T = new_T

#Given the left-hand side matrix L and the stoichiometric matrix N, this will output all production-closed sets of the network
def all_production_closed(L, N):
    L = np.array(L)
    LHS = []
    for i in range(len(L[0])):
        LHS.append({j+1 for j in range(len(L[:, 0]))
           if L[j, i]!= 0})
    LHS = [set(x) for x in dict.fromkeys(frozenset(s) for s in LHS)]
    
    T1 = LHS
    while True:
        T = [] 
        for i in range(len(T1)):
            T.append(trace_species(T1[i], L, N))
        T1 = [set(x) for x in dict.fromkeys(frozenset(s) for s in T)]
        if T == T1:
            T1.remove(set(range(1, len(L)+1)))
            return(T1)

# Below are the stoichiometric matrix N and left-hand side matrix L for the network from example 4.23
N = [
    [-1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0],  
    [-1,  1,  0,  0,  1, -1, -1,  0,  0,  0,  0,  1, -1,  0,  0,  0,  1, -1,  0],  
    [ 1, -1, -1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1,  1,  0,  0,  0],  
    [ 0,  0, -1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0],  
    [ 0,  0,  1, -1, -1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0],  
    [ 0,  0,  0,  0,  1, -1,  0, -1,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0, -1],  
    [ 0,  0,  0,  0,  0,  0,  0, -1,  1,  0,  0,  1, -1, -1,  0,  0,  1, -1,  0],  
    [ 0,  0,  0,  0,  0,  0,  0,  1, -1, -1,  1,  0,  0,  0,  0,  0,  0,  0,  0],  
    [ 0,  0,  0,  0,  0,  0,  0,  0,  0, -1,  1,  0,  0,  0, -1,  1,  0,  0,  0],  
    [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  1, -1, -1,  1,  0,  0,  0,  0,  0,  0],  
    [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1, -1, -1,  1,  0], 
]

L = [
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0],
    [0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0], 
    [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],  
    [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0],  
    [0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],  
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0],  
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0],
]

# We compute all the production-closed sets as follows
all_production_closed(L, N) # Returns: [{1, 2, 3}, {1, 2, 3, 4, 5, 6}, {2}, {6, 7, 8}, {7}, {6}]


