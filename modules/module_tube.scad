module tube(width,height,wall)
{
    translate([width/2,width/2,0])
    difference()
    {
        union()
        {
            cylinder(d=width,h=height);
            translate([0,-width/4,height/2])
            {
                cube([width,width/2,height],center=true);
            }
        }
        translate([0,0,wall])
        {
            cylinder(d=width-2*wall,h=height-wall);
        }
    }
}

