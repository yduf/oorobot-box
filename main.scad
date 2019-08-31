include <NopSCADlib/lib.scad>

use <chassis.scad>
use <motors.scad>
use <driver.scad>
use <lcd.scad>
use <controller.scad>

module driver_loc( mat = false, hole=false, equip = false) {
    translate([ -44, 0, 0])
    driver( mat=mat, hole=hole, equip=equip);
}


module lcd_loc(
 mat = false, hole=false, equip = false) {
    translate([42, 0,  34.5])
    rotate([-18.5, 0, -90])
    lcd( mat=mat, hole=hole, equip=equip);
}

module controller_loc( mat = false, hole=false, equip = false) {
    translate([ 17, 0, 0])
    rotate([0, 0, 180])
    controller( mat=mat, hole=hole, equip=equip);
}
 
module caisse_impl( mat = false, hole=false, equip = false) {
    if( mat) {
        case();
        motors( mat=mat);
        driver_loc( mat=mat);
        lcd_loc( mat=mat);
        controller_loc( mat=mat);
    }

    if( hole) {
        motors( hole=hole);        
        driver_loc( hole=hole);
        lcd_loc( hole=hole);
        controller_loc( hole=hole);
   
    }
    
    if( equip) {
        motors( equip=equip);
        driver_loc( equip=equip);
        lcd_loc( equip=equip);
        controller_loc( equip=equip);
    }
    
}

module caisse(mat = false, hole=false, equip = false) {
    if( mat) {
        difference() {
        caisse_impl(mat=true);
        caisse_impl(hole=true);
        }
    }
    
    if(equip) {
        caisse_impl(equip=equip);
    }
}

caisse(mat=true, equip=true);