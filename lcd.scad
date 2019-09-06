include <NopSCADlib/lib.scad>
use <LCD1602A.scad>
use <M3.scad>


module support_LCD( length, width) {
    translate([0,0, -9]) 
    difference() 
    {
    rotate([0, -90, 0])
    difference() 
    {
        cylinder(r=width/2, h=length, center=true);
        
        w = length + 1;
        color("lightblue")
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

    color("yellow")
    cube(length-27, center=true);
}

}

module lcd( mat = false, hole=false, equip = false) {
    if( mat) {
        support_LCD(length = 96, width=42);
    }
    
    if( hole) {
        LCD1602A(hole=hole, model=false);

        v=18;
        M3_hole([ -43, v, 10], depth=50, invert=true);
        M3_hole([  43, v, 10], depth=50, invert=true);        
    }
    
    if( equip) {
        LCD1602A(model=true);
    }
}


difference() {
lcd(mat=true);
lcd(hole=true);
}

lcd(equip=true,hole=true);


