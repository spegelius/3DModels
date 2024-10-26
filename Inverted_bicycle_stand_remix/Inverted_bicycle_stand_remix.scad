use <../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Inverted bicycle stands/"
);

screw_d = 20;

//debug();
bike_stand_v4();
//bike_stand_v4_screw();
//bike_stand_v4_screw(extra_slop=1);

//test_part_screw();
//test_part_stand_thread();


module _orig_stand() {
    import(
        str(spath, "bike_stand_v3.stl"),
        convexity=10
    );
}

module debug() {
    intersection() {
       bike_stand_v4();

       translate([200/2, 0, 0])
       cube([200, 200, 400], center=true);
    }

    translate([0, 0, 26.5])
    bike_stand_v4_screw();
}

module bike_stand_v4() {
    difference() {
        union() {
            rotate([90, 0, 0])
            _orig_stand();

            difference() {
                hull() {
                    translate([0, 0, 125])
                    rotate([0, 90, 0])
                    cylinder(
                        d=47, h=60,
                        center=true, $fn=80
                    );

                    translate([0, 0, 125 + 47/2])
                    cube([60, 15, 1], center=true);
                }

                translate([-60/2, 0, 96.45])
                rotate([0, -45, 0])
                cube([10, 30, 70], center=true);

                translate([60/2, 0, 96.45])
                rotate([0, 45, 0])
                cube([10, 30, 70], center=true);
            }
        }

        // handle hole
        hull() {
            translate([0, 0, 125])
            rotate([0, 90, 0])
            cylinder(
                d=37, h=65, center=true, $fn=80
            );

            translate([0, 0, 125 + 37/2])
            cube([60, 11, 1], center=true);
        }

        // screw hole
        translate([0, 0, 95])
        v_screw(
            h=20,
            screw_d=screw_d + 0.5,
            pitch=3,
            direction=0,
            steps=80,
            depth=0.4
        );
    }

//    %translate([0, 0, 125])
//    rotate([0, 90, 0])
//    cylinder(d=35, h=60, center=true);
}

module bike_stand_v4_screw(extra_slop=0) {
    difference() {
        union() {
            cylinder(
                d=screw_d - 0.25 - extra_slop,
                h=66, $fn=50
            );
            
            chamfered_cylinder(
                25, 30, 2, $fn=50
            );

            translate([0, 0, 65])
            v_screw(
                h=20,
                screw_d=screw_d - extra_slop,
                pitch=3,
                direction=0,
                steps=80,
                depth=0.4,
                chamfer=true
            );
        }

        cylinder(d=8, h=83*2, center=true, $fn=20);

        for(i = [0:13]) {
            rotate([0, 0, i*360/14])
            translate([25/2, 0, 0])
            rotate([0, 0, 45])
            cube([2, 2, 200], center=true);
        }

        for(i = [0:3]) {
            translate([0, 0, 6 + 6*i])
            cube_donut(25, 2, $fn=50);
        }
    }
}

module test_part_screw() {

    union() {
        translate([0, 0, -60])
        intersection() {
            bike_stand_v4_screw();

            translate([0, 0, 60])
            cylinder(d=100, h=15);
        }

        intersection() {
            translate([0, 0, 3])
            rotate([0, 90, 0])
            cylinder(d=8, h=50, center=true, $fn=40);

            cylinder(d=100, h=10);
        }
    }
}

module test_part_stand_thread() {

    translate([0, 0, -95])
    intersection() {
        bike_stand_v4();

        translate([0, 0, 95])
        cylinder(d=40, h=10, $fn=6);
    }
}