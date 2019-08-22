use <roundbox.scad>

  



difference() {
  union(){
    cube([4, 50, 60], center=true);
    translate([0, 0, 27])
    cube([4, 68, 6], center=true);
  }


/*
  translate([0, 30, 0]){
    scale([1, 0.8, 1]){
      rotate([0, 90, 0]){
        cylinder(r1=26, r2=26, h=4, center=true);
      }
    }
  }
  
  translate([0, -30, 0]){
    scale([1, 0.8, 1]){
      rotate([0, 90, 0]){
        cylinder(r1=26, r2=26, h=4, center=true);
      }
    }
  }*/
}
 
module hole1() {
color("red")    
translate([ 0, -24, -6])
rotate([ 0, 90, 0])
roundedRect([45, 10,  10], 15, true);
}

module copy_mirror(vec=[0,1,0])
{
    children();
    mirror(vec) children();
} 

copy_mirror()
hole1();

