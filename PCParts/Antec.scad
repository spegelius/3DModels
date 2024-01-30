use <../Dollo/NEW_long_ties/include.scad>;
use <common.scad>;


stl_base_path = "../_downloaded/";
adapter_stl_path = str(
    stl_base_path,
    "HDD Adapter 3.2/"
);


//debug_elevenhundred_hdd_rail();
//debug_elevenhundred_hdd_rail_ssd_adapter();
//debug_elevenhundred_ssd_rail();

//elevenhundred_hdd_rail();
//elevenhundred_ssd_rail_right();
elevenhundred_ssd_rail_left();


module debug_elevenhundred_hdd_rail() {
    %translate([102/2, 146/2, 0])
    rotate([0, 0, 180])
    mock_hd();

    translate([102/2 + 6.4/2 + 1, -11, 12.5/2 + 0.1])
    elevenhundred_hdd_rail();

    translate([-102/2 - 6.4/2 - 1, -11, 12.5/2 + 0.1])
    rotate([0, 180, 0])
    elevenhundred_hdd_rail();
}

module debug_elevenhundred_ssd_rail() {
    rotate([0, 180, 0])
    elevenhundred_ssd_rail_right();

    translate([70 + 4.5, 0, 0])
    rotate([0, 180, 0])
    elevenhundred_ssd_rail_left();

    %translate([70  + 4.5/2, 100.5/2 + 7, -4])
    rotate([0, 0, 180])
    mock_ssd_enterprise();
}

module debug_elevenhundred_hdd_rail_ssd_adapter() {
//    translate([-10, -16.5, 3.5])
//    rotate([0, 0, -90])
//    import(str(
//        adapter_stl_path,
//        "hdd_adapter_32_minimalist_sunk_screwholes.stl"
//    ));

    translate([-10, -16.5, 0])
    rotate([0, 0, -90])
    import(str(
        adapter_stl_path,
        "hdd_adapter_32_sunk_screwholes.stl"
    ));

//    %translate([102/2, 146/2, 0])
//    rotate([0, 0, 180])
//    mock_hd();

    translate([70/2, 65.5, 5])
    rotate([0, 0, 180])
    mock_ssd_enterprise();

    translate([102/2 + 6.4/2 + 1, -11, 12.5/2 + 0.1])
    elevenhundred_hdd_rail();

//    translate([-102/2 - 6.4/2 - 1, -11, 12.5/2 + 0.1])
//    rotate([0, 180, 0])
//    elevenhundred_hdd_rail();
}

module _rail(w, l, h) {
    difference() {
        union() {
            cube([w, l, h], center=true);

            translate([w/2 - 5/2, -l/2, 0])
            cylinder(
                d=5, h=h,
                center=true, $fn=30
            );

            // handle
            translate([0, -l/2 - 12/2 - 0.5, 0])
            rotate([0, 0, 3])
            translate([-22/2 + 2, 0, 0])
            difference() {
                chamfered_cube_side(
                    22, 12, h, 3, center=true
                );

                translate([2, 0, 0])
                chamfered_cube_side(
                    22, 8, h + 1, 2, center=true
                );

                translate([3.5, -12/2, 0])
                cube([22, 5, h + 1], center=true);
            }

            // lock nub
            translate([
                6.4/2 - 1/2, -l/2 + 4, 0
            ])
            hull() {
                translate([0, 2/2, 0])
                cube([1, 2, 6.5], center=true);

                translate([0, 4, 0])
                cube([1, 1, 2], center=true);

                translate([1, 2/2, 0])
                cube([1, 2, 5], center=true);
            }
        }

        // handle cutout
        hull() {
            translate([w/2 - 1/2 - 2, -l/2, 0])
            cylinder(
                d=1, h=13, center=true, $fn=20
            );

            translate([
                -10/2 + w/2 - 2,
                -l/2 + 12, 0
            ])
            cube([10, 1, 13], center=true);

            translate([w/2 - 2, -l/2 - 1/2.4, 0])
            rotate([0, 0, 3])
            translate([-10/2, 1/2, 0])
            cube([10, 1, 13], center=true);
        }

        // chamfers
        translate([0, l/2, h/2])
        rotate([45, 0, 0])
        cube([10, 5, 5], center=true);

        translate([0, l/2, -h/2])
        rotate([45, 0, 0])
        cube([10, 5, 5], center=true);

        translate([0, -l/2 + 12, h/2])
        rotate([45, 0, 0])
        cube([10, 2, 2], center=true);

        translate([0, -l/2 + 12, -h/2])
        rotate([45, 0, 0])
        cube([10, 2, 2], center=true);
    }
}

module elevenhundred_hdd_rail() {
    difference() {
        union() {
            _rail(6.4, 129, 12.5);

            // center hd hole nubs
            translate([0, -45.8, 0])
            rotate([0, -90, 0])
            cylinder(d=2, h=6, $fn=30);

            translate([0, 55.7, 0])
            rotate([0, -90, 0])
            cylinder(d=2, h=6, $fn=30);
        }

        // bolt hole
        translate([0, 14.2, 0])
        rotate([0, 90, 0]) {
            cylinder(d=4.4, h=10, center=true, $fn=30);

            translate([0, 0, -1])
            cylinder(d=11, h=5, $fn=30);
        }
    }
}


module _elevenhundred_ssd_rail() {
    w = 4.5;
    l = 100;
    h = 8;

    difference() {
        _rail(w, l, h);

        // bolt holes
        translate([-w/2 + 1.4, 100/2 - 6.75, 1])
        rotate([0, 90, 0]) {
            cylinder(d=3.3, h=10, center=true, $fn=30);

            cylinder(d=6.5, h=5, $fn=30);

            translate([-5/2, 0, 5/2])
            cube([5, 5, 5], center=true);
        }

        translate([-w/2 + 1.4, -100/2 + 16.75, 1])
        rotate([0, 90, 0]) {
            cylinder(d=3.3, h=10, center=true, $fn=30);

            cylinder(d=6.5, h=5, $fn=30);

            translate([-5/2, 0, 5/2])
            cube([5, 5, 5], center=true);
        }

    }
}

module elevenhundred_ssd_rail_right() {
    _elevenhundred_ssd_rail();
}

module elevenhundred_ssd_rail_left() {
    mirror([1, 0, 0])
    _elevenhundred_ssd_rail();
}