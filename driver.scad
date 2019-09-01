include <NopSCADlib/lib.scad>

use <roundbox.scad>
use <pont.scad>
use <ZC-A0591.scad>

module ZC_A0591_impl( mat = false, hole=false, equip = false) {
    rotate([ 180, 0, 180])    
    ZC_A0591(equip=equip, hole=hole);
    
    if( hole) {
        // led
        color("red")
        translate([ -12, 3, -30])        
        //rotate([0, 90, 0])
        roundedRect([1, 15, 30], 1);
    }
}


module driver_impl( mat = false, hole=false, equip = false) {
    translate([-4, 23, 24])
    rotate([0, 90, 0]) {

        translate([ 0, 2,  0])
        ZC_A0591_impl(equip=equip, hole=hole);

        translate([ 0, -52,  0])
        ZC_A0591_impl(equip=equip, hole=hole);

    }
}

module driver( mat = false, hole=false, equip = false) {
    
    if( mat) {
        translate([ 0, 0, 15])
        //resize([ 3, 96, 40])
        T2();
    }
    
    if( hole) {
        driver_impl( hole=hole);
    }
    
    if( equip) {
        driver_impl( equip=equip);
    }
}

difference() {
driver(mat=true);
driver(hole=true);
}

driver(equip=true, hole=true);



