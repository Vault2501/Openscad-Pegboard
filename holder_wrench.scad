include <modules/module_wrench.scad>
include <modules/module_pegs.scad>

count=9;
width=50;
angle=45;
rows=5;


wrench(count,width,angle);
pegs_lux(width,rows);
