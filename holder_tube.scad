include <modules/module_tube.scad>
include <modules/module_pegs.scad>


wall=2;
width=52+2*wall;
height=60;
rows=3;

tube(width,height,wall);
pegs_lux(width,rows);