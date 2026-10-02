use <../Dollo/NEW_long_ties/include.scad>;


table_top_600x550_mockup();



module table_top_600x550_mockup() {

    translate([-600/2 + 20/2, 0, 40/2])
    cube([20, 550, 40], center=true);

    translate([600/2 - 20/2, 0, 40/2])
    cube([20, 550, 40], center=true);

    translate([0, 550/2 - 20/2, 40/2])
    cube([560, 20, 40], center=true);

    translate([0, -550/2 + 20/2, 40/2])
    cube([560, 20, 40], center=true);

    
}