
module roundedRectUp(size, radius)
{
    x = size[0];
    y = size[1];
    z = size[2];

    linear_extrude(height=z)
    hull()
    {
        // place 4 circles in the corners, with the given radius
        translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
        circle(r=radius);

        translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
        circle(r=radius);

        translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
        circle(r=radius);

        translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
        circle(r=radius);
    }
}

module roundedRect(size, radius, center=false) 
{
    if( center) {
        translate([ 0, 0, -size[2]/2])
        roundedRectUp(size, radius);
    }
    else {
        roundedRectUp(size, radius);
    }
}


// example
roundedRect([20, 10, 1], 3, true);
