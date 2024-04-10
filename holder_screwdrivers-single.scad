$fn=32;

include <modules/module_screwdrivers.scad>
include <modules/module_pegs.scad>
include <openscad-libraries/functions.scad>

handles=[28,28,31,41,23];
factor=1.8;
space=2;
thickness=20;
depth_back=2;

width       = max(getSum(handles,gap=space)+space,getSum(handles,gap=space)+space);
echo("width:", width);

screwdriver(array=handles,gap=space,height=thickness,depth=0,width=width,open=false,back=true,factor=factor);
pegs_lux(width,2);

