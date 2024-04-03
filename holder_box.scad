include <modules/module_box.scad>
include <modules/module_pegs.scad>

width=80;
depth=50;
height=40;
wall=3;
rounding=8;
rows=2;

box(width,depth,height,wall,rounding);
pegs_lux(width,rows);