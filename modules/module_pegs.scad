module pegs_lux(width,rows)
{
    dia_knob    = 8;
    len_knob    = 3;
    dia_pin     = 4;
    wall        = 2;
    dist        = 37;
    height      = 25;
    
    pegs(dist,height,wall,dia_knob,len_knob,dia_pin,rows);
}

module pegs_hornbach(width,rows)
{
    dia_knob    = 8;
    len_knob    = 3;
    dia_pin     = 4;
    wall        = 2;
    dist        = 45;
    height      = 45;
    
    pegs(dist,height,wall,dia_knob,len_knob,dia_pin);
}

module pegs(dist,height,wall,dia_knob,len_knob,dia_pin,rows)
{
    for(off_y=[0:height:(rows-1)*height])
    {
        translate([dia_knob/2,0,off_y+dia_knob/2])
        {
            for(i=[0:dist:width-dia_knob])
            {
                translate([i+((width-dia_knob)%dist)/2,0,0])
                {
                    peg(wall,dia_knob,len_knob,dia_pin);
                }
            }
        }
    }
}

module peg(wall,dia_knob,len_knob,dia_pin)
{
    rotate([90,0,0])
    {
        translate([0,0,wall])
        {
            cylinder(h=len_knob,d=dia_knob);
        }
        translate([0,0,0])
        {
            cylinder(h=wall,d=dia_pin);
        }
    }
}