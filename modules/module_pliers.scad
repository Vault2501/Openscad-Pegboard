module pliers(length,width)
{
    height = 30;
    height_bar = 10;
    width_bar = 5;
    top_bar = 1;
    side_width = 3;
    back_width = 2;
    
    // backside
    cube([length,back_width,height]);
    
    // front bar
    translate([0,width-width_bar,height-height_bar])
    {
        rotate([90,0,0])
        {
            rotate([0,90,0])
            {
                linear_extrude(length)
                {
                    polygon([[0,0],[0,height_bar],[top_bar,height_bar],[width_bar,0]]);
                }
            }
        }
    }
    
    // side panels
    side_panel();
    translate([length-side_width,0,0])
    {
        side_panel();
    }
    
    module side_panel()
    {
        translate([side_width,0,0])
        {
            rotate([0,-90,0])
            {
                linear_extrude(side_width)
                {
                    polygon([[0,0],
                             [height,0],
                             [height,width-width_bar+top_bar],
                             [height-height_bar,width],
                             [height-height_bar,width-width_bar],
                             [0,back_width]]);
                }
            }
        }
    }
}