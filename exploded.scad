use <cover.scad>
use <wheel.scad>

// Cover
translate([0, 0, 70])
cover_wo_keyb();

translate([0, 0, 7])
caisse(mat=true, equip=true);

// Wheel
translate([0, -120, 0])
rotate([90, 0, 0])
wheel();