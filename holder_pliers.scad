include <modules/module_pliers.scad>
include <modules/module_pegs.scad>

width=80;
height=38;
depth=30;
rows=2;

pliers(width,depth,height);
pegs_lux(depth,rows);

