include <../openscad-libraries/functions.scad>

module screwdriver(array,gap,height,width=0,depth=0,open=false,back=false,factor=4,depth_back=2,height_back=34)
{   
    width=max(width,getSum(array,gap)+gap);
    depth=max(depth,max(array)+2*gap);
    
    // create array of openings
    //openings = [for (out=array[0]/3, i=1; i<=len(array); out=array[i]/3, i=i+1) out];
    openings = multiply(array,factor);
    
    echo("Sizes of openings: ",openings);
    echo("Total width: ",width);
    echo("Total depth: ",depth);
    

    if(back)
    {
        translate([0,2*depth_back,0])
        {
            part_front();
        }
        part_back();
    }
    else
    {
        part_front();
    }
    
    module part_back()
    {
        rotate([0,90,0])
        {
            linear_extrude(width)
            {
                polygon([[0,0],
                         [0,2*depth_back],
                         [-height,2*depth_back],
                         [-height-depth_back,depth_back],
                         [-height_back,depth_back],
                         [-height_back,0]]);
            }
        }
    }

    module part_front()
    {
        difference()
        {
            part_body();
            holes();
        }
    }
     
    module part_body()
    {
        if(open)
        {
            part_tips();
        }
        cube([width,depth,height]);
    }
    
    module holes()
    {
        offx=getDistances(array,gap);
        
        translate([gap,0,0])
        {
            for(i=[0:1:len(array)-1])
            {
                translate([offx[i]+array[i]/2,depth/2,0])
                {
                    cylinder(d=openings[i],h=height);
                    translate([0,0,height/2])
                    {
                        cylinder(d=array[i],h=height/2);
                    }
                }
                if(open)
                {
                    translate([offx[i]+array[i]/2-openings[i]/2,depth/2,0])
                    {
                        cube([openings[i],depth/2+height,2*height]);
                    }
                }

            }
        }  
    }
    
    module part_tips()
    {
        translate([0,depth,height])
        {
            rotate([0,90,0])
            {
                linear_extrude(width)        
                {
                    polygon([[0,0],[-height+1,height-1],[-height+1,height],[0,height],[height,0]]);
                }
            }
        }
    }
}
