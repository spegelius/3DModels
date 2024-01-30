use <../Dollo/NEW_long_ties/include.scad>;


//mock_case_front();
mock_case_front2();

// for hdd rack
module _screw_positions() {
    translate([130/2, 248.2/2 - 8, 0])
    children();

    translate([-130/2, 248.2/2 - 8, 0])
    children();

    translate([130/2, -248.2/2 + 8, 0])
    children();

    translate([-130/2, -248.2/2 + 8, 0])
    children();

    translate([130/2, -248.2/6, 0])
    children();

    translate([-130/2, -248.2/6, 0])
    children();

    translate([130/2, 248.2/6, 0])
    children();

    translate([-130/2, 248.2/6, 0])
    children();
}

// for 10 hdd rack
module _screw_positions2() {
    translate([160/2, 310/2 - 8, 0])
    children();

    translate([-160/2, 310/2 - 8, 0])
    rotate([0, 0, 180])
    children();

    translate([160/2, -310/2 + 8, 0])
    children();

    translate([-160/2, -310/2 + 8, 0])
    rotate([0, 0, 180])
    children();

    translate([160/2, -310/6, 0])
    children();

    translate([-160/2, -310/6, 0])
    rotate([0, 0, 180])
    children();

    translate([160/2, 310/6, 0])
    children();

    translate([-160/2, 310/6, 0])
    rotate([0, 0, 180])
    children();
}


module mock_case_front() {
    // case front mockup
    h = 600;
    w = 201;
    c_h = h - 115 - 80; 

    difference() {
        union() {
            translate([0, 7/2, 0])
            cube([w, 7, h], center=true);

            translate([-w/2 + 31/2, -21/2, 0])
            cube([31, 21, h], center=true);

            translate([w/2 - 31/2, -21/2, 0])
            cube([31, 21, h], center=true);
        }

        // front cuts
        translate([0, 0, -c_h/2 + h/2 - 115])
        cube([120, 100, c_h], center=true);

        translate([0, 0, -44/2 + h/2 - 130])
        cube([150, 100, 44], center=true);

        // front chamfer
        hull() {
            translate([0, -100/2 - 0.1, 0])
            cube([
                w - 2*31, 100, h + 100
            ], center=true);

            translate([0, -100/2 - 21.1, 0])
            cube([
                w - 2*24, 100, h + 100
            ], center=true);
        }

        // buttons & leds opening
        translate([0, 0, h/2 - 115 + 30/2 + 26.5])
        rotate([90, 0, 0])
        hull() {
            translate([-30, 0, 0])
            cylinder(d=30, h=100, center=true, $fn=40);

            translate([0, 0, 0])
            cylinder(d=30, h=100, center=true, $fn=40);
        }

        translate([0, 0, h/2 - 115 + 14/2 + 34.5])
        rotate([90, 0, 0])
        hull() {
            translate([40, 0, 0])
            cylinder(d=14, h=100, center=true, $fn=40);

            translate([0, 0, 0])
            cylinder(d=14, h=100, center=true, $fn=40);
        }

        // hdd rack screw holes
        translate([0, 0, 65])
        rotate([90, 0, 0])
        _screw_positions()
        cylinder(d=3, h=20, center=true, $fn=30);

        // bottom clip hole
        translate([0, 0, -226])
        rotate([90, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=30);
    }
}

module mock_case_front2() {
    // case front mockup for case 2

    h = 600;
    w = 270;
    c_h = h - 115 - 80; 

    difference() {
        union() {
            translate([0, 7/2, 0])
            cube([w, 7, h], center=true);

            translate([-w/2 + 46/2, -16/2, 0])
            cube([46, 16, h], center=true);

            translate([w/2 - 46/2, -16/2, 0])
            cube([46, 16, h], center=true);
        }

        // cover grooves
        translate([w/2 - 5.5/2 - 6, 10/2, 0])
        cube([5.5, 10, h + 2], center=true);

        translate([-w/2 + 5.5/2 + 6, 10/2, 0])
        cube([5.5, 10, h + 2], center=true);
        
        // front cuts
        translate([0, 0, -h/2 + 42 + 281/2])
        cube([140.5, 100, 281], center=true);

        translate([0, 0, -h/2 + 42 + 281 + 45.5 + 129/2])
        cube([150, 100, 129], center=true);

        // hdd rack screw holes
        translate([0, 0, 55])
        rotate([90, 0, 0])
        _screw_positions2()
        cylinder(d=3, h=20, center=true, $fn=30);

        // bottom clip holes
        translate([4.5, 0, -264])
        rotate([90, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=30);

        translate([-4.5, 0, -264])
        rotate([90, 0, 0])
        cylinder(d=3, h=20, center=true, $fn=30);
    }

    // watercooling tubes for reference
    translate([165/2 + 14/2, 144 + 14/2, h/2 - 78])
    cylinder(d=14, h=20, center=true, $fn=30);

    translate([-165/2 - 14/2, 144 + 14/2, h/2 - 78])
    cylinder(d=14, h=20, center=true, $fn=30);

    // reservoir top
    translate([0, 125, -h/2 + 185 - 20])
    cylinder(d=60, h=20, $fn=40);

    // button panel
    translate([0, -23/2, h/2 - 55/2 - 15.5])
    cube([160, 23, 55], center=true);
}