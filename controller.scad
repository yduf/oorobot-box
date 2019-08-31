use <pont.scad>
include <arduino.scad>

module controller_impl( mat = false, hole=false, equip = false) {
    translate([ 4, 25, 26.5])
    rotate([0, 90, 0])
    
    if( hole) {
        Arduino( solid_holes=1, combined_headers=0, extend_ports=1);    }
    else {
        Arduino( false, false, false);
    }
}

module controller( mat = false, hole=false, equip = false) {
    if( mat) {
        T();
    }
    
    if( hole) {
        controller_impl( hole=true);
    }
    
    if( equip) {
        controller_impl( equip=true);
    }
}


difference() {
controller(mat=true);
controller(hole=true);
}

controller(equip=true);
