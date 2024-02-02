use <../Dollo/NEW_long_ties/include.scad>;


w = 110;
h = 60;

//debug();
//debug_table_to_table_bracket();
//debug_table_wall_bracket_2();

//table_wall_bracket();
//table_wall_bracket_2();
table_bracket();
//knob();
//table_to_table_bracket();


module screw_hole() {
    rotate([-90, 0, 0]) {
        cylinder(d=4.5, h=100, center=true, $fn=20);
        cylinder(
            d1=10, d2=24, h=50,
            center=true, $fn=20
        );
    }
    
}

module screw_hole_2() {
    union() {
        cylinder(d=4.5, h=100, center=true, $fn=20);

        cylinder(d1=4.5, d2=8.5, h=2, $fn=20);

        translate([0, 0, 1.99])
        cylinder(d=8.5, h=12, $fn=20);
    }
}

module _table_wall_bracket() {
    difference() {
        cube([w, w, h], center=true);

        hull() {
            cylinder(d=w/2, h=80, center=true, $fn=80);

            translate([w/4, w, 0])
            cube([w, w, h + 10], center=true);

            translate([w, w/2 - w/2.5, 0])
            cube([w, w, h + 10], center=true);
        }

        // positioning hole
        translate([-w/2 - 3, 20, 0])
        chamfered_cube(20, w, h/1.5, 7, center=true);

        // chamfers
        translate([w/2, 0, h/2])
        rotate([0, 45, 0])
        cube([10, 200, 10], center=true);

        translate([w/2, 0, -h/2])
        rotate([0, 45, 0])
        cube([10, 200, 10], center=true);

        translate([0, w/2, h/2])
        rotate([45, 0, 0])
        cube([200, 10, 10], center=true);

        translate([0, w/2, -h/2])
        rotate([45, 0, 0])
        cube([200, 10, 10], center=true);

        translate([-w/2, -w/2, 0])
        rotate([0, 0, 45])
        cube([15, 15, h + 10], center=true);

        // screw holes
        translate([w/2 - 10, -w/2 + 50/2 + 7, -h/2 + 10])
        screw_hole();

        translate([w/2 - 10, -w/2 + 50/2 + 7, h/2 - 10])
        screw_hole();

        translate([-10, -w/2 + 50/2 + 7, -h/2 + 10])
        screw_hole();

        translate([-10, -w/2 + 50/2 + 7, h/2 - 10])
        screw_hole();

        translate([-w/2, 12, 0])
        hull() {
            rotate([45, 0, 0])
            cube([70, 7, 7], center=true);

            translate([0, w/5, 0])
            rotate([45, 0, 0])
            cube([70, 7, 7], center=true);
        }
    }
}

module table_wall_bracket() {
    difference() {
        rotate([90, 0, 0])
        _table_wall_bracket();

        // infill
        translate([-w/2 + 10, -h/2 + 10, 0])
        cube([0.1, 2, w * 2], center=true);

        translate([-w/2 + 10, h/2 - 10, 0])
        cube([0.1, 2, w * 2], center=true);

        translate([-w/2 + 17, -h/2 + 19, 0])
        cube([0.1, 2, w * 2], center=true);

        translate([-w/2 + 17, h/2 - 19, 0])
        cube([0.1, 2, w * 2], center=true);
    }
}

module table_bracket() {
    difference() {
        union() {
            chamfered_cube_side(
                h, 90, 10, 5, center=true);

            translate([0, 0, 10/2 - 0.6])
            chamfered_cube(
                h/1.5, 90, 15, 7, center=true);
        }

        translate([0, 2, -10/2 - 1]) {
            M5_nut(10, cone=false, bridging=true);

            cylinder(d=5.5, h=40, center=true, $fn=30);
        }

        translate([h/2 - 6, 90/2 - 15, 1.01])
        screw_hole_2();

        translate([-h/2 + 6, 90/2 - 15, 1.01])
        screw_hole_2();

        translate([h/2 - 6, -90/2 + 15, 1.01])
        screw_hole_2();

        translate([-h/2 + 6, -90/2 + 15, 1.01])
        screw_hole_2();
    }
}

module knob() {

    ridges = 25;
    
    difference() {
        union() {
            translate([0, 0, 2.32])
            rounded_cylinder(35, 18, 4, $fn=80);

            cylinder(d1=35 - 6 - 1, d2=35 - 1, h=3, $fn=80);
        }

        for(i = [1:ridges]) {
            rotate([0, 0, i * 360/ridges])
            translate([35/2, 0, 0])
            cylinder(d=3, h=50, $fn=30);
        }

        translate([0, 0, 14])
        M5_nut(10);

        cylinder(d=5.4, h=40, center=true, $fn=20);
    }
}

