include <NopSCADlib/lib.scad>

// screw
module LCD1602A( hole = false, model = true ) {
h = 15;
type = LCD1602A;
    
    if( hole) {
color("cyan") {
        //translate([ 0, 0, -h])        
        //vflip()
        translate([ 0, 0, -1.5*h])        
        pcb_screw_positions(LCD1602APCB)
        cylinder(r1=1.5, r2=1.5, h, center=false);
    
        // 
//    vflip()
  //      display_aperture( type, 2, false);
    }
}
    if( model) {
        rotate([180, 0, 0])
        display(type);
    }    
}


LCD1602A( hole = false);

