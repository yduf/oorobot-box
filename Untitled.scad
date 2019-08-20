use <roundbox.scad>
use <lcd.scad>

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

intersection() {
chassis();

color("blue")
translate([0, 0, -50])
rotate([90, 0, 0])
cylinder( h = width + 10, r=100, center = true, $fn=1000);
}

translate([60, -40,  30])
rotate([10, 0, 90])
lcd();

// projection(cut = true)
translate([20, -30,  25])
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

color("blue")
battery_case();

