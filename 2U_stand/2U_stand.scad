use <../Dollo/NEW_long_ties/include.scad>;

stl_path = 
    "../_downloaded/2U_Rackmount_tower_stand/";

2U_h = 44.45 * 2;


//mock_2U_server();
debug();
//debug_handle();

//side_tube();
//side_tube(148);
//stand_bottom();
//handle();


module mock_2U_server() {
    translate([0, 0, 440/2])
    cube([2U_h, 800, 440], center=true);
}

module debug() {
    rod_h = 100 + 200 + 148 + 80 -25/2 + 8;
    echo(rod_h);

    mock_2U_server();

    translate([0, 0, -10])
    rotate([0, 180, 0])
    import(str(stl_path,
        "2U_rackmount_vertical_stand-v1.stl"),
        convexity=10);

    translate([0, -100, -15.1])
    stand_bottom();

    translate([2U_h/2 + 6, -100, 100 + 200 - 15])
    rotate([180, 0, 0])
    side_tube();

    translate([2U_h/2 + 6, -100, 100 + 200 + 148 - 15 + 0.1])
    rotate([180, 0, 0])
    side_tube(148);

    translate([0, -100, 440 - 7 + 0.2])
    rotate([90, 0, 0])
    handle(supports=false);

    translate([2U_h/2 + 6, -100, -15])
    cylinder(d=8, h=rod_h, $fn=40);
}

module debug_handle() {
    intersection() {
        union() {
            handle();

            translate([2U_h/2 + 6, -0.1, 0])
            rotate([90, 0, 0])
            side_tube();
        }

        cube([103, 400, 16], center=true);
    }

    
}

module stand_bottom() {

    module _side_coutout() {
        difference() {
            chamfered_cube(200, 300, 200, 50, center=true);

            translate([200/2 + 4, 0, 0])
            cylinder(d=22, h=400, center=true, $fn=40);

            translate([-200/2 - 4, 0, 0])
            cylinder(d=22, h=400, center=true, $fn=40);
        }
    }

    module _infill_lines() {
        lengths = [[-45, 160],
                   [-35, 170],
                   [-25, 180],
                   [-15, 180],
                   [-6, 180],
                   [6, 180],
                   [15, 180],
                   [25, 180],
                   [35, 170],
                   [45, 160]];

        for(i = lengths) {
            translate([0, i[0], 7]) {
                cube([i[1], 0.05, 10], center=true);
                cube([200, 0.05, 0.3], center=true);
            }

        }

        translate([-2U_h/2 - 11, 4, 11])
        cylinder(d=0.1, h=100);

        translate([-2U_h/2 - 11, -4, 11])
        cylinder(d=0.1, h=100);

        translate([2U_h/2 + 11, 4, 11])
        cylinder(d=0.1, h=100);

        translate([2U_h/2 + 11, -4, 11])
        cylinder(d=0.1, h=100);
    }
    
    difference() {
        translate([0, 0, 100/2])
        hull() {
            rounded_cube_side(
                190, 80, 100, 20, center=true, $fn=40);

            rounded_cube_side(
                160, 100, 100, 20, center=true, $fn=40);
        }
        translate([0, 0, 200/2 + 15])
        cube([2U_h + 0.5, 200, 200], center=true);

        translate([-200/2 - 2U_h/2 - 10, 0, 200/2])
        _side_coutout();

        translate([200/2 + 2U_h/2 + 10, 0, 200/2])
        _side_coutout();

        translate([-2U_h/2 - 6, 0, 0])
        cylinder(d=8.5, h=400, center=true, $fn=40);

        translate([-2U_h/2 - 6, 0, -0.1])
        M8_nut_tapering(10, cone=false, bridging=true);

        translate([-2U_h/2 - 6, 0, 100])
        cube([4, 17, 6], center=true);

        translate([2U_h/2 + 6, 0, 0])
        cylinder(d=8.5, h=400, center=true, $fn=40);

        translate([2U_h/2 + 6, 0, -0.1])
        M8_nut_tapering(10, cone=false, bridging=true);

        translate([2U_h/2 + 6, 0, 100])
        cube([4, 17, 6], center=true);

        // bottom pattern
        for (i = [0:8]) {
            translate([0, -40 + i * 10, 0])
            rotate([45, 0, 0])
            cube([200, 4, 4], center=true);
        }

        // infill
        _infill_lines();

        // chamfer
        translate([0, 100/2, 100])
        rotate([45, 0, 0])
        cube([200, 25, 25], center=true);

        translate([0, -100/2, 100])
        rotate([45, 0, 0])
        cube([200, 25, 25], center=true);

    }
}

