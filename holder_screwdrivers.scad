$fn=32;

include <modules/module_screwdrivers.scad>
include <modules/module_pegs.scad>
include <openscad-libraries/functions.scad>

handles_front=[9.8,9.8,12,12,12,12,12,12,12,12,12,12,12,12];
factor_front=2;
space_front=1;
handles_back=[7.25,7.25,7.25,7.25,7.25,7.25,14,14,14,14,18,18,19];
factor_back=3;
space_back=1.7;
thickness=10;
depth_back=2;

offy_front  = max(handles_back)+2*space_back+2*depth_back;
width       = max(getSum(handles_front,gap=space_front)+space_front,getSum(handles_back,gap=space_back)+space_back);
echo("width:", width);

translate([0,offy_front,0])
{
    screwdriver(array=handles_front,gap=space_front,height=thickness,depth=0,width=width,open=true,back=false,factor=factor_front);
}
screwdriver(array=handles_back,gap=space_back,height=thickness,depth=0,width=width,open=false,back=true,factor=factor_back);
pegs_lux(width,2);

