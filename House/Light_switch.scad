use <../Dollo/NEW_long_ties/include.scad>;

difference() {
    union() {
        intersection() {
            translate([0,1/2,4/2])
            chamfered_cube(70.3,71.3,4,1,center=true);

            translate([0,0,2/2])
            cube([100,100,2],center=true);
        }
        translate([0,0,2+4/2])
        cube([68.3,68.3,4],center=true);

        translate([0,-68.3/2,2+4])
        rotate([45,0,0])
        cube([10,1,1],center=true);

        translate([0,68.3/2,2+4])
        rotate([45,0,0])
        cube([10,1,1],center=true);

        translate([-68.3/2,0,2+4])
        rotate([0,45,0])
        cube([1,10,1],center=true);

        translate([68.3/2,0,2+4])
        rotate([0,45,0])
        cube([1,10,1],center=true);
    }
    translate([0,0,6/2+1.6])
    cube([65.3,65.3,6],center=true);

    intersection() {
        rotate([0,0,45])
        translate([0,-100/2,0])
        for(i=[0:100]) {
            translate([0,i*1.5,0])
            rotate([45,0,0])
            cube([100,0.5,0.5],center=true);
        }
        cube([66,66,3],center=true);
    }
}