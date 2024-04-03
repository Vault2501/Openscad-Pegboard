include <modules/module_tube.scad>
include <modules/module_pegs.scad>

width=80;
height=40;
wall=2;
rows=1;

tube(width,height,wall);
pegs_lux(width,rows);