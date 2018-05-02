
module half_x() {
    difference() {
        intersection() {
            rotate([0,45,0]) cube([10,10,50], center=true);
            cube([50,10,28], center=true);
        }
        rotate([0,-45,0]) translate([0,5,0]) cube([10,10,50], center=true);
    }
}

module x() {
    half_x();
    rotate([0,0,180]) half_x();
}
//x();


module part_x() {
    difference() {
        rotate([0,0,90]) half_x();
        x();
    }
}

// print these

half_x();
//rotate([0,0,180]) half_x();
//part_x();
//rotate([0,0,180]) part_x();
