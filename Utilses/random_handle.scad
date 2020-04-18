use <../Dollo/NEW_long_ties/include.scad>;

difference() {
    chamfered_cube(20,90,6,1.5);
    translate([2.25,0,3])
    cube([15.5,29,5]);
    
    translate([20/2,3,0])
    cylinder(d=3.3,h=10,$fn=30);
    
    translate([20/2,29-3,0])
    cylinder(d=3.3,h=10,$fn=30);

}