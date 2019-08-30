use <roundbox.scad>

width = 96;
height = 80;
length = 150;
thick  = 3;

// 
module arrondis() {
    intersection() 
    {

    color("blue")
    translate([0, 0, -20])
    rotate([90, 0, 0])
    cylinder( h = width + 10, r=75, center = true, $fn=100);
    
    color("red")
    translate([0, 0, -80])
    rotate([90, 0, 0])
    cylinder( h = width + 10, r=120, center = true, $fn=100);
}
}

// chassis
module chassis() {
difference()
{
    translate([-length/2, -width/2, -30])
    cube([ length, width, height], center=false);

    color("cyan")
    translate([0, 0, 4.5*thick])
    rotate([0, 90, 0]) {
        l = length + 2*thick;
        h = height + 2*thick;
        translate([0, 0, -l/2])
        roundedRect([height, width-2*thick, l], 3);
        }
    }
}


module case() {
    intersection() 
    {
        chassis();
        arrondis();
    }
}

case();