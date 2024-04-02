module pliers(width,depth=30,height=40)
{
    height_bar = 10;
    depth_bar = 5;
    top_bar = 1;
    side_depth = 3;
    back_depth = 2;
    
    // backside
    cube([width,back_depth,height]);
    
    // front bar
    translate([0,depth-depth_bar,height-height_bar])
    {
        rotate([90,0,0])
        {
            rotate([0,90,0])
            {
                linear_extrude(width)
                {
                    polygon([[0,0],[0,height_bar],[top_bar,height_bar],[depth_bar,0]]);
                }
            }
        }
    }
    
    // side panels
    side_panel();
    translate([width-side_depth,0,0])
    {
        side_panel();
    }
    
    module side_panel()
    {
        translate([side_depth,0,0])
        {
            rotate([0,-90,0])
            {
                linear_extrude(side_depth)
                {
                    polygon([[0,0],
                             [height,0],
                             [height,depth-depth_bar+top_bar],
                             [height-height_bar,depth],
                             [height-height_bar,depth-depth_bar],
                             [0,back_depth]]);
                }
            }
        }
    }
}