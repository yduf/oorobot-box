include <NopSCADlib/lib.scad>

ZC_A0591 = ["ZC_A0591", "ZC_A05912", 35, 32, 1.6, 0,    2.5,   0, "green", false, 
    [[2.25, 3.25], [-2.25, 3.25], [2.25, -3.25], [-2.25, -3.25]],   // hole position relative to border
    // BOM
    [
    [ 8, 20, 90, "2p54header", 4, 1],
    [ 15,  5, 0, "2p54header", 4, 1],
    [ 15, 22, 0, "chip", 8.3, 19.2, 8.5, "black"],
    [ 23, 25, 0, "molex_hdr", 5, 1],
    ], [], M2p5_pan_screw];


module ZC_A0591() {
    h = 10;
    type = ZC_A0591;
    top_screw = pcb_holes( type)[0];
    
    // screw
    color("cyan") {
    translate([ 0, 0, -h])        
        pcb_screw_positions(type)
        cylinder(r1=1.5, r2=1.5, h, center=false);
    }
    
    pcb(type);

    translate([ 12, -4, 1.6])
    rotate([ 0, 0, 90])
    layout([for(l = [LED3mm,LED3mm,LED3mm,LED3mm]) led_diameter(l)], 1)
    led(LED3mm, "red");

}

ZC_A0591();

