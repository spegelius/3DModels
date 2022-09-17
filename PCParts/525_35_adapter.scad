include <common.scad>;
use <Antec.scad>;


//debug_2x525_to_35();
//2x525_to_35_right();
//2x525_to_35_left();
//525_fan_mount();
525_fan_cover();


module debug_2x525_to_35() {
    %mock_dvdrom();

    %translate([0, 0, 43])
    mock_dvdrom();

    translate([hd_width/2, 146/2 + 10, 2])
    rotate([0, 0, 180])
    mock_hd();
    
    translate([hd_width/2, 146/2 + 10, 30.5])
    rotate([0, 0, 180])
    mock_hd();

    translate([hd_width/2, 146/2 + 10, 59])
    rotate([0, 0, 180])
    mock_hd();

    translate([102/2, 3, 80/2])
    rotate([0, 90, 0])
    2x525_to_35_right();

    translate([-102/2, 3, 80/2])
    rotate([0, -90, 0])
    2x525_to_35_left();

    translate([0, -80, 80/2])
    rotate([90, 0, 0])
    mock_fan_80mm();

    translate([0, -65, 80/2])
    rotate([90, 0, 0])
    525_fan_mount();

    translate([0, -95, 85/2 - 2.5])
    rotate([-90, 0, 0])
    525_fan_cover();
    //    translate([102/2 + 3.3, 9, 12.5/2 + 2])
//    rotate([0, 0, 0])
//    elevenhundred_hdd_rail();
//
//    translate([102/2 + 3.3, 9, 12.5/2 + 30.5])
//    rotate([0, 0, 0])
//    elevenhundred_hdd_rail();
//
//    translate([102/2 + 3.3, 9, 12.5/2 + 59])
//    rotate([0, 0, 0])
//    elevenhundred_hdd_rail();
//
}

module 2x525_to_35_right() {

    module _mount_tower() {
        difference() {
            hull() {
                translate([-11.5/2, 0, 0])
                cylinder(d1=15, d2=11, h=46/2, $fn=30);

                translate([11.5/2, 0, 0])
                cylinder(d1=15, d2=11, h=46/2, $fn=30);
            }

            translate([-11.5/2, 0, 0])
            cylinder(d=2.8, h=80, center=true, $fn=20);

            translate([11.5/2, 0, 0])
            cylinder(d=2.8, h=80, center=true, $fn=20);
        }
    }

    difference() {
        union() {
            translate([0, 0, 3/2])
            rounded_cube_side(
                76, 135, 3, 14, center=true, $fn=70
            );

            translate([-19.2, -39.5, 0])
            _mount_tower();

            translate([-19.2 + 43, -39.5, 0])
            _mount_tower();

            translate([-19.2, 35.5, 0])
            _mount_tower();

            translate([-19.2 + 43, 35.5, 0])
            _mount_tower();

            translate([-80/2 + 15, -135/2 + 7/2, 10/2])
            rotate([90, 0, 0])
            chamfered_cube_side(
                10, 10, 7, 2.5, center=true
            );

            translate([80/2 - 15, -135/2 + 7/2, 10/2])
            rotate([90, 0, 0])
            chamfered_cube_side(
                10, 10, 7, 2.5, center=true
            );
        }

        translate([80/2 - 8.4, -49.8, 1.8]) {
            cylinder(d=4, h=50, center=true, $fn=30);
            cylinder(d=9.4, h=30, $fn=30);
        }

        translate([80/2 - 8.4, 10.2, 1.8]) {
            cylinder(d=4, h=50, center=true, $fn=30);
            cylinder(d=9.4, h=30, $fn=30);
        }

        translate([80/2 - 8.4, 51.7, 1.8]) {
            cylinder(d=4, h=50, center=true, $fn=30);
            cylinder(d=9.4, h=30, $fn=30);
        }

        translate([80/2 - 8.4 - 28.5, -49.8, 1.8]) {
            cylinder(d=4, h=50, center=true, $fn=30);
            cylinder(d=9.4, h=30, $fn=30);
        }

        translate([80/2 - 8.4 - 28.5, 10.2, 1.8]) {
            cylinder(d=4, h=50, center=true, $fn=30);
            cylinder(d=9.4, h=30, $fn=30);
        }

        translate([80/2 - 8.4 - 28.5, 51.7, 1.8]) {
            cylinder(d=4, h=50, center=true, $fn=30);
            cylinder(d=9.4, h=30, $fn=30);
        }

        translate([80/2 - 8.4 - 2*28.5, -49.8, 1.8]) {
            cylinder(d=4, h=50, center=true, $fn=30);
            cylinder(d=9.4, h=30, $fn=30);
        }

        translate([80/2 - 8.4 - 2*28.5, 10.2, 1.8]) {
            cylinder(d=4, h=50, center=true, $fn=30);
            cylinder(d=9.4, h=30, $fn=30);
        }

        translate([80/2 - 8.4 - 2*28.5, 51.7, 1.8]) {
            cylinder(d=4, h=50, center=true, $fn=30);
            cylinder(d=9.4, h=30, $fn=30);
        }

        translate([-80/2 + 15, -135/2, 10/2])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=20, center=true, $fn=20);

        translate([80/2 - 15, -135/2, 10/2])
        rotate([90, 0, 0])
        cylinder(d=2.8, h=20, center=true, $fn=20);
    }
}

module 2x525_to_35_left() {
    mirror([1, 0, 0])
    2x525_to_35_right();
}

module 525_fan_mount() {

    module _mount_side() {
        difference() {
            union() {
                translate([0, 1/2, 2.2/2])
                chamfered_cube_side(
                    23, 81, 2.2, 3, center=true
                );

                translate([8.5, 25, 2.2/2])
                chamfered_cube_side(
                    20, 10, 2.2, 2.5, center=true
                );

                translate([8.5, -25, 2.2/2])
                chamfered_cube_side(
                    20, 10, 2.2, 2.5, center=true
                );
            }
            translate([-6.5, 72/2, 0])
            cylinder(d=5.3, h=20, center=true, $fn=30);

            translate([-6.5, -72/2, 0])
            cylinder(d=5.3, h=20, center=true, $fn=30);

            translate([13.5, -25, 0])
            cylinder(d=3.5, h=20, center=true, $fn=30);
            
            translate([13.5, 25, 0])
            cylinder(d=3.5, h=20, center=true, $fn=30);

            translate([-72/2 - 6.5, 0, -0.1])
            cylinder(d2=79.8, d1=82, h=3, $fn=80);

            translate([22/2 + 1, 80/2 + 1, 0])
            rotate([0, 0, 45])
            cube([14, 14, 10], center=true);

            translate([22/2 + 1, -80/2 - 1, 0])
            rotate([0, 0, 45])
            cube([14, 14, 10], center=true);
        }
    }

    union() {
        translate([80/2 + 2.5, 0, 0])
        _mount_side();

        mirror([1, 0, 0])
        translate([80/2 + 2.5, 0, 0])
        _mount_side();

        hull() {
            translate([0, 80/2 + 2, 2.2/2])
            cube([88, 3, 2.2], center=true);

            translate([0, 80/2 + 2, 10/2])
            cube([78, 3, 10], center=true);
        }
    }
}

module 525_fan_cover() {
    union() {
        import(
"../_downloaded/Customizable_generic_fanguard/fanguard_80.stl"
        );

        difference() {
            translate([0, -2.5, 2/2])
            cube([148, 85, 2], center=true);

            cube([77, 77, 10], center=true);
        }
    }
}