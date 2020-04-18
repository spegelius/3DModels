
h = 0.6;

difference() {
    union() {
        translate([0,0,h/2])
        cube([40, 40,h], center=true);

        translate([37.8/2+1.5/2,0,2/2])
        cube([1.5,20,2],center=true);

        translate([-37.8/2-1.5/2,0,2/2])
        cube([1.5,20,2],center=true);

        translate([0,37.8/2+1.5/2,2/2])
        cube([20,1.5,2],center=true);

        translate([0,-37.8/2-1.5/2,2/2])
        cube([20,1.5,2],center=true);
    }
    cube([38-7,38-7,2],center=true);
}