include <NopSCADlib/lib.scad>

use <chassis.scad>
use <motors.scad>
use <driver.scad>
use <lcd.scad>
use <controller.scad>
use <battery.scad>


module motors_loc( mat = false, hole=false, equip = false) {
    translate([ 0, 0, -5])
    motors( mat=mat, hole=hole, equip=equip);
}

module driver_loc( mat = false, hole=false, equip = false) {
    translate([ -49, 0, -30])
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
 
module battery_loc( mat = false, hole=false, equip = false) {
    translate([ -29, 0, -27])
    battery( mat=mat, hole=hole, equip=equip);
}

module cover_pot( mat = false, hole=false, equip = false) {
  if( mat) {
    translate([ -38, 0, 41])
    rotate([-18, 0, 90])
    support_LCD( length = 96, width=20);
  }
}

module pass_cable( mat = false, hole=false, equip = false) {
    r = 1.5;
    h = 25;
  if( mat) {
    translate([ -40, 0, -30])
    color("orange") {   
        translate([ 0, 40, 0])
        cylinder(r=r, h=h, center=false);

        translate([ 20, 40, 0])
        cylinder(r=r, h=h, center=false);

        translate([ -1, -40, 0])
        cylinder(r=r, h=h, center=false);

        translate([ 20, -40, 0])
        cylinder(r=r, h=h, center=false);
    }
  }
}

module keyboard( mat = false, hole=false, equip = false) {
  if( mat) {
    translate([ 73, 0, -2])
    rotate([75, 0, 90])
    support_LCD( length = 96, width=50);
  }
}

module caisse_impl( mat = false, hole=false, equip = false) {
    if( mat) {
        case();
        motors_loc( mat=mat);
        driver_loc( mat=mat);
        lcd_loc( mat=mat);
        controller_loc( mat=mat);
        battery_loc( mat=mat);
        cover_pot( mat=mat);
        pass_cable( mat=mat);
        keyboard( mat=mat);
    }

    if( hole) {
        motors_loc( hole=hole);        
        driver_loc( hole=hole);
        lcd_loc( hole=hole);
        controller_loc( mat=mat);
        battery_loc( mat=mat);   
    }
    
    if( equip) {
        motors_loc( equip=equip);
        driver_loc( equip=equip);
        lcd_loc( equip=equip);
        controller_loc( equip=equip);
        battery_loc( equip=equip);
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

caisse(mat=true, equip=false);