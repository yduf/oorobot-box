use <chassis.scad>

module proj_cover() {
    projection()
    rotate([-90, 0, 0])
    case();
}

module cover() {
    //color("lightBlue")
    translate([0, 96/2])
    rotate([90, 0, 0])
    
    difference() 
    {
    linear_extrude( 96 ) 
    { 
        //difference() 
        {
            offset(r = 3)
            //projection()
            //linear_extrude( height=96,  scale=1.05 )  
            //translate([0, 2])
            proj_cover();


            color("red")
            proj_cover();
       } 
    }
    
    
    color("red")
    translate([0, -3.1, 96/2])
    rotate([-90, 0, 0])
    case();
    
    }
}


cover();