

module wrench(count,width,angle)
{
    height=15;
    height_min=height;
    height_growth=1;
    gap=5;
    gap_growth=0.2;
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
        difference()
        {
            for(num=[0:1:count-1])
            {
                translate([0,0,num*(gap_min+(num*gap_growth)+holder_thickness)])
                {
                    difference()
                    {
                        rotate([angle,0,0])
                        {
                            cube([holder_width,height_min+(height_growth*num),holder_thickness]);
                        } 
                        translate([0,
                                   cos(angle)*(height_min+(height_growth*num))-sin(angle)*holder_thickness+1,
                                   sin(angle)*(height_min+(height_growth*num))-tan(angle)*(sin(angle)*holder_thickness)])
                        {
                            #cube([holder_width,
                                   sin(angle)*holder_thickness,
                                   holder_thickness/cos(angle)]);
                        }
                    }
                }
            }
            cutoff=10;
            translate([0,-cutoff,0])
            {
                #cube([holder_width,cutoff,count*(gap_min+(count*gap_growth)+holder_thickness)]);
            }
        }
    }
}

