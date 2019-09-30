use <roundbox.scad>
use <M3.scad>

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
    cylinder( h = width + 10, r=120+3, center = true, $fn=100);
}
}


module box() {
    intersection() 
    {
        //chassis();
        translate([-length/2, -width/2, -30])
        cube([ length, width, height], center=false);

        arrondis();
    }
}


module front_bump() {
difference() 
{
 box();

color("violet")
translate([ 2, 0, 0])
cube([ length, width+thick, height], center=true);

color("green")
translate([ 0, 0, 20])
cube([ length, width+thick, height], center=true);
}
}

// chassis
module chassis() {
difference()
{
    box();

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


module case( mat=false, hole=false) {
    if( mat) {
        chassis();
        front_bump();
    }
    
    if( hole) {
        translate([ -60, 0, -24.5])
        rotate([ 0, -90, 0])        
        M3_hole( depth=25);
    }
}

//arrondis();
//case(mat=true);
