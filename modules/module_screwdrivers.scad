sockets=[13,12,10];
space=1;
thickness=3;
depth=0;

holes(array=sockets,gap=space,height=thickness,open=false);
body(array=sockets,gap=space,height=thickness,depth=depth,open=false);

function getDistances(array,gap=0) = [for (sum=0, i=0; i<=len(array); sum=sum+array[i]+gap, i=i+1) sum];
function getLength(array,gap=0) = getDistances(array,gap)[len(array)];



module body(array,gap,height,depth=0,open)
{
    width=getLength(array,gap)+gap;
    real_depth=max(depth,max(array));
    cube([width,real_depth,height]);
}

module holes(array,gap,height,open)
{
    offx=getDistances(array,gap);
    
    translate([gap,0,0])
    {
        for(i=[0:1:len(array)-1])
        {
            translate([offx[i]+array[i]/2,array[i]/2,0])
            {
                #cylinder(d=array[i],h=height);
            }
        }
    }  
}