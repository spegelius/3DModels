use <../../../../Dollo/NEW_long_ties/include.scad>;


stl_base_path = "../../../../_downloaded/Anycubic/";
spath = str(
    stl_base_path, "Kobra S1/Door Seal/"
);


//_orig_door_seal_half_ml();
//_orig_door_seal_half_mr();
//_orig_door_seal_half_or();
//_orig_door_seal_half_ol();
//_orig_door_seal_half_ul();
//_orig_door_seal_half_ur();

//debug();

//kobra_s1_door_seal_half_ml_v2();
//kobra_s1_door_seal_half_mr_v2();
//kobra_s1_door_seal_half_or_v2();
//kobra_s1_door_seal_half_ol_v2();
//kobra_s1_door_seal_half_ur_v2();
kobra_s1_door_seal_half_ul_v2();


module _orig_door_seal_half_ml() {
    translate([0, 0, 5])
    import(
        str(spath, "kobra-s1-door-seal-half-ml.stl"),
        convexity=10
    );
}

module _orig_door_seal_half_mr() {
    translate([0, 0, 5])
    import(
        str(spath, "kobra-s1-door-seal-half-mr.stl"),
        convexity=10
    );
}

module _orig_door_seal_half_or() {
    translate([0, 0, 5])
    import(
        str(spath, "kobra-s1-door-seal-half-or.stl"),
        convexity=10
    );
}

module _orig_door_seal_half_ol() {
    translate([0, 0, 5])
    import(
        str(spath, "kobra-s1-door-seal-half-ol.stl"),
        convexity=10
    );
}

module _orig_door_seal_half_ul() {
    translate([0, 0, 5])
    import(
        str(spath, "kobra-s1-door-seal-half-ul.stl"),
        convexity=10
    );
}

module _orig_door_seal_half_ur() {
    translate([0, 0, 5])
    import(
        str(spath, "kobra-s1-door-seal-half-ur.stl"),
        convexity=10
    );
}

module debug() {
    intersection() {
        union() {
            kobra_s1_door_seal_half_ml_v2();
            kobra_s1_door_seal_half_mr_v2();
            kobra_s1_door_seal_half_or_v2();
            kobra_s1_door_seal_half_ol_v2();
            kobra_s1_door_seal_half_ur_v2();
            kobra_s1_door_seal_half_ul_v2();
        }

        translate([0, 0, 0])
        cube([800, 800, 7.6], center=true);
    }
}

module kobra_s1_door_seal_half_ml_v2() {
    union() {
        _orig_door_seal_half_ml();

        for(i = [0:100]) {
            translate([4.8, -129.8 + i*10.38/4, 3.7])
            cube([8, 1, 0.2], center=true);
        }
    }
}

module kobra_s1_door_seal_half_mr_v2() {
    union() {
        _orig_door_seal_half_mr();

        for(i = [0:92]) {
            translate([-331.4, -118.6 + i*10.31/4, 3.7])
            cube([8, 1, 0.2], center=true);
        }
    }
}

module kobra_s1_door_seal_half_or_v2() {
    union() {
        _orig_door_seal_half_or();

        for(i = [0:16]) {
            translate([-331.4, -151.6 - i*10/4, 3.7])
            cube([8, 1, 0.2], center=true);
        }

        translate([-327.8, -197.2, 3.7])
        rotate([0, 0, 45])
        cube([8, 1, 0.2], center=true);

        translate([-329.8, -194.6, 3.7])
        rotate([0, 0, 45/2])
        cube([8, 1, 0.2], center=true);

        translate([-324.8, -199.6, 3.7])
        rotate([0, 0, 67.5])
        cube([8, 1, 0.2], center=true);

        translate([-163.8, -200.9, 3.7])
        cube([1, 8, 0.2], center=true);

        for(i = [0:59]) {
            translate([-166.3 - i*10.5/4, -200.2, 3.7])
            cube([1, 8, 0.2], center=true);
        }
    }
}

module kobra_s1_door_seal_half_ol_v2() {
    union() {
        _orig_door_seal_half_ol();

        for(i = [0:17]) {
            translate([4.8, -147.8 - i*10/4, 3.7])
            cube([8, 1, 0.2], center=true);
        }

        translate([2, -197, 3.7])
        rotate([0, 0, -45])
        cube([8, 1, 0.2], center=true);

        translate([4, -194, 3.7])
        rotate([0, 0, -45/2])
        cube([8, 1, 0.2], center=true);

        translate([-1, -199, 3.7])
        rotate([0, 0, -67.5])
        cube([8, 1, 0.2], center=true);

        translate([-160.8, -200.9, 3.7])
        cube([1, 8, 0.2], center=true);

        for(i = [0:59]) {
            translate([-158 + i*10.4/4, -200.2, 3.7])
            cube([1, 8, 0.2], center=true);
        }
    }
}

module kobra_s1_door_seal_half_ul_v2() {
    union() {
        _orig_door_seal_half_ul();

        for(i = [0:17]) {
            translate([4.8, 147.8 + i*10/4, 3.7])
            cube([8, 1, 0.2], center=true);
        }

        translate([2, 197, 3.7])
        rotate([0, 0, 45])
        cube([8, 1, 0.2], center=true);

        translate([4, 194, 3.7])
        rotate([0, 0, 45/2])
        cube([8, 1, 0.2], center=true);

        translate([-1, 199, 3.7])
        rotate([0, 0, 67.5])
        cube([8, 1, 0.2], center=true);

        translate([-160.8, 200.9, 3.7])
        cube([1, 8, 0.2], center=true);

        for(i = [0:59]) {
            translate([-158 + i*10.4/4, 200.2, 3.7])
            cube([1, 8, 0.2], center=true);
        }
    }
}

module kobra_s1_door_seal_half_ur_v2() {
    union() {
        _orig_door_seal_half_ur();

        for(i = [0:16]) {
            translate([-331.4, 151.6 + i*10/4, 3.7])
            cube([8, 1, 0.2], center=true);
        }

        translate([-327.8, 197.2, 3.7])
        rotate([0, 0, -45])
        cube([8, 1, 0.2], center=true);

        translate([-329.9, 194.5, 3.7])
        rotate([0, 0, -45/2])
        cube([8, 1, 0.2], center=true);

        translate([-324.8, 199.2, 3.7])
        rotate([0, 0, -67.5])
        cube([8, 1, 0.2], center=true);

        translate([-163.8, 200.9, 3.7])
        cube([1, 8, 0.2], center=true);

        for(i = [0:59]) {
            translate([-166.2 - i*10.5/4, 200.2, 3.7])
            cube([1, 8, 0.2], center=true);
        }
    }
}