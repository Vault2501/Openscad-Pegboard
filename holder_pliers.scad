$fn=32;

include <modules/module_pliers.scad>
include <modules/module_pegs.scad>

width=60;
height=34;
depth=30;
rows=2;

pliers(width,depth,height);
pegs_lux(depth,rows);

