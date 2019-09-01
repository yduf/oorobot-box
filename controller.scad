use <pont.scad>
use <roundbox.scad>

include <arduino.scad>

module controller_impl( mat = false, hole=false, equip = false) {
    translate([ 5, 24, 26.5])
    rotate([0, 90, 0])
    
    if( hole) {
        Arduino( solid_holes=1, combined_headers=0, extend_ports=1);

        // USB
        color("green")
        translate([ -40, -12, 7])        
        rotate([0, 90, 0])
        roundedRect([12, 12, 30], 3);
        
        // power
        color("red")
        translate([ -40, -43, 7])        
        rotate([0, 90, 0])
        roundedRect([12, 12, 30], 3);
        
        // chassis
        color("cyan")
        translate([ -40, -25, 1])        
        rotate([0, 90, 0])
        roundedRect([3, 55, 30], 3);        
    } else {
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

//controller(equip=true);

controller(hole=true);
