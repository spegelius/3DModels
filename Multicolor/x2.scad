
// print these
//x2_1();
//x2_2();
//x2_3();
x2_4();


module x2_1() {
    difference() {
        intersection() {
            rotate([0, 45, 0])
            cube([10, 10, 50], center=true);

            cube([50, 10, 28], center=true);
        }
        rotate([0, -45, 0])
        translate([0, 5, 0])
        cube([10, 10, 50], center=true);
    }
}

module x2_2() {
    rotate([0, 0, 180])
    x2_1();
}

module full_x() {
    intersection() {
        union() {
            rotate([0, 45, 0])
            cube([10, 10, 50], center=true);
            
            rotate([0, -45, 0])
            cube([10, 10, 50], center=true);
        }
        cube([50, 10, 28], center=true);
    }
}

module x2_3() {
    difference() {
        rotate([0, 0, 90])
        x2_1();

        full_x();
    }
}

module x2_4() {
    rotate([0, 0, 180])
    x2_3();
}