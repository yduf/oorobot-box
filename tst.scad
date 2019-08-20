// creuse les support des cotés
/*module _side_remove() {
  difference() {
    translate([10, -40, 0]){
      rotate([90, 0, 0]){
        scale([2, 1, 1]){
          color([1,0.8,0]) {
            cylinder(r1=28, r2=20, h=12, center=true);
          }
        }
      }
    }

    translate([axe_pos, -43, 7.5]){
      rotate([90, 0, 0]){
        color([1,0.8,0]) {
          cylinder(r1=12, r2=20, h=6, center=true);
        }
      }
    }
  }
}

  translate([0, 0, 0]){
    _side_remove();
    mirror([0,1,0]){
      _side_remove();
    }
  }

  */
  
screen_height = 35;
min_materail = true;
axe_pos = 0;
arduino_pos = axe_pos - 34;
pen_raduis = 7;
eyes_pos = arduino_pos + -20;


//    translate([axe_pos, -43, 7.5])
rotate([90, 0, 0])
cylinder(r1=12, r2=20, h=6, center=true);
     
    
