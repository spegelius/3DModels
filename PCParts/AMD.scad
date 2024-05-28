use <../Dollo/NEW_long_ties/include.scad>;
use <common.scad>;


//debug();
//_cpu_cutout();

lapping_clamp_half_1();
//lapping_clamp_half_2();


module debug() {
    intersection() {
        lapping_clamp_half_1();
//
//        translate([0, -100/2 + 4, 0])
//        cube([100, 100, 200], center=true);
    }

    intersection() {
        translate([0, 0, 55])
        rotate([180, 0, 180])
        lapping_clamp_half_2();
//
//        translate([0, -100/2 + 4, 0])
//        cube([100, 100, 200], center=true);
    }
    
    %translate([0, 5, 55/2])
    rotate([90, 0, 0])
    mock_am4_cpu();
}

module _lapping_clamp_half() {
    difference() {
        intersection() {
            translate([0, 0, 55/2])
            chamfered_cube(
                58, 20, 55, 3, center=true
            );

            translate([0, 20/2])
            cube([60, 20, 54], center=true);
        }

        translate([58/2 - 4, 4, 0])
        cylinder(d=3.2, h=100, center=true, $fn=20);

        translate([-58/2 + 4, 4, 0])
        cylinder(d=3.2, h=100, center=true, $fn=20);

        translate([58/2 - 4, 4, 0])
        chamfered_cylinder(
            6.6, 15, 2, center=true, $fn=20
        );

        translate([-58/2 + 4, 4, 0])
        chamfered_cylinder(
            6.6, 15, 2, center=true, $fn=20
        );
    }
}

module _cpu_cutout() {
    translate([0, 5, 55/2])
    rotate([90, 0, 0])
    union() {
        scale([1.015, 1.015, 1.04])
        mock_am4_cpu();

        translate([0, 0, 1.6/2 + 2.1])
        cube([42, 40.81, 1.6], center=true);
    }
}

module lapping_clamp_half_1() {
    difference() {
        _lapping_clamp_half();


        _cpu_cutout();

        translate([58/2 - 4, 4, 0])
        M3_nut(10);

        translate([-58/2 + 4, 4, 0])
        M3_nut(10);
        
    }
}

module lapping_clamp_half_2() {
    difference() {
        _lapping_clamp_half();

        _cpu_cutout();
    }
}