use <../Dollo/NEW_long_ties/include.scad>;
include <common.scad>;


module _profile_groove(h) {
    hull() {
        cube([3, 4, h + 1], center=true);

        translate([0, 2/2 + 1/2, 0])
        cube([5, 3, h + 1], center=true);
    }
}

module _profile_groove2(h) {
    hull() {
        cube([2, 3, h + 1], center=true);

        translate([0, 2/2 + 1/2, 0])
        cube([4, 2, h + 1], center=true);
    }
}

module _profile(h) {
    difference() {
        cube([20, 20, h], center=true);

        for(i = [0:3]) {
            rotate([0, 0, i * 90])
            translate([0, 20/2, 0])
            _profile_groove(h);
        }
    }
}
//_profile(40);

module _profile_v2(h) {
    difference() {
        cube([20, 20, h], center=true);

        for(i = [0:3]) {
            rotate([0, 0, i * 90])
            translate([4.3, 20/2, 0])
            _profile_groove2(h);

            rotate([0, 0, i * 90])
            translate([-4.3, 20/2, 0])
            _profile_groove2(h);

        }
    }
}
//_profile_v2(40);

module _joint_form(holes=true, extra=0) {
    difference() {
        cube([20, 80, 25], center=true);

        translate([20/2 + 15/2 - 4, 0, 0])
        chamfered_cube(15 + extra, 90, 10,
            4, center=true);
    }

    if (holes) {
        translate([0, 80/2 - 6, 0])
        rotate([0, -90, 0]) {
            cylinder(d=3.3, h=50, center=true, $fn=20);

            translate([0, 0, -20.5])
            M3_nut(5, cone=false, bridging=true);
        }

        translate([0, 6, 0])
        rotate([0, -90, 0]) {
            cylinder(d=3.3, h=50, center=true, $fn=20);

            translate([0, 0, -20.5])
            M3_nut(5, cone=false, bridging=true);
        }

        translate([0, -80/2 + 6, 0])
        rotate([0, -90, 0]) {
            cylinder(d=3.3, h=50, center=true, $fn=20);

            translate([0, 0, -20.5])
            M3_nut(5, cone=false, bridging=true);
        }

        translate([0, -6, 0])
        rotate([0, -90, 0]) {
            cylinder(d=3.3, h=50, center=true, $fn=20);

            translate([0, 0, -20.5])
            M3_nut(5, cone=false, bridging=true);
        }
    }
}

module _bolt_hole() {
    cylinder(d=3.3, h=50, center=true, $fn=20);

    cylinder(d=8, h=5, center=true, $fn=20);

    hull() {
        cylinder(d=6, h=5, center=true, $fn=20);
        cylinder(d=1, h=9, center=true, $fn=20);
    }
}

module joint_block() {

    difference() {
        intersection() {
            translate([0, 0, 0])
            _joint_form(holes=false, extra=0.15);

            translate([20/2, 0, 0])
            cube([20, 79.7, 20], center=true);

            translate([20/2, 0, 0])
            rotate([90, 0, 0])
            _profile(84);
        }
        translate([0, 80/2 - 6, 0])
        rotate([0, 90, 0])
        _bolt_hole();

        translate([0, 6, 0])
        rotate([0, 90, 0])
        _bolt_hole();

        translate([0, -80/2 + 6, 0])
        rotate([0, 90, 0])
        _bolt_hole();

        translate([0, -6, 0])
        rotate([0, 90, 0])
        _bolt_hole();
    }

    // support
    translate([20/2 - 1/2, 0, -20/2 + 1.8/2])
    cube([1, 80, 1.8], center=true);

    translate([20/2 - 3/2, 0, -20/2 + 0.2/2])
    cube([3, 80, 0.2], center=true);
}
//joint_block();

module joint_block_v2() {

    difference() {
        intersection() {
            translate([0, 0, 0])
            _joint_form(holes=false, extra=0.15);

            translate([20/2, 0, 0])
            cube([20, 79.7, 20], center=true);

            translate([20/2, 0, 0])
            rotate([90, 0, 0])
            _profile_v2(84);
        }
        translate([0, 80/2 - 6, 0])
        rotate([0, 90, 0])
        _bolt_hole();

        translate([0, 6, 0])
        rotate([0, 90, 0])
        _bolt_hole();

        translate([0, -80/2 + 6, 0])
        rotate([0, 90, 0])
        _bolt_hole();

        translate([0, -6, 0])
        rotate([0, 90, 0])
        _bolt_hole();
    }
}
//joint_block_v2();

module _frame_clip() {
    difference() {
        chamfered_cube_side(24.2, 15, 20, 1.5);

        translate([6.2/2, 5, -1])
        cube([18, 10, 25]);

        hull() {
            translate([2, 3, -1])
            cube([20.2, 7.6, 25]);

            translate([5, 3, -1])
            cube([14.2, 9.2, 25]);
        }

        hull() {
            translate([1, 15, -1])
            cube([22.2, 1.6, 25]);

            translate([5, 9, -1])
            cube([14.2, 9.1, 25]);
        }
    }

    %translate([20/2 + 2.1, 20/2 + 3])
    _profile(30);
}
//_frame_clip();

module _frame_clip_v2() {
    difference() {
        chamfered_cube_side(23.5, 12, 20, 1.5);

        translate([5.2/2, 5, -1])
        cube([18.3, 10, 25]);

        hull() {
            translate([1.6, 3, -1])
            cube([20.2, 4.1, 25]);

            translate([4.65, 3, -1])
            cube([14.2, 5.5, 25]);
        }

        hull() {
            translate([0.65, 11.5, -1])
            cube([22.2, 1.6, 25]);

            translate([4.65, 5.5, -1])
            cube([14.2, 9.2, 25]);
        }
    }

    %translate([20/2 + 1.7, 20/2 + 3])
    _profile_v2(30);
}
//_frame_clip_v2();