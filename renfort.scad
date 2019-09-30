
module renfort( h=100, r=10) {

difference() 
{
union() {
cylinder(r=r,h=h, center=true);

translate([ 0, 0, h/2])
sphere(r=r);

translate([ 0, 0, -h/2])
sphere(r=r);
}

hh=h*2;

color("red")
translate([ -r, 0, -hh/2])
cube([ 2*r, 2*r, hh]);
}

}

renfort();