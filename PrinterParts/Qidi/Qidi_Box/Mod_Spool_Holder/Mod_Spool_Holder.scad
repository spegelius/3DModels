use <../../../../Dollo/NEW_long_ties/include.scad>;

use <../../../../lib/fittings.scad>;

use <../../../Anycubic/ACE_Pro/Mod_Spool_Holder_remix/Mod_Spool_Holder_remix.scad>;


//mod_spool_holder_qidi_box_assembly();


//qidi_box_spool_holder_right();
qidi_box_spool_holder_left();


module mod_spool_holder_qidi_box_assembly() {
    y = -4.6;
    z = 28.2;
//    y = 13.8;
//    z = 18.1;

    translate([0, 0, 38.75])
    rotate([-10, 180, 0])
    qidi_box_spool_holder_left();

    translate([0, 0, 38.75])
    rotate([-10, 180, 0])
    qidi_box_spool_holder_right()

    render()
    translate([-171.625 + 8.75, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([-171.625 + 8.75 + 84.5, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([-171.625 + 8.75 + 84.5 + 84.5, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    render()
    translate([-171.625 + 8.75 + 84.5 + 84.5 + 84.625, y, z])
    rotate([0, 90, 0])
    debug_cylinder_silica();

    color("darkgrey")
    render()
    translate([-171.5 + 84/2 + 4 + 84*2, y, z])
    rotate([0, 90, 0])
    tube(202, 68, (200 - 52.5)/2, center=true, $fn=80);

//    color("darkgrey")
//    render()
//    translate([-171.5 + 84/2 + 4 + 84*2, y, z])
//    rotate([0, 90, 0])
//    tube(160, 68, (160 - 52.5)/2, center=true, $fn=80);
}


module _qidi_box_spool_holder(thread_slop=0.3) {

    module _spool_slot() {
        rotate([10, 0, 0])
        translate([0, 0, 0])
        union() {
            translate([0, -9, 0])
            cube([74.5, 224, 200], center=true);

            translate([0, -9, -61])
            rotate([90, 0, 0])
            chamfered_cube_side(
                76.5, 200, 224, 2, center=true
            );
        }
    }

    module _ptfe_hole() {
        translate([0, 111, -1])
        rotate([-12, 0, 0])
        union() {
            translate([0, 0, -6.5])
            chamfered_cylinder(8.2, 10, 1.5, $fn=30);

            translate([0, 0, 1.5])
            fitting_thread_M6(
                fitting_h=9, slop=thread_slop, chamfer=true
            );

            translate([0, 0, 8.5])
            chamfered_cylinder(8, 10, 2, $fn=40);
        }

        %translate([0, 220/2 + 3, 7])
        rotate([-12, 0, 0])
        translate([0, -220/2, 0])
        rotate([90, -22.5, 90])
        donut(220, 5, angle=45, $fn=100);
    }

    module _back_leg() {
        hull() {
            rotate([10, 0, 0])
            translate([0, -97.5, 30 + 1/2])
            cube([10, 25, 1], center=true);

            rotate([10, 0, 0])
            translate([0, -105, 63.8 + 1/2])
            cube([10, 13, 1], center=true);
        }
    }

    module _screw_hole() {
        rotate([0, 90, 0])
        union() {
            cylinder(d=3.2, h=20, center=true, $fn=30);

            translate([0, 0, 1.5])
            chamfered_cylinder(6.2, 10, 2, $fn=30);

            translate([0, 0, -1.5])
            rotate([180, 0, 0])
            M3_nut(5, cone=false);
        }
    }

    module _main() {
        difference() {
            union() {
                intersection() {
                    hull() {
                        translate([0, 250/2 - 112, 1/2])
                        cube([342, 250, 1], center=true);

                        rotate([10, 0, 0])
                        translate([0, 250/2 - 110.2, 49.7])
                        cube([342, 250, 4], center=true);
                    }

                    translate([0, -7, 30])
                    rotate([0, 90, 0])
                    chamfered_cylinder(
                        255, 352, 8, center=true, $fn=100
                    );
                }

                _back_leg();

                translate([-84.5, 0, 0])
                _back_leg();

                translate([-84.5*2 + 0.5, 0, 0])
                _back_leg();

                translate([84.5, 0, 0])
                _back_leg();

                translate([84.5*2 - 0.5, 0, 0])
                _back_leg();
            }

            translate([-84.5/2, 0, 0])
            _spool_slot();

            translate([-84.5/2 - 84.5, -0, 0])
            _spool_slot();

            translate([84.5/2, 0, 0])
            _spool_slot();

            translate([84.5/2 + 84.5, 0, 0])
            _spool_slot();

            // side cuts
            rotate([25, 0, 0])
            translate([-353/2, -125, 0])
            cube([18, 100, 200], center=true);

            rotate([10, 0, 0])
            translate([-353/2, 0, -1])
            chamfered_cube(16, 300, 100, 6, center=true);

            rotate([25, 0, 0])
            translate([353/2, -125, 0])
            cube([18, 100, 200], center=true);

            rotate([10, 0, 0])
            translate([353/2, 0, -1])
            chamfered_cube(16, 300, 100, 6, center=true);
        }
    }

    difference() {
        union() {
            _main();

            // back brace
            hull() {
                rotate([10, 0, 0])
                translate([0, -108.2, 64.3])
                cube([335.3, 7, 3], center=true);

                rotate([10, 0, 0])
                translate([0, -110.7, 56.3])
                cube([335.3, 1, 2], center=true);
            }
        }

        // back leg slots
        rotate([10, 0, 0])
        translate([0, -110, 69.8])
        cube([11, 30, 10], center=true);

        rotate([10, 0, 0])
        translate([-84, -110, 69.8])
        cube([11, 30, 10], center=true);

        rotate([10, 0, 0])
        translate([-84*2, -110, 69.8])
        cube([11, 30, 10], center=true);

        rotate([10, 0, 0])
        translate([84, -110, 69.8])
        cube([11, 30, 10], center=true);

        rotate([10, 0, 0])
        translate([84*2, -110, 69.8])
        cube([11, 30, 10], center=true);

        // core slot
        translate([0, -12.5, 4.5])
        rotate([-51, 0, 0])
        hull() {
            translate([0, 0, -20])
            rotate([0, 90, 0])
            cylinder(d=8.6, h=400, center=true, $fn=40);

            translate([0, 0, 30])
            rotate([0, 90, 0])
            cylinder(d=8.6, h=400, center=true, $fn=40);
        }

        translate([0, -9, 0])
        rotate([10, 0, 0])
        cube([400, 10, 15], center=true);

        // front cuts
        difference() {
            union() {
                translate([0, 125, 60/2 + 10])
                cube([328, 60, 60], center=true);

                rotate([20, 0, 0])
                translate([0, 133.8, 23])
                cube([328, 60.2, 60], center=true);
            }

            rotate([10, 0, 0])
            translate([0, 101, 0])
            cube([8, 70, 60], center=true);

            rotate([10, 0, 0])
            translate([-84.5, 100, 0])
            cube([8, 70, 60], center=true);

            rotate([10, 0, 0])
            translate([84.5, 100, 0])
            cube([8, 70, 60], center=true);
        }

        rotate([10, 0, 0])
        translate([0, 129.5, 54])
        cube([328, 60, 60], center=true);

        // ptfe holes
        render()
        translate([-323/2 + 41, 0, 0])
        _ptfe_hole();

        #render()
        translate([-323/2 + 124, 0, 0])
        _ptfe_hole();

        render()
        translate([323/2 - 31, 0, 0])
        _ptfe_hole();

        render()
        translate([323/2 - 114, 0, 0])
        _ptfe_hole();

        // joining screw holes
        translate([0, 25, 5])
        _screw_hole();

        translate([0, -20.5, 32])
        _screw_hole();

        translate([0, 70, 48])
        _screw_hole();

        translate([0, -100, 18])
        _screw_hole();

        // corner cuts
        translate([170, 143, 30])
        rotate([50, 0, 0])
        cube([30, 50, 200], center=true);

        translate([-170, 143, 30])
        rotate([50, 0, 0])
        cube([30, 50, 200], center=true);

        // center fin cut
        rotate([11, 0, 0])
        translate([0, 44, 60.1])
        chamfered_cube(
            220, 160, 40, 12, center=true
        );
    }
}

module qidi_box_spool_holder_right() {
    intersection() {
        _qidi_box_spool_holder();

        translate([400/2, 0, 0])
        cube([400, 400, 400], center=true);
    }
}

module qidi_box_spool_holder_left() {
    intersection() {
        _qidi_box_spool_holder();

        translate([-400/2, 0, 0])
        cube([400, 400, 400], center=true);
    }
}