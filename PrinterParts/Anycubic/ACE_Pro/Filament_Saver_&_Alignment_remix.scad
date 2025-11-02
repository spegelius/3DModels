use <../../../Dollo/NEW_long_ties/include.scad>;
use <../../../Dollo/NEW_long_ties/mockups.scad>;
use <../../../lib/fittings.scad>;


stl_base_path = "../../../_downloaded/Anycubic/";
spath = str(
    stl_base_path, "ACE Pro/Filament_Saver_Alignment/"
);


//_orig_FilamentAlignement_ECAS();
//debug();

Anycubic_ACEPro_FilamentAlignment_PC4_M6();


module _orig_FilamentAlignement_ECAS() {
    translate([14.5, 0, 18.25])
    rotate([-90, 0, 0])
    import(
        str(spath, "Anycubic_ACEPro_FilamentAlignement-ECAS.stl"),
        convexity=10
    );
}

module debug() {
    //render()
    intersection() {
        Anycubic_ACEPro_FilamentAlignment_PC4_M6(threads=false);

//        translate([100/2, 0, 0])
//        cube([100, 200, 100], center=true);

//        translate([0, 200/2, 0])
//        cube([100, 200, 100], center=true);
    }

    %translate([0, -31.2, 6.5])
    rotate([180, 0, 0])
    mock_ptfe_pc4m6();

    %translate([0, 31.8, 6.5])
    rotate([180, 0, 0])
    mock_ptfe_pc4m6();
}


module Anycubic_ACEPro_FilamentAlignment_PC4_M6(threads=true) {
    module _pc4m6_hole() {
        union() {
            #translate([0, 0, -1])
            cylinder(d=2.7, h=40, $fn=30);

            intersection() {
                if (threads) {
                    fitting_thread_M6(fitting_h=8.1);
                }

                translate([0, 0, -2])
                chamfered_cylinder(6, 10.1, 3.5/2, $fn=30);
            }

            translate([0, 0, -3.5])
            chamfered_cylinder(
                7.4, 6, 1.2, $fn=30
            );
        }
    }

    difference() {
        union() {
            intersection() {
                _orig_FilamentAlignement_ECAS();

                translate([7, 0, 35/2])
                cube([48.5, 107, 35], center=true);
            }

            translate([0, -31.8, 0])
            cylinder(d=20, h=15, $fn=30);

            translate([0, 31.2, 0])
            cylinder(d=20, h=15, $fn=30);

            translate([0, 0, 6/2 + 9])
            cube([30, 40, 6], center=true);
        }

        translate([0, -31.8, 0])
        _pc4m6_hole();

        translate([0, 31.2, 0])
        _pc4m6_hole();

        // chamfers
        translate([25, 0, 0])
        rotate([0, 25, 0])
        cube([10, 200, 70], center=true);

        translate([-15.75, 0, 0])
        rotate([0, -30, 0])
        cube([10, 200, 70], center=true);

        translate([0, 52, 0])
        rotate([-30, 0, 0])
        cube([100, 10, 70], center=true);

        translate([0, -52, 0])
        rotate([30, 0, 0])
        cube([100, 10, 70], center=true);

        // mount hole
        cylinder(d=2.5, h=100, center=true, $fn=30);

        translate([0, 0, -6])
        chamfered_cylinder(6.7, 10, 3.1, $fn=30);

        // extra cuts
        hull() {
            translate([0, 0, 1/2 + 18])
            cube([80, 10, 1], center=true);

            translate([0, 0, 1/2 + 38])
            cube([80, 45, 1], center=true);
        }

        translate([0, -7.5, 7])
        rotate([40, 0, 0])
        cube([80, 3, 12], center=true);

        translate([0, 7.5, 7])
        rotate([-40, 0, 0])
        cube([80, 3, 12], center=true);

        translate([0, -12, 6])
        rotate([40, 0, 0])
        cube([80, 2, 8], center=true);

        translate([0, 12, 6])
        rotate([-40, 0, 0])
        cube([80, 2, 8], center=true);

        translate([0, -15.5, 5.7])
        rotate([40, 0, 0])
        cube([80, 1, 4], center=true);

        translate([0, 15.5, 5.7])
        rotate([-40, 0, 0])
        cube([80, 1, 4], center=true);

        translate([0, -16, -5])
        rotate([40, 0, 0])
        cube([80, 10, 20], center=true);

        translate([0, 16, -5])
        rotate([-40, 0, 0])
        cube([80, 10, 20], center=true);


        // led holes
        hull() {
            translate([-13.9, 31.5, 31])
            rotate([0, -90, 0])
            cylinder(d1=3.5, d2=7, h=5, $fn=40);

            translate([-13.9, 31.5, 21])
            rotate([0, -90, 0])
            cylinder(d1=3.5, d2=7, h=5, $fn=40);
        }

        hull() {
            translate([-13.9, -31.5, 31])
            rotate([0, -90, 0])
            cylinder(d1=3.5, d2=7, h=5, $fn=40);

            translate([-13.9, -31.5, 21])
            rotate([0, -90, 0])
            cylinder(d1=3.5, d2=7, h=5, $fn=40);
        }
    }
}
