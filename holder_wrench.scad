$fn=32;

include <modules/module_wrench.scad>
include <modules/module_pegs.scad>

count=9;
width=50;
gap=6;
gap_growth=0.3;
angle=-30;
rows=5;


wrench(count,width,gap,gap_growth,angle);
pegs_lux(width,rows);
