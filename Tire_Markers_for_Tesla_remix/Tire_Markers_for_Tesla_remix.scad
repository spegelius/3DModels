use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Tire markers for Tesla Model 3 Wheels/"
);


//_orig_marker_en("FL");
//_orig_marker_en("FR");
//_orig_marker_en("RL");
//_orig_marker_en("RR");
//_orig_marker_fin("OE");
//_orig_marker_fin("OT");
//_orig_marker_fin("VE");
//_orig_marker_fin("VT");

//EN_Tiremarkers_FL_dc();
//EN_Tiremarkers_FL_dc_text();
//EN_Tiremarkers_FR_dc();
//EN_Tiremarkers_FR_dc_text();
//EN_Tiremarkers_RL_dc();
//EN_Tiremarkers_RL_dc_text();
//EN_Tiremarkers_RR_dc();
//EN_Tiremarkers_RR_dc_text();

//FIN_Tiremarkers_OE_dc();
//FIN_Tiremarkers_OE_dc_text();
//FIN_Tiremarkers_OT_dc();
//FIN_Tiremarkers_OT_dc_text();
//FIN_Tiremarkers_VE_dc();
//FIN_Tiremarkers_VE_dc_text();
//FIN_Tiremarkers_VT_dc();
FIN_Tiremarkers_VT_dc_text();


module _orig_marker_en(marker) {
    import(
        str(spath, "EN-Tiremarkers-", marker, ".stl"),
        convexity=10
    );
}

module _orig_marker_fin(marker) {
    import(
        str(spath, "FIN-Tiremarkers-", marker, ".stl"),
        convexity=10
    );
}

module EN_Tiremarkers_FL_dc() {
    union() {
        translate([23, -17, 0.4])
        cylinder(d=27, h=3);

        _orig_marker_en("FL");
    }
}

module EN_Tiremarkers_FL_dc_text() {
    difference() {
        translate([23, -17, 0])
        cylinder(d=27, h=3);

        EN_Tiremarkers_FL_dc();
    }
}

module EN_Tiremarkers_FR_dc() {
    union() {
        translate([-18, 22, 0.4])
        cylinder(d=27, h=3);

        _orig_marker_en("FR");
    }
}

module EN_Tiremarkers_FR_dc_text() {
    difference() {
        translate([-18, 22, 0])
        cylinder(d=27, h=3);

        EN_Tiremarkers_FR_dc();
    }
}

module EN_Tiremarkers_RL_dc() {
    union() {
        translate([23.5, 23, 0.4])
        cylinder(d=27, h=3);

        _orig_marker_en("RL");
    }
}

module EN_Tiremarkers_RL_dc_text() {
    difference() {
        translate([23.5, 23, 0])
        cylinder(d=27, h=3);

        EN_Tiremarkers_RL_dc();
    }
}

module EN_Tiremarkers_RR_dc() {
    union() {
        translate([-17, -16, 0.4])
        cylinder(d=27, h=3);

        _orig_marker_en("RR");
    }
}

module EN_Tiremarkers_RR_dc_text() {
    difference() {
        translate([-17, -16, 0])
        cylinder(d=27, h=3);

        EN_Tiremarkers_RR_dc();
    }
}


module FIN_Tiremarkers_OE_dc() {
    union() {
        translate([-18.5, 31, 0.4])
        cylinder(d=27, h=3);

        _orig_marker_fin("OE");
    }
}

module FIN_Tiremarkers_OE_dc_text() {
    difference() {
        translate([-18.5, 31, 0])
        cylinder(d=27, h=3);

        FIN_Tiremarkers_OE_dc();
    }
}

module FIN_Tiremarkers_OT_dc() {
    union() {
        translate([18, 31, 0.4])
        cylinder(d=27, h=3);

        _orig_marker_fin("OT");
    }
}

module FIN_Tiremarkers_OT_dc_text() {
    difference() {
        translate([18, 31, 0])
        cylinder(d=27, h=3);

        FIN_Tiremarkers_OT_dc();
    }
}

module FIN_Tiremarkers_VE_dc() {
    union() {
        translate([18.5, -6, 0.4])
        cylinder(d=27, h=3);

        _orig_marker_fin("VE");
    }
}

module FIN_Tiremarkers_VE_dc_text() {
    difference() {
        translate([18.5, -6, 0])
        cylinder(d=27, h=3);

        FIN_Tiremarkers_VE_dc();
    }
}

module FIN_Tiremarkers_VT_dc() {
    union() {
        translate([-18, -4, 0.4])
        cylinder(d=27, h=3);

        _orig_marker_fin("VT");
    }
}

module FIN_Tiremarkers_VT_dc_text() {
    difference() {
        translate([-18, -4, 0])
        cylinder(d=27, h=3);

        FIN_Tiremarkers_VT_dc();
    }
}