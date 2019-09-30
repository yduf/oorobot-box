use <M3.scad>

module support_keyboard( length, width) {
    translate([0,0, -8])  {
    difference() 
    {
    rotate([0, -90, 0])
    difference() 
    {
        cylinder(r=width/2, h=length, center=true);
        //cube([length/2, width, 96], center=true);
        
        w = length + 1;
        color("lightblue")
        translate([w/2,0,0]) 
        cube(w, center=true);
    } 

    r = length / 2;
    
    color("red")
    translate([0,0, -r/1.3 -5]) 
    rotate([90, 0, 0])
    cylinder(r=r+4, h=width+1, center=true);

    color("blue")
    translate([0,0,-width/3 + 1]) 
    rotate([0, 90, 0])
    cylinder(r=width/4, h=length+10, center=true);

    color("yellow")
    cube(length-27, center=true);

    color("green")
    translate([length/2 - 20, 0, -5])
    scale([2.0,1.0,1.0])
    sphere(r=10, h=width+1, center=true);
    
    }
    
    // extension to support keyboard
    color("green")
    translate([31, 0, -1.5])  
    cube([ 10, width, 3], center=true);

    }
}


module keyboard_impl( mat = false, hole=false, equip = false) {
    
  width=96;
    
  if( mat) {
    support_keyboard( length=width, width=50);
  }

  translate([5 -width/2 + 1.5, 3.5, 0]) {
  if( hole)
  {
      
      // keyboard hole
       translate([0, 0, -5])
      {
        M3_hole([0, -25.5, 0], depth=20, invert=true);
        //M3_hole([0, 25.5, 0],  depth=20, invert=true);
        M3_hole([75, -25.5, 0], depth=20, invert=true);
        //M3_hole([75, 25.5, 0], depth=20, invert=true); 
      }
      
      // cover mount hole
      color("red")
      translate([0, 0, 10])
      M3_hole([82, -25.5, 0], depth=30, invert=true);
  }
  
   if( equip) {
       l=80;
       w=56.10;
       d=6;
       
       translate([(l-d)/2, 0, -7]) {
           
            cube([ l, w, 3], center=true);
              
            a = 12;
            b = 4;
            color("black")
            translate([(l-a)/2, 0, 0])
            cube([ a, w, 3.1], center=true);
            
            color("black")
            translate([ 0, (w-b)/2, 0])
            cube([ l, b, 3.1], center=true);   
       }
   }
  }
  
  
}

module keyboard( mat = false, hole=false, equip = false) {
    
    if( mat) 
        keyboard_impl( mat=mat);
    
    if( hole) 
        keyboard_impl( hole=hole);
    
    if( equip) {
        difference() {
            
           keyboard_impl( equip=equip);
           keyboard_impl( hole=true);

        }
    }
        
        
}

keyboard( mat=true, hole=true, equip=true);
//keyboard(equip=true);
