use <../Dollo/NEW_long_ties/extention.scad>;
use <../Dollo/NEW_long_ties/long_tie.scad>;
use <../Dollo/NEW_long_ties/long_bow_tie.scad>;
include <variables.scad>;

use <common.scad>;


//extention_100();
//extention_110();
//extention_310();
//extention_360();
//extention_155();
//extention_135();
extention_140();
//extention_150();
//extention_t_case(440, 2);
//extention_t_case(540, 3);
//long_tie_half_30(lower_z=0.1);
//long_bow_tie_half_40(lower_z=0.1);


module extention_100() {
    extention(100/30);
}

module extention_110() {
    extention(110/30);
}

module extention_135() {
    extention(135/30);
}

module extention_140() {
    extention(140/30);
}

module extention_150() {
    extention(150/30);
}

module extention_155() {
    extention(155/30);
}

module extention_310() {
    extention(310/30);
}

module extention_360() {
    extention(360/30);
}

module extention_t_case(
    depth, e_count_d, supports=true
) {
    
    e_units_d = e_units(depth);

    e_length_d = e_length(e_units_d, e_count_d);

    e_length_t = t_length(e_length_d);
    units_t = e_length_t/30;
    offset_t = t_offset(e_length_t);

    extention_t(
        units1=units_t, units2=1,
        _offset=-offset_t, supports=supports
    );
}

module long_tie_half_30(lower_z=0.0) {
    intersection() {
        translate([0, 0, -lower_z])
        long_tie_half(30);

        translate([0, 0, 10/2])
        cube([50, 50, 10], center=true);
    }
}

module long_bow_tie_half_40(lower_z=0.0) {
    intersection() {
        translate([0, 0, -lower_z])
        long_bow_tie_half(40);

        translate([0, 0, 10/2])
        cube([50, 50, 10], center=true);
    }
}

