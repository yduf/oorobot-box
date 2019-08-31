include <NopSCADlib/lib.scad>

use <pont.scad>
use <ZC-A0591.scad>

module driver_impl( mat = false, hole=false, equip = false) {
    translate([-4, 23, 21])
    rotate([0, 90, 0]) {

        rotate([ 180, 0, 180])    
        ZC_A0591(equip=equip, hole=hole);

        translate([ 0, -52,  0])
        rotate([ 180, 0, 180])    
        ZC_A0591(equip=equip, hole=hole);
    }
}

module driver( mat = false, hole=false, equip = false) {
    
    if( mat) {
        translate([ 0, 0, 20])
        resize([ 3, 96, 40])
        T();
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

driver(equip=true);



