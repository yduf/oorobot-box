//!OpenSCAD
// from oorbot_wheel.scad

// epsilon => mechanical margin for axis
module moyeu(h=7, epsilon=0.1, clean=false) {
    
  if( clean) {
        cylinder(r=6-0.1, h=h+0.2, center=true, $fn=100);
  }
  else
  union(){
      difference() 
      {
        color("red")
        cylinder(r=6, h=h, center=true, $fn=100);
 
        color("blue")
        cylinder(r=2.5+epsilon, h=h+0.2,  center=true, $fn=50);
      }
         
        color("green") {  
            shift=3+epsilon;
            translate([ shift, 0, 0])
            cube([shift, 5, h ],  center=true );  

            translate([ -shift, 0, 0])
            cube([shift, 5, h ],  center=true );  
          }
   }
}

module wheel_cut(r=48,h=10) {
      color("cyan")
      for (i = [0 : abs(90) : 360]) {
        rotate([0, 0, i])
          translate([r/2, 0, 0])
            cylinder(r=r/3, h=h, center=true, $fn=200);
      }

      color("blue")
      for (i = [0 : abs(90) : 360]) {
        rotate([0, 0, (i + 45)])
          translate([2.2*r/3, 0, 0])
            cylinder(r=r/8, h=h, center=true, $fn=200);
      }
}


module disque( h=2, r=30) {
    rr=h/4;

    pos = r/2-h/2;

    rotate_extrude(convexity = 10, $fn = 200)
    translate([pos+r/2+0.1,0])  // +0.1 for bug in the engine
    difference() 
    {
    small=rr - rr/5;
    shift=rr - 0.1;
    delta=2*rr+rr/3;
    translate([-pos,0])
    square([r, h], center=true);

    color("green")
    translate([delta,shift])
    circle(r=small, $fn = 100);

    color("green")
    translate([delta,-shift])
    circle(r=small, $fn = 100);
    }
}

module wheel( r=48,h=7.8, epsilon=0.1) {
    difference() 
    {
        disque(r=r,h=h);
        moyeu(h=h,clean=true);
        wheel_cut(r=r,h=h+10);
    }

    moyeu(epsilon=epsilon, h=h);
}

//moyeu(epsion=0.1);

//wheel_cut(48);
wheel(r=85/2, h=7.8);