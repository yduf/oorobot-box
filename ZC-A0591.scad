include <NopSCADlib/lib.scad>
use <M3.scad>

// ecartement 27.2mm/32
//  32 - 2x2.25 => 27.5mm
// 30.5mm/35
//  35 - 2x3.25 => 29.5mm

ZC_A0591 = ["ZC_A0591", "ZC_A05912", 
    35, // length
    32.10, // width
    1.6, // thickness
    0,   // corner radius
    2.5, // mounting hole diameter
    0, // pad around hole
    "green", 
    false, //! True if the parts should be separate BOM items
    // allows negative ordinates to represent offsets from the far edge
    [[3.25, 2.25], [-3.25, 2.25],
    [3.25, 2.25+ 26.10], [-3.25, 2.25+ 26.10]],   // hole position relative to border
    // BOM
    [
    [ 8, 20, 90, "2p54header", 4, 1],
    [ 15,  5, 0, "2p54header", 4, 1],
    [ 15, 22, 0, "chip", 8.3, 19.2, 8.5, "black"],
    [ 23, 25, 0, "molex_hdr", 5, 1],
    ], [], M2p5_pan_screw];


module ZC_A0591(equip=true,hole=false) {
    h = 7;
    type = ZC_A0591;
    top_screw = pcb_holes( type)[0];
    
    // screw
    if( hole) {
        color("cyan") {
        translate([ 0, 0, -h])        
            pcb_screw_positions(type)
            M3_hole(depth=h);
        }
    }
    
    if( equip) {
        pcb(type);

        translate([ 12, -4, 1.6])
        rotate([ 0, 0, 90])
        layout([for(l = [LED3mm,LED3mm,LED3mm,LED3mm]) led_diameter(l)], 1)
        led(LED3mm, "red");
    }
}

ZC_A0591( hole=true);

