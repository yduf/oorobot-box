use <cover.scad>
use <wheel.scad>

translate([0, 0, 70])
cover_wo_keyb();

caisse(mat=true, equip=true);

translate([0, -120, 0])
rotate([90, 0, 0])
wheel();