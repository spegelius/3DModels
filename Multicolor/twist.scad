
$fn = 40; 

module twube() {
    linear_extrude(10, convexity=10, twist=45) square(10);
}

//twube();
//rotate([0,0,90]) twube();
//rotate([0,0,180]) twube();
rotate([0,0,270]) twube();