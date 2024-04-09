$fn=32;

include <modules/module_screwdrivers.scad>
include <modules/module_pegs.scad>


small_sockets_1 = [5.5,5.5,5.5,5.5,5.5];
small_sockets_2 = [5.5,5.5,5.5,5.5];
small_sockets_3 = [5.5,5.5,5.5];
small_sockets_4 = [4,4];
small_space     = 13;

large_sockets_1 = [4,4,4];
large_space_1   = 17;

large_sockets_2 = [3,3,3];
large_space_2   = 13;

large_sockets_3 = [2,2,2];
large_space_3   = 10;

depth           = 5;
rows            = 2;

function get_width(length_vec,sockets,space) = length_vec[len(length_vec)-1]
                                             + sockets[len(sockets)-1]
                                             + space*(len(sockets)-1)
                                             + 2*space;

// calculate total length for connectors
small_length_vec_1      = partialsum(small_sockets_1,0,len(small_sockets_1)-1);
small_length_vec_2      = partialsum(small_sockets_2,0,len(small_sockets_2)-1);
small_length_vec_3      = partialsum(small_sockets_3,0,len(small_sockets_3)-1);
small_length_vec_4      = partialsum(small_sockets_4,0,len(small_sockets_4)-1);
small_width_1       = get_width(small_length_vec_1,small_sockets_1,small_space);
small_width_2       = get_width(small_length_vec_2,small_sockets_2,small_space);
small_width_3       = get_width(small_length_vec_3,small_sockets_3,small_space);
small_width_4       = get_width(small_length_vec_4,small_sockets_4,small_space);
small_width         = small_width_1+small_width_2+small_width_3+small_width_4;
             
large_length_vec_1      = partialsum(large_sockets_1,0,len(large_sockets_1)-1);
large_length_vec_2      = partialsum(large_sockets_2,0,len(large_sockets_2)-1);
large_length_vec_3      = partialsum(large_sockets_3,0,len(large_sockets_3)-1);  
large_width_1       = get_width(large_length_vec_1,large_sockets_1,large_space_1);
large_width_2       = get_width(large_length_vec_2,large_sockets_2,large_space_2);
large_width_3       = get_width(large_length_vec_3,large_sockets_3,large_space_3);
large_width         = large_width_1+large_width_2+large_width_3;
             
width = max(small_width,large_width);

#translate([0,
           3/2*max(large_space_1,large_space_3,large_space_3)+max(len(large_length_vec_1),len(large_length_vec_2),len(large_length_vec_3)),
           0])
{
    screwdrivers(small_sockets_1,small_space,depth,gap=true);
    translate([small_width_1,0,0])
    {
        screwdrivers(small_sockets_2,small_space,depth,gap=true);
    }
    translate([small_width_2+small_width_1,0,0])
    {
        screwdrivers(small_sockets_3,small_space,depth,gap=true);
    }
    translate([small_width_3+small_width_2+small_width_1,0,0])
    {
        screwdrivers(small_sockets_4,small_space,depth,gap=true);
    }
}

screwdrivers(large_sockets_1,large_space_1,depth,gap=false);
translate([large_width_1,0,0])
{
    screwdrivers(large_sockets_2,large_space_2,depth,gap=false);
}
translate([large_width_2+large_width_1,0,0])
{
    screwdrivers(large_sockets_3,large_space_3,depth,gap=false);
}


pegs_lux(width,rows);
cube([width,depth,34]);
