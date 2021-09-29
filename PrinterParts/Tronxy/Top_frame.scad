use <../../Dollo/NEW_long_ties/include.scad>;
use <../../Dollo/NEW_long_ties/extention.scad>;
use <../../Dollo/NEW_long_ties/corner.scad>;


////// VIEW //////
top_frame_assembly();

//frame_mount();
//middle_extention(230);
//middle_extention(230/2);
//extention_t_part_back();
//extention_t_part_front();


////// MODULES //////
module frame_mount() {
    c_h = 7*2 + 20.2;
    difference() {
        union() {
            translate(
                [0, 30/2 - 10, (7*2 + 20.2)/2]
            )
            cube([30, 30, c_h], center=true);

            translate([0, 30/2 + 10, 0]) {
                translate([0, 0, 4*30/2])
                extention(units=4, support=false);

                translate([-30/2 + 7, -7, 6/2])
                rotate([0, 0, 45])
                cube([7, 7, 6], center=true);

                translate([7, -7, 6/2])
                rotate([0, 0, 45])
                cube([7, 7, 6], center=true);
            }
            hull() {
                translate(
                    [-30/2 + 4/2, -10 + 1/2, c_h - 8/2]
                )
                cube([4, 1, 8], center=true);

                translate([
                    -30/2 + 4/2, 10 + 1/2,
                    c_h - 8/2 + 20
                ])
                cube([4, 1, 8], center=true);
            }
            hull() {
                translate(
                    [30/2 - 4/2, -10 + 1/2, c_h - 8/2]
                )
                cube([4, 1, 8], center=true);

                translate([
                    30/2 - 4/2, 10 + 1/2,
                    c_h - 8/2 + 20
                ])
                cube([4, 1, 8], center=true);
            }
        }
        translate([0, -1/2, 20.2/2 + 7])
        cube([40, 21, 20.2], center=true);

        translate([0, 47, 0])
        rotate([45, 0, 0])
        cube([40, 40, 40], center=true);

        // holes
        hull() {
            cylinder(d=9, h=2, $fn=40);

            translate([0, -20, 0])
            cylinder(d=9, h=2, $fn=40);
        }
        translate([0, 0, 2.2])
        hull() {
            cylinder(d=4.3, h=6, $fn=40);

            translate([0, -20, 0])
            cylinder(d=4.3, h=6, $fn=40);
        }
        translate([0, 0, 7*2 + 20.2 - 2])
        hull() {
            cylinder(d=9, h=2, $fn=40);

            translate([0, -20, 0])
            cylinder(d=9, h=2, $fn=40);
        }
        translate([0, 0, 7*2 + 20.2 - 6.8])
        hull() {
            cylinder(d=4.3, h=6, $fn=40);

            translate([0, -20, 0])
            cylinder(d=4.3, h=6, $fn=40);
        }
    }

    // supports
    translate([0, -10 + 19.5/2, 7.2 + 19.8/2])
    difference() {
        cube([30, 19.5, 19.8], center=true);

        translate([0, 0.25, -1.3])
        hull() {
            cube([29, 19, 19.2], center=true);
            cube([27, 17, 21.2], center=true);
        }
    }

    translate([-30/2 + 1, 28, 0]) {
        cylinder(d=8, h=0.2);
        cylinder(d=4, h=9.5);
    }

    translate([30/2 - 1, 28, 0]) {
        cylinder(d=8, h=0.2);
        cylinder(d=4, h=9.5);
    }
}

module middle_extention(length=230, support=true) {
    rotate([90, 0, 0])
    extention_base(length, support);
}

module extention_t_part_back(supports=true) {
    extention_t(_offset=0, supports=supports);
}

module extention_t_part_front(supports=true) {
    extention_t(_offset=-30, supports=supports);
}

module top_frame_assembly() {
    translate([-530/2 + 75, 500/2 - 10, 0])
    frame_mount();

    translate([-530/2 + 75, 500/2 + 15, 150])
    extention(2,support=false);

    translate([-530/2 + 75, 500/2 + 17, 267])
    rotate([0, 135, -90])
    corner_90(
        corner_len=70, extra_stiff=true, support=false
    );
    
    translate([530/2 - 75, 500/2 - 10, 0])
    frame_mount();

    translate([530/2 - 75, 500/2 + 15, 150])
    extention(2, support=false);

    translate([530/2 - 75, 500/2 + 17, 267])
    rotate([0, 135, -90])
    corner_90(
        corner_len=70, extra_stiff=true, support=false
    );
    
    translate([-530/2 + 75, -500/2 + 10, 0])
    rotate([0, 0, 180])
    frame_mount();

    translate([-530/2 + 75, -530/2, 150])
    extention(2, support=false);

    translate([-530/2 + 75, -500/2 - 17, 267])
    rotate([0, 135, 90])
    corner_90(
        corner_len=70, extra_stiff=true, support=false
    );

    translate([530/2 - 75, -500/2 + 10, 0])
    rotate([0, 0, 180])
    frame_mount();

    translate([530/2 - 75, -530/2, 150])
    extention(2, support=false);

    translate([530/2 - 75, -500/2 - 17, 267])
    rotate([0, 135, 90])
    corner_90(
        corner_len=70, extra_stiff=true, support=false
    );

    translate([-530/2 + 75 - 15, 500/2 - 130, 265])
    rotate([0, -90, 180])
    extention_t_part_back(supports=false);

    translate([-530/2 + 75, 500/2 - 250, 265])
    rotate([90, 0, 0])
    extention(support=false);

    translate([-530/2 + 75 - 15, 500/2 - 370, 265])
    rotate([0, 90, 0])
    extention_t_part_front(supports=false);

    translate([530/2 - 75 + 15, 500/2 - 130, 265])
    rotate([0, 90, 180])
    extention_t_part_back(supports=false);

    translate([530/2 - 75, 500/2 - 250, 265])
    rotate([90, 0, 0])
    extention(support=false);

    translate([530/2 - 75 + 15, 500/2 - 370, 265])
    rotate([0, -90, 0])
    extention_t_part_front(supports=false);

    translate([0, 120, 265])
    rotate([0, 90, 0])
    middle_extention(support=false);

    translate([0, -150, 265])
    rotate([0, 90, 0])
    middle_extention(support=false);
}