module side_tube(h=200) {
    difference() {
        union() {
            intersection() {
                cylinder(d=22, h=h, $fn=40);

                translate([5.3, 0, h/2])
                cube([22, 20, h], center=true);
            }

            translate([0, 0, h])
            cube([3.7, 16.7, 5.6], center=true);
        }

        cylinder(d=8.5, h=3*h, center=true, $fn=40);

        cube([4, 17, 6], center=true);

        // infill
        translate([0, 6, 4])
        cylinder(d=0.5, h=h);

        translate([0, -6, 4])
        cylinder(d=0.5, h=h);

        translate([6, 0, -1])
        cylinder(d=0.5, h=h + 2);
    }
}

module handle(supports=true) {
    intersection () {
        difference() {
            union() {
                translate([2U_h/2 + 6, 0, 0])
                rotate([-90, 0, 0])
                cylinder(d=22, h=70, $fn=40);

                translate([-2U_h/2 - 6, 0, 0])
                rotate([-90, 0, 0])
                cylinder(d=22, h=70, $fn=40);

                translate([0, 60, 0])
                rotate([0, 90, 0])
                cylinder(d=22, h=100, center=true, $fn=40);

                translate([0, 12, 0])
                cube([2U_h + 12, 10, 20], center=true);

                translate([2U_h/2 + 6, 0, 0])
                cube([3.7, 5.6, 16.7], center=true);

                translate([-2U_h/2 - 6, 0, 0])
                cube([3.7, 5.6, 16.7], center=true);

            }

            cube([2U_h + 0.5, 14, 100], center=true);

            translate([0, 60, 0])
            rotate([0, 90, 0])
            rotate([0, 0, 180])
            cylinder(d=8, h=2U_h + 12, center=true, $fn=5);

            translate([-2U_h/2 - 6, 0, 0]) {
                rotate([90, 0, 0])
                cylinder(d=8.5, h=400, center=true, $fn=40);

                translate([0, 80, 0])
                rotate([-90, 0, 0])
                cylinder(d=16.3, h=25, center=true, $fn=40);

            }

            translate([2U_h/2 + 6, 0, 0]) {
                rotate([90, 0, 0])
                cylinder(d=8.5, h=400, center=true, $fn=40);

                translate([0, 80, 0])
                rotate([-90, 0, 0])
                cylinder(d=16.3, h=25, center=true, $fn=40);

            }

            translate([0, -10/2, 0])
            cube([200, 10, 9.2], center=true);

            // infill
            translate([2U_h/2 + 12, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=0.5, h=200, center=true);

            translate([-2U_h/2 - 12, 0, 0])
            rotate([90, 0, 0])
            cylinder(d=0.5, h=200, center=true);

            translate([2U_h/2 + 6, 0, 6])
            rotate([90, 0, 0])
            cylinder(d=0.5, h=200, center=true);

            translate([-2U_h/2 - 6, 0, 6])
            rotate([90, 0, 0])
            cylinder(d=0.5, h=200, center=true);

            translate([2U_h/2 + 6, 0, -6])
            rotate([90, 0, 0])
            cylinder(d=0.5, h=200, center=true);

            translate([-2U_h/2 - 6, 0, -6])
            rotate([90, 0, 0])
            cylinder(d=0.5, h=200, center=true);

            translate([0, 66, 0])
            rotate([0, 90, 0])
            cylinder(d=0.5, h=2U_h + 12, center=true);

            translate([0, 64, -6])
            rotate([0, 90, 0])
            cylinder(d=0.5, h=2U_h + 12, center=true);

            translate([0, 64, 6])
            rotate([0, 90, 0])
            cylinder(d=0.5, h=2U_h + 12, center=true);

        }

        cube([200, 200, 20], center=true);
    }
    
    if (supports) {
        // supports
        translate([-2U_h/2 - 6, -2.6/2 - 0.2, -20/2 + 1.4/2])
        cube([3.7, 2.6, 1.4], center=true);

        translate([2U_h/2 + 6, -2.6/2 - 0.2, -20/2 + 1.4/2])
        cube([3.7, 2.6, 1.4], center=true);

        translate([-2U_h/2 - 6, -2.6/2 - 0.2, 0])
        cube([3.7, 2.6, 8.7], center=true);

        translate([2U_h/2 + 6, -2.6/2 - 0.2, 0])
        cube([3.7, 2.6, 8.7], center=true);
    }
}