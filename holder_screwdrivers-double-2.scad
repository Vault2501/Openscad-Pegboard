$fn=32;

include <modules/module_screwdrivers.scad>
include <modules/module_pegs.scad>
include <openscad-libraries/functions.scad>

handles_front=[7.5,13.5,10.2,12,9,7,5,4,2.5,2];
factor_front=1;
space_front=3;
handles_back=[28,28,31,41,23];
factor_back=3;
space_back=1.7;
thickness=20;
depth_back=2;

offy_front  = max(handles_back)+2*space_back+2*depth_back-1.7;
width       = max(getSum(handles_front,gap=space_front)+space_front,getSum(handles_back,gap=space_back)+space_back);
echo("width:", width);

translate([0,offy_front,0])
{
    screwdriver(array=handles_front,gap=space_front,height=thickness,depth=0,width=width,open=false,back=false,factor=factor_front);
}
screwdriver(array=handles_back,gap=space_back,height=thickness,depth=0,width=width,open=false,back=true,factor=factor_back);
pegs_lux(width,2);

