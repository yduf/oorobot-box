include <NopSCADlib/lib.scad>

use <LCD1602A.scad>
use <ZC-A0591.scad>
use <28BYJ.scad>
use <pont.scad>
use <chassis.scad>

use <roundbox.scad>


include <arduino.scad>


module motors( support=false, hole=false, motor=true ) {
axe_pos = 0;

translate([axe_pos, 96.1/2, 0])
28BYJ_stepper(support, hole, motor);

translate([axe_pos, -96.1/2, 0])
rotate([ 0, 0, 180]) 
28BYJ_stepper(support, hole, motor);
}

// color("blue") battery_case();
module caisse() {
difference() {
union() {
case();
motors(support=true, hole=false, motor=false);
}
motors(support=false, hole=true, motor=false);
}

translate([ 23, 0, 0])
T();

translate([ -44, 0, 0])
T();

}

module full_equip( hole=false) {
translate([41, 0,  35])
rotate([18, 0, 90]) {
    
LCD1602A(hole=hole, model=!hole);

support_LCD( length = 96, width=42);

}

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

translate([-48, 23,  12])
rotate([0, 90, 0]) {

rotate([ 180, 0, 180])    
ZC_A0591();

translate([ 0, -52,  0])
rotate([ 180, 0, 180])    
ZC_A0591();
}

// color("blue") battery_case();

}



module cover_hole() {
difference() {
    cover();
    translate([ 3, 3, 0])
    scale([ 1.1, 1.1, 1]) {
        full_equip(hole=true);
    }
}
}

//cover_hole();

motors();
//case();
caisse(); full_equip();

translate([ 73, 0, -2])
rotate([75, 0, 90])
support_LCD( length = 96, width=50);


translate([ -38, 0, 41])
rotate([-18, 0, 90])
support_LCD( length = 96, width=20);

battery_w = 70;
battery_l = 30;
battery_h = 120;

color("white")
translate([ -24, 0, -27])
rotate([0, 0, 90])
roundedRect([battery_w, battery_l, battery_h], 3);

