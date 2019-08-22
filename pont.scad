use <roundbox.scad>

module copy_mirror(vec=[0,1,0])
{
    children();
    mirror(vec) children();
} 

module T() {
difference() 
    {
  union(){
    translate([0, 0, 20])
    cube([4, 96, 20], center=true);
  
    cube([4, 50, 60], center=true);
  }

    copy_mirror()
    color("red")    
    translate([ 0, -28, -8])
    rotate([ 0, 90, 0])
    roundedRect([45, 23,  10], 17, true);
    }
}
 
T();
