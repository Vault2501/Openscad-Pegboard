row1=[4,4,4,4,4,4,4];
row2=[2,2,1,1,2,2,2];
row3=[2,2,1,1,2,2,2];
row1_depth=0;
row2_depth=4+2*3;
row3_depth=4+2+4*3;
space=3;
depth=5;
angle=0;

size_arrays=[row1,row2,row3];
row_size_array=[row1_depth,row2_depth,row3_depth];

multi_sockets(size_arrays,row_size_array,space,depth,angle);

function partialsum(list,start,end) = [for (sum=0, i=start; i<=end; nsum=sum+list[i], i=i+1, sum=nsum) sum];
function notfirst(list,index) = (index==0 ? 0 : list);


module multi_sockets(size_arrays,row_size_array,space,depth,angle)
{
    for(count=[0:1:len(size_arrays)-1])
    {
        size_array=size_arrays[count];
        echo(max(notfirst(size_arrays[count-1],count)));
        translate([0,row_size_array[count],0])
        {
            width = max(size_array)+2*space;
            height = depth+space;
            length_vec      = partialsum(size_array,0,len(size_array)-1);
            total_length    = length_vec[len(length_vec)-1]
                            + size_array[len(size_array)-1]
                            + space*(len(size_array)-1)
                            + 2*space;
            
            // upper wedge
            rotate([90,0,90])
            {
                linear_extrude(height = total_length)
                {
                    polygon([[0,0],[0,height*cos(angle)],[height*sin(angle),height*cos(angle)]]);
                }
            }

            // lower wedge
            translate([0,0,0.000001]) // fix for non manifold
            {
                rotate([0,90,0])
                {
                    linear_extrude(height = total_length)
                    {
                        polygon([[0,0],[width*sin(angle),0],[width*sin(angle),width*cos(angle)]]);
                    }
                }
            }

            // main body
            rotate([-angle,0,0])
            {
                difference()
                {
                    cube([total_length,width,depth+space]);
                    
                    for(num=[0:1:len(size_array)-1])
                    {
                        off=partialsum(size_array,0,num);
                        translate([off[num]+size_array[num]/2+num*space+space,
                                   size_array[num]/2+space,
                                   space])
                        {
                            cylinder(h=depth,d=size_array[num]);
                            translate([0,0,depth-2])
                            {
                                cylinder(h=2,d1=size_array[num],d2=size_array[num]+2);
                            }
                        }
                    }
                }
            }
        }
    }
}