module table_to_table_bracket() {
    rotate([0, 90, 0])
    difference() {
        chamfered_cube_side(60, 140, 35, 5, center=true);

        translate([0, 140/2 - (60 - 65/2), 35/2 - (22 - 30/2)])
        cube([70, 65, 30], center=true);

        // positioning hole
        translate([0, 0, 35/2 + 1/2])
        chamfered_cube(h/1.5, 200, 15, 7, center=true);

        translate([0, -100/2 - 5, -35/2 - 10])
        chamfered_cube(200, 125, 50, 20, center=true);

        translate([0, -37, 0])
        cylinder(d=8, h=100, center=true, $fn=40);

        #translate([-60/2 + 10, 140/2 - 10, -35/2 - 25 + 6])
        rotate([-90, 0, 0])
        screw_hole();

        #translate([60/2 - 10, 140/2 - 10, -35/2 - 25 + 6])
        rotate([-90, 0, 0])
        screw_hole();

        #translate([-60/2 + 10, 140/2 - 50, -35/2 - 25 + 6])
        rotate([-90, 0, 0])
        screw_hole();

        #translate([60/2 - 10, 140/2 - 50, -35/2 - 25 + 6])
        rotate([-90, 0, 0])
        screw_hole();

        translate([0, -140/2, -15])
        rotate([45, 0, 0])
        cube([70, 30, 30], center=true);

        // infill
        translate([0, 2, -8])
        rotate([45, 0, 0])
        cube([70, 4, 0.1], center=true);

        translate([0, 1, -1])
        rotate([45, 0, 0])
        cube([70, 4, 0.1], center=true);

        translate([0, 0, 6])
        rotate([45, 0, 0])
        cube([70, 4, 0.1], center=true);

        translate([0, 30, -11])
        rotate([45, 0, 0])
        cube([70, 4, 0.1], center=true);

        translate([0, 50, -11])
        rotate([45, 0, 0])
        cube([70, 4, 0.1], center=true);

        translate([0, -20, 4])
        rotate([45, 0, 0])
        cube([70, 4, 0.1], center=true);

        translate([0, -50, 4])
        rotate([45, 0, 0])
        cube([70, 4, 0.1], center=true);

    }
}

module table_wall_bracket_2() {
    l = 86 + 65;

    angle = atan(20/(l - 15));

    rotate([angle, 0, 0])
    translate([0, -l/2 + 10, 90/2])
    rotate([0, 90, 0])
    difference() {
        union() {
            chamfered_cube_side(50, l, 15, 5, center=true);

            translate([0, l/2 - 10/2, 0])
            rotate([90, 0, 0])
            chamfered_cube_side(90, 28, 10, 4, center=true);

            hull() {
                translate([-90/2 + 1/2, l/2 - 10 + 1/2, 0])
                cube([1, 1, 5], center=true);

                translate([-50/2 + 1/2, 0, 0])
                cube([1, l - 10, 15], center=true);
            }

            mirror([1, 0, 0])
            hull() {
                translate([-90/2 + 1/2, l/2 - 10 + 1/2, 0])
                cube([1, 1, 5], center=true);

                translate([-50/2 + 1/2, 0, 0])
                cube([1, l - 10, 15], center=true);
            }
        }

        // positioning hole
        translate([0, -20, 15/2 + 1/2])
        chamfered_cube(h/1.5, l, 15, 7, center=true);

        // screw holes
        translate([-90/2 + 6, l/2 - 5, 9])
        rotate([90, 0, 0])
        screw_hole_2();

        translate([-90/2 + 6, l/2 - 5, -9])
        rotate([90, 0, 0])
        screw_hole_2();

        translate([90/2 - 6, l/2 - 5, 9])
        rotate([90, 0, 0])
        screw_hole_2();

        translate([90/2 - 6, l/2 - 5, -9])
        rotate([90, 0, 0])
        screw_hole_2();

        translate([0, l/2 - 90/2 - 86 + 2, 0])
        cylinder(d=8, h=100, center=true, $fn=40);
    }
}

module debug() {
    intersection() {
        table_wall_bracket();

        translate([0, 0, -10])
        cube([200, 200, 40], center=true);
    }

    translate([-w/2 - 10/2 - 0.1, 10, 0])
    rotate([0, 90, 0])
    table_bracket();
}

module debug_table_to_table_bracket() {
    //%translate([-200/2, 0, 18/2])
    //cube([200, 200, 18], center=true);

    %translate([200/2, 0, 50/2])
    cube([200, 200, 50], center=true);

    translate([-90/2, 0, 18 + 10/2])
    rotate([0, 0, 90])
    table_bracket();

    translate([-10, 0, 35/2 + 50 - 22])
    rotate([180, 0, 90])
    table_to_table_bracket();

    translate([-47, 0, 48])
    knob();

    #translate([-47, 0, 44])
    cylinder(d=5, h=44, center=true);
}

module debug_table_wall_bracket_2() {
    l = 86 + 65;

    //%translate([0, l/2 - 100/2 - 86, 15/2 + 10 + 50/2])
    //cube([100, 100, 50], center=true);

    angle = atan(20/(l - 15));
    
    
    rotate([0, -90, 0])
    translate([0, l/2 - 10, -90/2])
    rotate([-angle, 0, 0])
    table_wall_bracket_2();

    translate([0, l/2 - 90/2 - 86, 15/2 + 10/2])
    rotate([0, 180, 0])
    table_bracket();

    translate([0, l/2 - 90/2 - 86 + 2, -7.5])
    rotate([0, 180, 0])
    knob();

    #translate([0, l/2 - 90/2 - 86 + 2, -25])
    cylinder(d=5, h=40);
}