include <NopSCADlib/lib.scad>

// screw
module LCD1602A( hole = false, model = true ) {
h = 10;
type = LCD1602A;
    
    if( hole) {
color("cyan") {
        //translate([ 0, 0, -h])        
        //vflip()
        translate([ 0, 0, -1.5*h])        
        pcb_screw_positions(LCD1602APCB)
        cylinder(r1=1.5, r2=1.5, h, center=false);
    
        // 
    vflip()
        display_aperture( type, 2, false);
    }
}
    if( model) {
        rotate([180, 0, 0])
        display(type);
    }    
}


LCD1602A( hole = false);

//cylinder(r1=1.5, r2=1.5, h, center=false);

module support_LCD( length, width) {
    translate([0,0, -8]) 
    difference() 
    {
    rotate([0, -90, 0])
    difference() 
    {
        cylinder(r=width/2, h=length, center=true);
        
        w = length + 1;
        color("cyan")
        translate([w/2,0,0]) 
        cube(w, center=true);
    } 

    r = length / 2;
    
    color("red")
    translate([0,0, -r/1.3 -5]) 
    rotate([90, 0, 0])
    cylinder(r=r+4, h=width+1, center=true);

    color("blue")
    translate([0,0,-width/3 + 1]) 
    rotate([0, 90, 0])
    cylinder(r=width/4, h=length+1, center=true);

}

}


support_LCD(length = 96, width=40);
