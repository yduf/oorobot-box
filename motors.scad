use <28BYJ.scad>        // motors


module motors_impl( support=false, hole=false, motor=false ) {
axe_pos = 0;

    translate([axe_pos, 96.1/2, 0])
    28BYJ_stepper(support, hole, motor);

    translate([axe_pos, -96.1/2, 0])
    rotate([ 0, 0, 180]) 
    28BYJ_stepper(support, hole, motor);
}

module motors( mat = false, hole = false, equip = false ) {
    if( mat) {
        motors_impl( support=true);
    }
    
    if( equip) {
        motors_impl( motor=true);        
    }
    
    if( hole) {
        motors_impl( hole=true);
    }
}

difference() {
motors(mat=true);
motors(hole=true);
}

motors(equip=true);
