#!/bin/bash

for f in *.cell
do
seed=$(basename $i .cell)

rm -f $seed.param
cat > $seed.param << EOF
!GENERAL PARAMETERS
task              GeometryOptimization
xc_functional     PBESOL
cut_off_energy    1200 eV
fix_occupancy     false
smearing_width    50 K 
metals_method     DM
grid_scale        2.0

!CONVERGENCE
max_scf_cycles    100
elec_energy_tol   1e-10 eV
elec_force_tol    1e-5

!GEOMETRY OPTIMIZATION
geom_force_tol    0.001 ev/ang
geom_energy_tol   1e-7
geom_stress_tol   0.010 GPa
geom_max_iter     300
num_backup_iter   3

!SPIN
spin_polarised      false
spin                0

!MISCELLANEOUS
write_bib           false
write_cst_esp       false
write_otfg          false
print_clock         true
print_memory_usage  true
iprint              1 
data_distribution   kpoint
opt_strategy        speed
EOF
done
