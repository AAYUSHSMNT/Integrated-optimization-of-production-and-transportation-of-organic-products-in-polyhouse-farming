# Sets
set I;
set J;
set P;
param K{i in I} >= 0, integer;
set IK := setof {i in I, k in 1..K[i]} (i, k);
# Parameters

param C_ikj{(i,k) in IK, j in J};
param F_ik{(i,k) in IK} >= 0, integer;
param C_ip{i in I, p in P};
param D_jp{j in J, p in P} >= 0, integer;
param X_ik_max{(i,k) in IK} >= 0, integer;
param X_ik_min{(i,k) in IK} >= 0, integer;
param X_p{p in P} >= 0, integer;
param Q_i{i in I} >= 0, integer;
param S_ijp{i in I, j in J, p in P} >= 0, integer;

# Define a parameter to hold the minimum required area of farming land
param Min_Area :=
    sum{j in J, p in P} D_jp[j,p] / X_p[p];
	
# Variables
var x_ikjp{(i,k) in IK, j in J, p in P} >= 0, <= 10000000, integer;
var z_ik{(i,k) in IK}, binary;

# Objective
minimize Total_Cost:
    sum{(i,k) in IK, j in J} C_ikj[i,k,j] * sum{p in P} x_ikjp[i,k,j,p] +
    sum{(i,k) in IK} F_ik[i,k] * z_ik[i,k] +
    sum{(i,k) in IK, j in J, p in P} C_ip[i,p] * x_ikjp[i,k,j,p];

# Constraints
subject to Demand_Constraint{j in J, p in P}:
    sum{i in I} S_ijp[i,j,p] * sum{k in 1..K[i]} x_ikjp[i,k,j,p] = D_jp[j,p];

subject to NonNegative_Constraint{(i,k) in IK, j in J, p in P}:
    x_ikjp[i,k,j,p] >= 0;

subject to UpperBound_Constraint{(i,k) in IK, j in J, p in P}:
    x_ikjp[i,k,j,p] <= D_jp[j,p];

subject to Min_Constraint{(i,k) in IK}:
    sum{j in J, p in P} x_ikjp[i,k,j,p] >= X_ik_min[i,k] * z_ik[i,k];

subject to Max_Constraint{(i,k) in IK}:
    sum{j in J, p in P} x_ikjp[i,k,j,p] <= X_ik_max[i,k] * z_ik[i,k];

subject to Capacity_Constraint{i in I}:
    sum{p in P} (sum{k in 1..K[i], j in J} x_ikjp[i,k,j,p]) / X_p[p] <= Q_i[i];
