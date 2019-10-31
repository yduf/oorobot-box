use <cover.scad>
use <wheel.scad>

// Cover
align=7;

translate([0, 0, 1])
cover_wo_keyb();

//translate([0, 0, align])
caisse(mat=true, equip=true);

// Wheel
translate([0, -120, 0])
rotate([90, 0, 0])
wheel();