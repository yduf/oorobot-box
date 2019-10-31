// render cover
include <chassis.scad>
include <main.scad>

use <renfort.scad>

cov_width = 96;
cov_height = 73; //120+3-80+30;        // =73 - need to be adjusted according to chassis
cov_length = 150;
cov_thick  = 3;

module z_box() {
translate([ 0, 0, 30])
box();
}


module cover_impl() {
    difference() 
    {
    color("blue")
    resize([ cov_length + cov_thick, cov_width, cov_height + cov_thick])
    z_box();

    
    color("cyan") 
    translate([ 0, 0, -0.1])
    resize([ cov_length, cov_width + cov_thick, cov_height+0.1])
    z_box();
    
    }
}

module cover() {
    difference() 
    {
    translate([ 0, 0, -30])
    cover_impl();

    caisse(hole=true);
    }    
}

module cover_wo_keyb() {
    intersection() 
    {
        cover();
        
        color("red")
        union() {
            translate([ -15, 0, 0])
            cube([ length, width + 10, height + 20], center=true);
            
            band=22;
            translate([ 0, (width - band)/2, 0])
            cube([ length+10, band, height + 20], center=true); 
        }      
    }
    
        
    translate([ -7, 0, cov_height - 30])
    rotate([ 90, 0, 0])
    renfort(h=80,r=2);
}

rotate([ -90, 0, 0])
cover_wo_keyb();

//translate([ 0, 0, -3]) caisse(equip=true,mat=true);
