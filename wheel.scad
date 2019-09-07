//!OpenSCAD
// from oorbot_wheel.scad
module roue(epaisseur) {
  union(){
    translate([0, 0, 1]){
      difference() {
        cylinder(r1=6, r2=6, h=9, center=false);

        difference() {
          cylinder(r=2.5, h=9+0.1, center=false);

          translate([1.5, -7, 0]){
            cube([5, 10, 7], center=false);
          }
          translate([-6.5, -7, 0]){
            cube([5, 10, 7], center=false);
          }
        }
      }
    }
    difference() {
      {
        $fn=200;    //set sides to 200
        cylinder(r1=45, r2=45, h=epaisseur, center=false);
      }

      for (i = [0 : abs(90) : 360]) {
        rotate([0, 0, i]){
          translate([24, 0, -0.1]){
            cylinder(r=16, h=epaisseur+0.2, center=false);
          }
        }
      }

      for (i = [0 : abs(90) : 360]) {
        rotate([0, 0, (i + 45)]){
          translate([35, 0, -0.1]){
            cylinder(r=6, h=epaisseur+0.2, center=false);
          }
        }
      }

      translate([0, 0, 0.5]){
        difference() {
          {
            $fn=200;    //set sides to 200
            cylinder(r=46, h=(epaisseur - 1), center=false);
          }

          {
            $fn=200;    //set sides to 200
            cylinder(r=44.4, h=(epaisseur - 1), center=false);
          }
        }
      }
      translate([0, 0, 2]){
        cylinder(r=2.5, h=9, center=false);
      }
    }
  }
}

roue(4.5);
screen_height = 35;
