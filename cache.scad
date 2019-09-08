use <M3.scad>

difference() {
cube([40, 50, 2], center=false);

translate([0, 0, -5]) {
p=35;
M3_hole([p, 35, 2]);
M3_hole([p, 15, 2]);
}

}