// http://blog.think3dprint3d.com/2014/04/OpenSCAD-PanelOne-case-design.html
// http://forum.reprapdiscount.com/threads/using-openscad-to-design-a-basic-lcd-enclosure.1471/

//LCD screen
module  ULN2003() {

//LCD screen
lcd_scrn_x=71;
lcd_scrn_y=22.54;
lcd_scrn_z=5;

lcd_board_x=35;
lcd_board_y=32;
lcd_board_z=1.6; //does not include metal tabs on base

lcd_hole_d=3.4;
lcd_hole_offset=(lcd_hole_d/2)+1;
//board edge to center of first connector hole
lcd_connect_x=10.2;
lcd_connect_y=58.4;
    
difference(){
    union(){
        color("OliveDrab")
        translate([0,0,0])
        cube([lcd_board_x,lcd_board_y,lcd_board_z]);
/*
        color("DarkSlateGray")
        translate([(lcd_board_x-lcd_scrn_x)/2,(lcd_board_y-lcd_scrn_y)/2,lcd_board_z])
        cube([lcd_scrn_x,lcd_scrn_y,lcd_scrn_z]);

        color("darkRed")
        translate([(lcd_board_x-lcd_scrn_x)/2,(lcd_board_y-lcd_scrn_y)/2,lcd_board_z])
        cube([lcd_scrn_x,lcd_scrn_y,lcd_scrn_z]);
*/    }

    for(i=[lcd_hole_offset,lcd_board_x-lcd_hole_offset]){
        for(j=[lcd_hole_offset,lcd_board_y-lcd_hole_offset]){
            translate([i,j,lcd_board_z])
            cylinder(r=lcd_hole_d/2,h=lcd_board_z+3,$fn=12,center=true);
        }
    }
}
}

ULN2003();