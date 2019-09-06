use <roundbox.scad>
use <M3.scad>


module bille_screw( pos, mat=false, hole=false) {
    if( mat) {
        translate([0, 0, -6])
        translate(pos)
        cylinder(r=3, h=6, center=false);
    }

    if( hole) {
        // screw
        h = 10;
        translate([0, 0, 2]) 
        M3_hole(pos, h, invert=true);
    }
}

module bille_equip() {
    h = 16.5;
   roundedRect([ 5, 49, 1], 1);

    cylinder(r=28.5/2, h=h, center=false);

    translate([0, 0, h])    
    sphere(15/2,center = true);
}

module bille_impl( mat=false, hole=false, equip=false) {
    d= 39.2/2;
    screw_pos=[0, d, 0];
    bille_screw(screw_pos, mat=mat, hole=hole);    
    rotate([0, 0, 180])
    bille_screw(screw_pos, mat=mat, hole=hole);
    

}

module bille( mat=false, hole=false, equip=false) {
    bille_impl( mat=mat, hole=hole, equip=equip);
    
    if( equip) {
        difference() {
        color("silver")
        bille_equip(mat=true);
        bille_impl(hole=true);
        }
     } 
}

difference() {
bille(mat=true);
bille(hole=true);
}

bille(equip=true,hole=false);

