use <roundbox.scad>

module battery_case() {
battery_w = 70;
battery_l = 30;
battery_h = 120;

color("white")
rotate([0, 0, 90])
roundedRect([battery_w, battery_l, battery_h], 3);
//cube([battery_w, battery_l, battery_h]);

}

module battery( mat=false, hole=false, equip=false) {
  if( hole) {
      battery_case();
  }

  if( equip) {
      battery_case();
  }
}

difference() {
//battery(mat=true);
battery(hole=true);
}

battery(equip=true);