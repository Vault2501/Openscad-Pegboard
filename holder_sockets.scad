$fn=32;

include <modules/module_sockets.scad>
include <modules/module_pegs.scad>

//sockets         = [31,27.5,25.5,21,18.5,18];
sockets       = [18,18,14,13,13,13,13,13,13];
space           = 3;
depth           = 12.5;
angle           = 30;
rows            = 1;

// calculate total length for connectors
length_vec      = partialsum(sockets,0,len(sockets)-1);
width           = length_vec[len(length_vec)-1]
                + sockets[len(sockets)-1]
                + space*(len(sockets)-1)
                + 2*space;

wrench_sockets(sockets,space,depth,angle);
pegs_lux(width,rows);
