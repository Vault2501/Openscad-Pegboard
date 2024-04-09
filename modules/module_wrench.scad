

module wrench(count,width,gap,gap_growth,angle)
{
    height=15;
    height_min=height;
    height_growth=1;
    holder_width=10;
    holder_thickness=5;
    height_plate=14;
    
    gap_min=gap/cos(angle);
    
    translate([0,height_plate,0])
    {
        holders();
        translate([width-holder_width,0,0])
        {
            holders();
        }
    }
    cube([holder_width,height_plate,count*(gap_min+(count*gap_growth)+holder_thickness)]);
    translate([width-holder_width,0,0])
    {
        cube([holder_width,height_plate,count*(gap_min+(count*gap_growth)+holder_thickness)]);
    }
    cube([width,2,count*(gap_min+(count*gap_growth)+holder_thickness)]);
    
    module holders()
    {
        translate([0,0,0])
        {
            difference()
            {
                for(num=[0:1:count-1])
                {
                    translate([0,-sin(abs(angle))*holder_thickness,num*(gap_min+(num*gap_growth)+holder_thickness)+holder_thickness/tan(abs(angle))])
                    {
                        difference()
                        {
                            rotate([angle,0,0])
                            {
                                cube([holder_width,height_min+(height_growth*num),holder_thickness]);
                            } 
                            translate([0,
                                       cos(abs(angle))*(height_min+(height_growth*num))+1,
                                       -sin(abs(angle))*(height_min+(height_growth*num))+(cos(abs(angle))*holder_thickness)-holder_thickness])
                            {
                                #cube([holder_width,
                                       sin(abs(angle))*holder_thickness,
                                       holder_thickness/cos(abs(angle))]);
                            }
                        }
                    }
                }
                cutoff=10;
                translate([0,-cutoff,0])
                {
                    cube([holder_width,cutoff,count*(gap_min+(count*gap_growth)+holder_thickness)]);
                }
            }
        }
    }
}

