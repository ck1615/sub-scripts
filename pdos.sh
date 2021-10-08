#!/bin/bash
#This script contains the steps to perform a projected Density of States 
#calculation using quantum-espresso
seed=seed

module load xorg-utils gnuplot quantum-espresso
gerun pw.x -in $seed.scf.in > $seed.scf.out #SCF calculation
gerun pw.x -in $seed.nscf.in > $seed.nscf.out #nSCF calculation
gerun projwfc.x -in $seed.projwfc.in > $seed.projwfc.out #Atomic orb. proj.

#Sum over individual atoms
atoms=""
orbitals=("" "" "")
num=0

for a in $atoms
do
for o in ${orbitals[$num]}
do
sumpdos.x *\($a*\)*\($o\) > $seed.pdos.atom_"$a"_"$o".dat
done
num=$((num + 1))
done


