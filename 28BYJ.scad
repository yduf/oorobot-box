module 28BYJ(support = false, screw_hole=false, motor=true) {
    h = 20;
    
      rotate([0, 270, 90])
    {
        if( motor) {
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
        }
          
        color("cyan")
        if( screw_hole) {
          translate([0, 17.5, 0])
          cylinder(r1=1.5, r2=1.5, h, center=false);
          
          translate([0, -17.5, 0])
          cylinder(r1=1.5, r2=1.5, h, center=false);
        }
        
        if( support) { union() {
            z = 3;
            translate([0, 0, 0.1])
            cylinder(r1=25, r2=12, h=9, center=false);
            //translate([0, 0, z])
            //cylinder(r1=20, r2=12, h=6, center=false);
        } }
    }
}

28BYJ( support=true, screw_hole=true);
