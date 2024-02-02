
stl_path = "../_downloaded/Tesla/Tesla Lug Nut Covers/";


//_orig_s();


//new_lug_nut_cover_t();
//new_letter_t();
//new_lug_nut_cover_e();
//new_letter_e();
//new_lug_nut_cover_s();
//new_letter_s();
//new_lug_nut_cover_l();
//new_letter_l();
//new_lug_nut_cover_a();
new_letter_a();


module _orig_t() {
    import(str(
        stl_path, 
        "Tesla_Model_SX_Lug_Cover_-_Flat_-_T.stl"
    ), convexity=10);
}

module _orig_e() {
    import(str(
        stl_path, 
        "Tesla_Model_SX_Lug_Cover_-_Flat_-_E.stl"
    ), convexity=10);
}

module _orig_s() {
    import(str(
        stl_path, 
        "Tesla_Model_SX_Lug_Cover_-_Flat_-_S.stl"
    ), convexity=10);
}

module _orig_l() {
    import(str(
        stl_path, 
        "Tesla_Model_SX_Lug_Cover_-_Flat_-_L.stl"
    ), convexity=10);
}

module _orig_a() {
    import(str(
        stl_path, 
        "Tesla_Model_SX_Lug_Cover_-_Flat_-_A.stl"
    ), convexity=10);
}

module _orig_insert_s() {
    import(str(
        stl_path, 
        "Letter_Insert_-_Flat_-_S.stl"
    ), convexity=10);
}


module new_lug_nut_cover_t() {
    union() {
        translate([0, 0, 2])
        rotate([90, 0, 0])
        _orig_t();

        translate([0, 0, 0.4])
        cylinder(d=26, h=2.6, $fn=6);
    }
}

module new_letter_t() {
    difference() {
        cylinder(d=26, h=2, $fn=6);

        new_lug_nut_cover_t();
    }
}

module new_lug_nut_cover_e() {
    union() {
        translate([0, 0, 2])
        rotate([90, 0, 0])
        _orig_e();

        translate([0, 0, 0.4])
        cylinder(d=26, h=2.6, $fn=6);
    }
}

module new_letter_e() {
    difference() {
        cylinder(d=26, h=2, $fn=6);

        new_lug_nut_cover_e();
    }
}

module new_lug_nut_cover_s() {
    union() {
        translate([0, 0, 2])
        rotate([90, 0, 0])
        _orig_s();

        translate([0, 0, 0.4])
        cylinder(d=26, h=2.6, $fn=6);
    }
}

module new_letter_s() {
    difference() {
        cylinder(d=26, h=2, $fn=6);

        new_lug_nut_cover_s();
    }
}

module new_lug_nut_cover_l() {
    union() {
        translate([0, 0, 2])
        rotate([90, 0, 0])
        _orig_l();

        translate([0, 0, 0.4])
        cylinder(d=26, h=2.6, $fn=6);
    }
}

module new_letter_l() {
    difference() {
        cylinder(d=26, h=2, $fn=6);

        new_lug_nut_cover_l();
    }
}

module new_lug_nut_cover_a() {
    union() {
        translate([0, 0, 2])
        rotate([90, 0, 0])
        _orig_a();

        translate([0, 0, 0.4])
        cylinder(d=26, h=2.6, $fn=6);
    }
}

module new_letter_a() {
    difference() {
        cylinder(d=26, h=2, $fn=6);

        new_lug_nut_cover_a();
    }
}
