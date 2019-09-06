include <NopSCADlib/lib.scad>
use <roundbox.scad>
use <M3.scad>

// screw
module LCD1602A( hole = false, model = true ) {
h = 15;
type = LCD1602A;
    
    if( hole) {
        color("cyan") {
        translate([ 0, 0, -1.5*h])        
        pcb_screw_positions(LCD1602APCB)
        M3_hole(depth=h);
    
        //      display_aperture( type, 2, false);
        translate([ 0, 0, -4])        
        roundedRect([73, 28, 30], 3);
    }
}
    if( model) {
        rotate([180, 0, 0])
        display(type);
    }    
}


LCD1602A( hole = true);

