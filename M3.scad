module M3_hole( pos=[0, 0, 0], depth = 10, invert=false) {
    color("cyan")
    translate( pos)
    if( invert) {
        rotate([180, 0, 0])
        cylinder(r1=1.5, r2=1.5, depth, center=false, $fn=6);
    }
    else {
        cylinder(r1=1.5, r2=1.5, depth, center=false, $fn=6);
    }
}

M3_hole();
