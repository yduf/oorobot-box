use <chassis.scad>

module cover() {
    color("lightBlue")
    translate([0, 96/2])
    rotate([90, 0, 0])
    linear_extrude( 96 ) 
    { 
        difference() 
        {
            //offset(r = 8)
            projection()
            linear_extrude( height=96,  scale=1.05 ) 
            
            translate([0, 2])
            projection()
            rotate([-90, 0, 0])
            case();

            projection(false)
            rotate([-90, 0, 0])
            case(); 
       } 
    }
}


cover();