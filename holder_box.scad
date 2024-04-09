include <modules/module_box.scad>
include <modules/module_pegs.scad>

wall=3;
width=85+2*wall;
depth=40+2*wall;
height=40;
rounding=10;
rows=2;

box(width,depth,height,wall,rounding);
pegs_lux(width,rows);