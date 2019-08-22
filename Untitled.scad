use <roundbox.scad>
use <lcd.scad>
use <ULN2003.scad>
use <28BYJ.scad>
use <pont.scad>


include <arduino.scad>

width = 96;
height = 60;
length = 150;
thick  = 3;

// chassis
module chassis() {
difference()
{
cube([ length, width, height], center=true);

color("cyan")
translate([0, 0, thick])
rotate([0, 90, 0]) {
l = length + 2*thick;
translate([0, 0, -l/2])
roundedRect([height, width-2*thick, l], 3);
}
}
}

module case() {
intersection() {
chassis();

color("blue")
translate([0, 0, -50])
rotate([90, 0, 0])
cylinder( h = width + 10, r=100, center = true, $fn=1000);
}
}


module motors( support=false, screw_hole=false, motor=true ) {
axe_pos = 0;

translate([axe_pos, 96.1/2, 0])
28BYJ(support, screw_hole, motor);

translate([axe_pos, -96.1/2, 0])
rotate([ 0, 0, 180]) 
28BYJ(support, screw_hole, motor);
}

// color("blue") battery_case();
module caisse() {
difference() {
union() {
case();
motors(support=true, screw_hole=false, motor=false);
}
motors(support=false, screw_hole=true);
}

translate([ 23, 0, 0])
T();

translate([ -55, 0, 0])
T();

}

module full_equip() {
    //caisse();
    translate([60, -40,  30])
rotate([10, 0, 90])
lcd();

// projection(cut = true)
translate([20, -25,  25])
rotate([0, 90, 180])
Arduino( false, false, false);

module battery_case() {
  translate([ -30, 0, 10]){
    color([1,0.8,0]) {
      cube([18, 93, 60], center=true);
    }
    translate([-14, 0, 0]){
      cube([10, 80, 60], center=true);
    }
  }
}

translate([-60, 10,  30])
rotate([0, 90, 0])
ULN2003();

translate([-60, -45,  30])
rotate([0, 90, 0])
ULN2003();

color("blue")
battery_case();

}

module cover() {
translate([0, 96/2])
rotate([90, 0, 0])
color("lightBlue")
linear_extrude( 96 ) 
    { 
difference() {
//offset(r = 8)
projection()
linear_extrude( height=96,  scale=1.05 ) 
translate([0, 2])
projection()
rotate([-90, 0, 0])
case();

projection(false)
rotate([-90, 0, 0])
case(); 
       
/*translate([0, -35])
square([1000, 10], center=true);
*/}
        
}
}

module cover_hole() {
difference() {
    cover();
    translate([ 3, 3, 0])
    scale([ 1.1, 1.1, 1]) {
        full_equip();
    }
}
}

cover_hole();

//motors();
//case();
//full_equip();

