$fn=32;

include <modules/module_socket.scad>
include <modules/module_pegs.scad>

sockets         = [10,8,6,4,2,15];
space           = 4;
depth           = 10;
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
