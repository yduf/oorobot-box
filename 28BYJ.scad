include <NopSCADlib/lib.scad>
use <M3.scad>

module 28BYJ_model()
    layout([for(g = geared_steppers) geared_stepper_screw_positions(g)], 5)
        geared_stepper(geared_steppers[$i]);


module 28BYJ_hole() {
    h = 20;

    rotate([0, 270, 90])
    {
        // motor
        union() {
          color("grey")
          cylinder(r1=14.2, r2=14.2, h, center=false);
          
          color("lightBlue")
          translate([0, -8.5, 0])
          cube([13, 17, h], center=false);

          color("cyan")
          translate([13, 0, 0])
          cylinder(r1=8.5, r2=8.5, h, center=false);
      }
        
      // screw
      M3_hole([0, 17.5, 0], h);
      M3_hole([0, -17.5, 0], h);
  }
}

module 28BYJ_stepper(support = false, hole=false, motor=true) {
    rotate([ 90, 180, 0]) {

        if( motor) {
            28BYJ_model();
        }
        
        translate([0, -8, 0]){     
            if( hole ) {
                rotate([ 90, 180, 0]) 
                28BYJ_hole();
            }
        
            if( support) {
                z = 3;
                translate([0, 0, 0.1])
                cylinder(r1=25, r2=12, h=9, center=false);
            }
        }
    }
}

28BYJ_stepper( support=true, hole=true);
