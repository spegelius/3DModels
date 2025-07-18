// original models from: https://www.thingiverse.com/thing:2119644

use <../lib/bearings.scad>;
use <../Dollo/NEW_long_ties/include.scad>;
use <../Bearings/bearing5.scad>;


////// VARIABLES //////
w_1kg = 116.71;
w_thin = 82.7;

stl_base_path = "../_downloaded/";
sph_stl_path = str(
    stl_base_path,
    "SPANNERHANDS_Spool_System_Wall_Mounted_Spool_Holder___Dust_Cover/"
);


////// VIEW DEV //////
// 1kg positioning aid
//color("grey")
//cube([w_1kg, 1, 1]);

// thin positioning aid
//color("grey")
//cube([w_thin, 1, 1]);

//debug_core_1kg();

//debug_new_bases();
//debug_new_base2();
//debug_new_thin_base2();

//translate([40, 0, 0])
//debug_small_core();
//debug_small_core_bearing();
//debug_core_universal();
//debug_core_universal_small();
//debug();
//debug_thin();


////// VIEW PRINT //////
//new_base1();

//new_base2();

//translate([0, 0, 110])
//new_lid1();

//new_lid2();

//new_lid2_window();

//new_thin_base1();

//new_thin_base2();

//translate([0, 0, 110])
//new_thin_lid1();

//new_thin_lid2();

//new_thin_lid2_window();

//lid_nut();
//lid_bolt();

//new_base();
//new_thin_base();

//new_lid_window();
//new_thin_lid_window();

//window_frame();
//window_frame_seal();

//new_base_bracket();
//new_lid_bracket();
//new_clasp_bracket();
//new_ptfe_nozle();

//bearing_bolt();
//bearing_bolt_small();
//bearing_spacer();
//bearing_spacer_small();
//new_bearing_mount();

//new_core_750g_50mm();
//new_core_750g_51mm();
//new_core_750g_52mm();
//new_core_1kg_50mm();
//new_core_1kg_51mm();
//new_core_1kg_52mm();
//new_core_1kg_53mm();
//new_core_1kg_54mm();
//core_1kg_20mm();
//core_1kg_16mm();

//core_1kg_universal();
//core_750g_universal();

//small_core_bearing();
//small_core_bearing_center();
//small_core_axle();

//sunlu_core_adapter();

//lip();
//lip_thin();
//lip_nutholder();

//small_spool_adapter_disk_1();
//small_spool_adapter_disk_2();
//small_spool_adapter_disk_2(0.5);
//small_spool_adapter_disk_2(0.7);
//small_spool_adapter_core();
//small_spool_adapter_nut();

//PTFE_coupler_printed_M4_nutholders();
//PTFE_coupler_printed_M4_insert();
//PTFE_coupler_printed_cap();
//PTFE_coupler_printed_M4_seal();




////// MODULES //////
module debug_core_1kg() {
    translate([14.5, 0, 0])
    rotate([0, 90, 0])
    intersection() {
        union() {
            new_core_1kg_50mm();

            translate([0, 0, -5.6])
            new_bearing_mount();

            translate([0, 0, 87.6 + 5.6])
            rotate([180, 0, 0])
            new_bearing_mount();
        }

        translate([100/2, 0, 0])
        cube([100, 100, 200], center=true);
    }

    intersection() {
        translate([0, 0, -111])
        new_base1();

//        translate([200/2 + 8, 0, 0])
//        cube([200, 200, 400], center=true);
    }
}

module debug_small_core() {
    intersection() {
        union() {
            h = 5*1.05 + sqrt(ball_size*ball_size*2)/2 + 7/2;

            translate([0, 0, h])
            core_1kg_20mm();

            small_core_bearing();

            translate([0, 0, small_core_h + 2*h])
            rotate([180, 0, 0])
            small_core_bearing();
        }
        cube([40, 40, 200]);
    }

    //translate([0, 0, -8])
    //rotate([0, -90, 0])
    //new_lid1();
}

module debug_core_universal() {
    translate([13.75, 0, 0])
    rotate([0, 90, 0])
    intersection() {
        union() {
            core_1kg_universal();

            %608zz();

            translate([0, 0, 82])
            %608zz();

            translate([0, 0, -5.6])
            new_bearing_mount();

            translate([0, 0, 89 + 5.6])
            rotate([180, 0, 0])
            new_bearing_mount();

            translate([0, 0, 99/2 - 5])
            rotate([0, 90, 100])
            bearing_bolt();
        }

        translate([0, -100/2, 0])
        cube([100, 100, 200], center=true);
    }

    translate([0, 0, -111])
    new_base1();
}

module debug_core_universal_small() {
    intersection() {
        union() {
            translate([0, 0, 5.7])
            core_750g_universal();

            bearing_mount();

            translate([0, 0, 55.4 + 2*5.7])
            rotate([180, 0, 0])
            bearing_mount();
        }
        cube([100, 100, 200]);
    }
    translate([0, 0, -8])
    rotate([0, -90, 0])
    new_thin_lid1();
}

module debug_small_core_bearing() {
    intersection() {
        small_core_bearing();
        cube([60, 60, 60]);
    }
}

module debug() {
    intersection() {
        union() {
//            translate([0, -42.32, 19.49])
//            rotate([-22.5, 0, 0])
//            new_base1();
//
//            translate([0, 0.1, 2])
//            rotate([-22.5, 0, 0])
//            new_base2();
//
//            translate([0, -0.1, 121.8])
//            rotate([202.5, 0, 0])
//            new_lid1();
//
//            translate([0, 42.35, 223.73])
//            rotate([180 - 22.5, 0, 0])
//            new_lid2_window();
            translate([0, -32.45, 15.4])
            rotate([-22.5, 0, 0])
            new_base();
        }
//        translate([30, -250/2, 0])
//        cube([100, 250, 250]);

//        translate([0, -250/2, 0])
//        cube([140, 250, 70]);
    }
    %translate([13, 0, 202/2 + 20])
    rotate([0, 90, 0])
    difference() {
        cylinder(d=202, h=90, $fn=100);
        cylinder(d=50, h=190, $fn=100, center=true);
    }

    translate([8 + 100.7/2, 100, 80.7])
    rotate([-7, 0, 0])
    rotate([90, 0, -90])
    lip();

    translate([58.3, 99, 70.3])
    rotate([-110, 0, 0])
    lip_nutholder();

    //translate([8, 0, 0])
    //cube([100.7, 200, 1]);
}

module debug_thin() {
    intersection() {
        union() {
//            translate([0, -42.32, 19.49])
//            rotate([-22.5, 0, 0])
//            new_thin_base1();
//
//            translate([0, 0.1, 2])
//            rotate([-22.5, 0, 0])
//            new_thin_base2();
//
//            translate([0, -0.1, 121.8])
//            rotate([202.5, 0, 0])
//            new_thin_lid1();
//
//            translate([0, 42.35, 223.73])
//            rotate([180 - 22.5, 0, 0])
//            new_thin_lid2_window();

            translate([0, -32.45, 15.4])
            rotate([-22.5, 0, 0])
            new_thin_base();
        }
        //translate([30, -250/2, 0])
        //cube([100, 250, 250]);

//        translate([0, -250/2, 0])
//        cube([100, 250, 70]);
    }
    %translate([13, 0, 202/2 + 20])
    rotate([0, 90, 0])
    difference() {
        cylinder(d=202, h=60, $fn=100);
        cylinder(d=10, h=130, $fn=100, center=true);
    }
    translate([8 + 66.7/2, 100, 80])
    rotate([-10, 0, 0])
    rotate([90, 0, -90])
    lip_thin();

    translate([58.3, 99, 70.3])
    rotate([-110, 0, 0])
    lip_nutholder();

    //translate([8, 0, 0])
    //cube([66.7, 200, 1]);
}

module debug_new_bases() {
    translate([w_1kg/2 + 200, -34.25, 87.14])
    import(str(
        sph_stl_path,
        "BASE_v3_0_1kg_Spool.stl"
    ), convexity=10);

    intersection() {
        new_base2(support=false);

//        translate([100, 0, 0])
//        cube([100, 300, 200], center=true);
    }

    translate([0, -45.8, 0])
    new_base1();
}

module debug_new_base2() {
    translate([w_1kg/2 + 200, -34.25, 87.14])
    import(str(sph_stl_path,
        "BASE_v3_0_1kg_Spool.stl"), convexity=10);

    intersection() {
        new_base2();

//        translate([100, 0, 0])
//        cube([100, 300, 200], center=true);
    }

//    translate([0, -46.7, 110.33])
//    new_base1();
}

module debug_new_thin_base2() {
    translate([w_1kg/2 + 200, -34.25, 87.14])
    import(str(sph_stl_path,
        "BASE_v3_0_1kg_Spool.stl"), convexity=10);

    intersection() {
        new_thin_base2();

//        translate([100, 0, 0])
//        cube([100, 300, 200], center=true);
    }

//    translate([0, -46.7, 110.33])
//    new_thin_base1();
}

module ear(h=3) {
    difference() {
        hull(){
            cylinder(d=11, h=h, $fn=50);

            translate([-3, 0, h/2])
            cube([0.1, 19, h], center=true);
        }
        translate([-8, -20/2, -0.5])
        cube([5, 20, h + 1]);
    }
}

module base1() {
    union() {
        translate([-100 + 38.36, -165.25, -9.761])
        rotate([-112.5, 0, 0])
        import(str(sph_stl_path,
            "v5_Small_Volume_1kg_BASE_1.stl"),
            convexity=10);

        translate([w_1kg, -25, 0])
        ear(h=3.5);

        translate([w_1kg, -105, 0])
        ear(h=3.5);

        translate([0, -25, 0])
        mirror([1,0,0])
        ear(h=3.5);

        translate([0, -105, 0])
        mirror([1,0,0])
        ear(h=3.5);
    }
}

//base1();

module thin_base1() {
    union() {
        translate([3 + 38.36, -38.66, 51.08])
        rotate([-112.5, 0, 0])
        import (str(sph_stl_path,
            "v4_Small_Volume_BASE_1.stl"),
            convexity=10);

        translate([w_thin, -25, 0])
        ear(h=3.5);

        translate([w_thin, -105, 0])
        ear(h=3.5);

        translate([0, -25, 0])
        mirror([1, 0, 0])
        ear(h=3.5);

        translate([0, -105, 0])
        mirror([1, 0, 0])
        ear(h=3.5);
    }
}

//thin_base1();

module base2() {
    union() {
        translate([-100 + 38.36, -0.5, -0.19])
        rotate([22.5 + 135, 0, 0])
        import (str(sph_stl_path,
            "v5_Small_Volume_1kg_BASE_2.stl"),
            convexity=10);

        translate([w_1kg, 25, 0])
        ear(h=4.5);

        translate([w_1kg, 105, 0])
        ear(h=4.5);

        translate([0, 25, 0])
        mirror([1, 0, 0])
        ear(h=4.5);

        translate([0, 105, 0])
        mirror([1,0,0])
        ear(h=4.5);
    }
}

//base2();

module thin_base2() {
    union() {
        translate([3 + 38.36, 38.65, 51.08])
        rotate([22.5 + 225, 0, 180])
        import (str(sph_stl_path,
            "v4_Small_Volume_BASE_2.stl"),
            convexity=10);

        translate([w_thin, 25, 0])
        ear(h=4.5);

        translate([w_thin, 105, 0])
        ear(h=4.5);

        translate([0, 25, 0])
        mirror([1, 0, 0])
        ear(h=4.5);

        translate([0, 105, 0])
        mirror([1, 0, 0])
        ear(h=4.5);
    }
}

//thin_base2();

module lid1() {
    union() {
        translate([140 + 38.36, 154.01, 170.05])
        rotate([-22.5 - 90, 0, 180])
        import (str(sph_stl_path,
            "v5_Small_Volume_1kg_LID_1.stl"),
            convexity=10);

        translate([w_1kg, 25, 0])
        ear(h=3.5);

        translate([w_1kg, 105, 0])
        ear(h=3.5);

        translate([0, 25, 0])
        mirror([1, 0, 0])
        ear(h=3.5);

        translate([0, 105, 0])
        mirror([1, 0, 0])
        ear(h=3.5);
    }
}

//lid1();

module thin_lid1() {
    union() {
        translate([3 + 38.36, 38.65, 51.08])
        rotate([-22.5 - 90, 0, 180])
        import (str(sph_stl_path,
            "v4_Small_Volume_LID_1.stl"),
            convexity=10);

        translate([w_thin, 25, 0])
        ear(h=3.5);

        translate([w_thin, 105, 0])
        ear(h=3.5);

        translate([0, 25, 0])
        mirror([1, 0, 0])
        ear(h=3.5);

        translate([0, 105, 0])
        mirror([1, 0, 0])
        ear(h=3.5);
    }
}

//thin_lid1();

module lid2() {
    union() {
        translate([-100 + 38.36, -65.77, 142.055])
        rotate([-22.5 - 90, 0, 0])
        import (str(sph_stl_path,
            "v5_Small_Volume_1kg_LID_2.stl"),
            convexity=10);

        translate([w_1kg, -25, 0])
        ear(h=4.5);

        translate([w_1kg, -105, 0])
        ear(h=4.5);

        translate([0, -25, 0])
        mirror([1, 0, 0])
        ear(h=4.5);

        translate([0, -105, 0])
        mirror([1, 0, 0])
        ear(h=4.5);
    }
}

//lid2();

module thin_lid2() {
    union() {
        translate([3 + 38.36, -38.65, 51.08])
        rotate([-22.5 - 90, 0, 0])
        import (str(sph_stl_path,
            "v4_Small_Volume_LID_2.stl"), convexity=10);

        translate([w_thin, -25, 0])
        ear(h=4.5);

        translate([w_thin, -105, 0])
        ear(h=4.5);

        translate([0, -25, 0])
        mirror([1, 0, 0])
        ear(h=4.5);

        translate([0, -105, 0])
        mirror([1, 0, 0])
        ear(h=4.5);
    }
}

//thin_lid2();

module base_bracket() {
    color("grey")
    translate([0, 0, 12.25]) 
    import (str(sph_stl_path,
       "v5_Small_Volume_1kg_BASE_Bracket.stl"), convexity=10);

}

module lid_bracket() {
    color("grey")
    translate([0, -140, 54.2]) 
    import (str(sph_stl_path,
        "v5_Small_Volume_1kg_LID_Bracket.stl"), convexity=10);
}

module clasp_bracket() {
    color("grey")
    translate([0, 0, 10.064]) 
    import (str(sph_stl_path,
        "CLASP_BRACKET_v2_0.stl"), convexity=10);
}

module ptfe_nozle() {
    color("grey")
    translate([0, 0, -2.67])
    rotate([90, 0, 0]) 
    import (str(sph_stl_path,
        "Version_2_small_pfte_nozzle_175mm.STL"), convexity=10);
}

module bearing_mount() {
    color("grey")
    translate([0, 0, 6.3])
    import (str(sph_stl_path,
        "608_BEARING_MOUNT_v2_0.stl"), convexity=10);
}

module new_base1() {
    module _base1_ears() {
        translate([0, 0, 110.332])
        rotate([112.5, 0, 0])
        difference() {
            base1();

            translate([w_1kg + 1, -25, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([w_1kg + 1, -25, 3.5])
            cylinder(d=6.5, h=5, $fn=30);

            translate([w_1kg + 1, -105, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([w_1kg + 1, -105, 3.5])
            cylinder(d=6.5, h=5, $fn=30);

            translate([-1, -25, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([-1, -25, 3.5])
            cylinder(d=6.5, h=5, $fn=30);

            translate([-1, -105, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([-1, -105, 3.5])
            cylinder(d=6.5, h=5, $fn=30);
        }
    }

    union() {
        
        _base1_ears();

        difference() {
            translate([3.8, 46.1, 4.1])
            rotate([90 + 22.5, 0, 0])
            translate([-48.481, -65.213, -38.14])
            import(str(sph_stl_path,
                    "v5_Small_Volume_1kg_Glue_Joint.stl"),
                convexity=10);

            translate([60, 46.3, 3])
            rotate([45, 0, 0])
            cube([200, 3, 3], center=true);
        }

        translate([4.6, 43.789, 2])
        rotate([22.5, 0, 0])
        translate([0, 0, 114.838/2])
        cube([5, 2, 114.838], center=true);

        translate([112, 43.789, 2])
        rotate([22.5, 0, 0])
        translate([0, 0, 114.838/2])
        cube([5, 2, 114.838], center=true);

        translate([3 + 112/2, 43.789, 2])
        rotate([22.5, 0, 0])
        translate([0, 0, 5/2])
        cube([110, 2, 5], center=true);
    }
}

module new_thin_base1() {

    module _thin_base1_ears() {
        translate([0, 0, 110.328])
        rotate([112.5, 0, 0])
        difference() {
            thin_base1();

            translate([w_thin + 1, -25, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([w_thin + 1, -25, 3.5])
            cylinder(d=6.5, h=5, $fn=30);
            
            translate([w_thin + 1, -105, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([w_thin + 1, -105, 3.5])
            cylinder(d=6.5, h=5, $fn=30);

            translate([-1, -25, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([-1, -25, 3.5])
            cylinder(d=6.5, h=5, $fn=30);

            translate([-1, -105, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([-1, -105, 3.5])
            cylinder(d=6.5, h=5, $fn=30);
        }
    }

    union() {
        _thin_base1_ears();

        difference() {
            translate([3.8, 46.1, 4.1])
            rotate([90 + 22.5, 0, 0])
            translate([-82.48, -92.19085, -43.50515])
            import(str(sph_stl_path,
                    "v4_Small_Volume_Glue_Joint.stl"),
                convexity=10);

            translate([60, 46.3, 3])
            rotate([45, 0, 0])
            cube([200, 3, 3], center=true);
        }

        translate([4.6, 43.789, 2])
        rotate([22.5, 0, 0])
        translate([0, 0, 114.838/2])
        cube([5, 2, 114.838], center=true);

        translate([78, 43.789, 2])
        rotate([22.5, 0, 0])
        translate([0, 0, 114.838/2])
        cube([5, 2, 114.838], center=true);

        translate([3 + 76/2, 43.789, 2])
        rotate([22.5, 0, 0])
        translate([0, 0, 5/2])
        cube([76, 2, 5], center=true);
    }
}

module new_base2(support=true) {

    module _base2_ears() {
        difference() {
            base2();

            translate([w_1kg + 1, 25, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([w_1kg + 1, 25, 2.5])
            rotate([0, 0, 90])
            M3_nut();

            translate([w_1kg + 1, 105, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([w_1kg + 1, 105, 2.5])
            rotate([0, 0, 90])
            M3_nut();

            translate([-1, 25, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([-1, 25, 2.5])
            rotate([0, 0, 90])
            M3_nut();

            translate([-1, 105, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([-1, 105, 2.5])
            rotate([0, 0, 90])
            M3_nut();
        }
    }

    difference() {
        union() {
            translate([0, -45.708, 110.324])
            rotate([-67.5, 0, 0])
            _base2_ears();

            difference() {
                translate([8, 0, 0])
                cube([100.7, 40, 46]);

                translate([0, 0, 4.4])
                cube([400, 2, 3], center=true);

                translate([0, 40/2, 57])
                rotate([45, 0, 0])
                cube([400, 50, 50], center=true);

                translate([0, -5, 37])
                rotate([30, 0, 0])
                cube([400, 30, 50], center=true);
            }
        }

        translate([9.74, 40 - 22 - 1.73, 1.8])
        cube([97.24, 22, 50]);
    }

    // support
    if (support) {
        translate([104.5/2 + 6, -3.5, 0])
        intersection() {
            rotate([-10, 0, 0])
            cube([104.5, 2, 20], center=true);

            translate([0, 0, 5.8/2])
            cube([200, 100, 5.8], center=true);
        }
    }
}

module new_thin_base2(support=true) {

    module _thin_base2_ears() {
        difference() {
            thin_base2();

            translate([w_thin + 1, 25, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([w_thin + 1, 25, 2.5])
            rotate([0, 0, 90])
            M3_nut();

            translate([w_thin + 1, 105, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([w_thin + 1, 105, 2.5])
            rotate([0, 0, 90])
            M3_nut();

            translate([-1, 25, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([-1, 25, 2.5])
            rotate([0, 0, 90])
            M3_nut();

            translate([-1, 105, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([-1, 105, 2.5])
            rotate([0, 0, 90])
            M3_nut();
        }
    }

    difference() {
        union() {
            translate([0, -45.708, 110.324])
            rotate([-67.5, 0, 0])
            _thin_base2_ears();

            difference() {
                translate([8, 0, 0])
                cube([66.7, 40, 46]);

                translate([0, 0, 4.4])
                cube([400, 2, 3], center=true);

                translate([0, 40/2, 57])
                rotate([45, 0, 0])
                cube([400, 50, 50], center=true);

                translate([0, -5, 37])
                rotate([30, 0, 0])
                cube([400, 30, 50], center=true);
            }
        }

        translate([9.73, 40 - 22 - 1.73, 1.8])
        cube([63.24, 22, 50]);
    }

    // support
    if (support) {
        translate([70.8/2 + 6, -3.5, 0])
        intersection() {
            rotate([-10, 0, 0])
            cube([70.8, 2, 20], center=true);

            translate([0, 0, 5.8/2])
            cube([100, 100, 5.8], center=true);
        }
    }
}


module new_lid1() {
    rotate([-22.5 - 90, 0, 0]) 
    difference() {
        lid1();

        translate([w_1kg + 1, 25, -0.2])
        cylinder(d=3.3, h=5, $fn=30);

        translate([w_1kg + 1, 25,3.5])
        cylinder(d=6.5, h=5, $fn=30);

        translate([w_1kg + 1, 105, -0.2])
        cylinder(d=3.3, h=5, $fn=30);

        translate([w_1kg + 1, 105, 3.5])
        cylinder(d=6.5, h=5, $fn=30);

        translate([-1, 25, -0.2])
        cylinder(d=3.3, h=5, $fn=30);

        translate([-1, 25, 3.5])
        cylinder(d=6.5, h=5, $fn=30);

        translate([-1, 105, -0.2])
        cylinder(d=3.3, h=5, $fn=30);

        translate([-1, 105, 3.5])
        cylinder(d=6.5, h=5, $fn=30);
    }
}

module new_thin_lid1() {
    rotate([-22.5 - 90, 0, 0]) 
    difference() {
        thin_lid1();

        translate([w_thin + 1, 25, -0.2])
        cylinder(d=3.3, h=5, $fn=30);

        translate([w_thin + 1, 25, 3.5])
        cylinder(d=6.5, h=5, $fn=30);

        translate([w_thin + 1, 105, -0.2])
        cylinder(d=3.3, h=5, $fn=30);

        translate([w_thin + 1, 105, 3.5])
        cylinder(d=6.5, h=5, $fn=30);

        translate([-1, 25, -0.2])
        cylinder(d=3.3, h=5, $fn=30);

        translate([-1, 25, 3.5])
        cylinder(d=6.5, h=5, $fn=30);

        translate([-1, 105, -0.2])
        cylinder(d=3.3, h=5, $fn=30);

        translate([-1, 105, 3.5])
        cylinder(d=6.5, h=5, $fn=30);
    }
}

module new_lid2() {

    module _lid2_ears() {
        translate([0, 0, 110.329])
        rotate([22.5 + 90, 0, 0])
        difference() {
            lid2();

            translate([w_1kg + 1, -25, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([w_1kg + 1, -25, 2])
            rotate([0, 0, 90])
            M3_nut();

            translate([w_1kg + 1, -105, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([w_1kg + 1, -105, 2])
            rotate([0, 0, 90])
            M3_nut();

            translate([-1, -25, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([-1, -25, 2])
            rotate([0, 0, 90])
            M3_nut();

            translate([-1, -105, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([-1, -105, 2])
            rotate([0, 0, 90])
            M3_nut();
        }
    }

    union() {
        _lid2_ears();

        difference() {
            translate([3.8, 46.1, 4.1])
            rotate([90 + 22.5, 0, 0])
            translate([-48.481, -65.213, -38.14])
            import(str(sph_stl_path,
                    "v5_Small_Volume_1kg_Glue_Joint.stl"),
                convexity=10);

            translate([60, 46.3, 3])
            rotate([45, 0, 0])
            cube([200, 3, 3], center=true);
        }

        translate([4.6, 43.789, 2])
        rotate([22.5, 0, 0])
        translate([0, 0, 114.838/2])
        cube([5, 2, 114.838], center=true);

        translate([112, 43.789, 2])
        rotate([22.5, 0, 0])
        translate([0, 0, 114.838/2])
        cube([5, 2, 114.838], center=true);

        translate([3 + 112/2, 43.789, 2])
        rotate([22.5, 0, 0])
        translate([0, 0, 5/2])
        cube([110, 2, 5], center=true);
    }
}

module new_thin_lid2() {

    module _thin_lid2_ears() {
        translate([0, 0, 110.322])
        rotate([22.5 + 90, 0, 0])
        difference() {
            thin_lid2();

            translate([w_thin + 1, -25, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([w_thin + 1, -25, 2])
            rotate([0, 0, 90])
            M3_nut();

            translate([w_thin + 1, -105, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([w_thin + 1, -105, 2])
            rotate([0, 0, 90])
            M3_nut();

            translate([-1, -25, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([-1, -25, 2])
            rotate([0, 0, 90])
            M3_nut();

            translate([-1, -105, -0.2])
            cylinder(d=3.3, h=5, $fn=30);

            translate([-1, -105, 2])
            rotate([0, 0, 90])
            M3_nut();
        }
    }

    union() {
        _thin_lid2_ears();

        difference() {
            translate([3.8, 46.1, 4.1])
            rotate([90 + 22.5, 0, 0])
            translate([-82.48, -92.19085, -43.50515])
            import(str(sph_stl_path,
                    "v4_Small_Volume_Glue_Joint.stl"),
                convexity=10);

            translate([60, 46.3, 3])
            rotate([45, 0, 0])
            cube([200, 3, 3], center=true);
        }

        translate([4.6, 43.786, 2])
        rotate([22.5, 0, 0])
        translate([0, 0, 114.838/2])
        cube([5, 2, 114.838], center=true);

        translate([78, 43.786, 2])
        rotate([22.5, 0, 0])
        translate([0, 0, 114.838/2])
        cube([5, 2, 114.838], center=true);

        translate([3 + 76/2, 43.786, 2])
        rotate([22.5, 0, 0])
        translate([0, 0, 5/2])
        cube([76, 2, 5], center=true);
    }
}

module _bolt_head() {
    union() {
        cylinder(d1=3, d2=6.5,h=2, $fn=30);

        translate([0, 0, 2])
        cylinder(d=6.5, h=10, $fn=30);
    }
}

module new_lid2_window() {
    module bolt_head() {
        union() {
            cylinder(d1=3, d2=6.5, h=2, $fn=30);

            translate([0, 0, 2])
            cylinder(d=6.5, h=10, $fn=30);
        }
    }

    difference() {
        new_lid2();

        translate([w_1kg/2 - 25, -25, -0.1])
        cylinder(d=3, h=5, $fn=30);

        translate([w_1kg/2 - 25, -25, 0.3])
        _bolt_head();

        translate([w_1kg/2 + 25, -25, -0.1])
        cylinder(d=3, h=5, $fn=30);

        translate([w_1kg/2 + 25, -25, 0.3])
        _bolt_head();

        translate([w_1kg/2 - 25, 25, -0.1])
        cylinder(d=3, h=9, $fn=30);

        translate([w_1kg/2 - 25, 25, 0.3])
        _bolt_head();

        translate([w_1kg/2 + 25, 25, -0.1])
        cylinder(d=3, h=9, $fn=30);

        translate([w_1kg/2 + 25, 25, 0.3])
        _bolt_head();

        translate([w_1kg/2, 0, -0.1])
        cube([42, 42, 10], center=true);
    }
}

module new_thin_lid2_window() {

    difference() {
        new_thin_lid2();

        translate([w_thin/2 - 25, -25, -0.1])
        cylinder(d=3, h=5, $fn=30);

        translate([w_thin/2 - 25, -25, 0.3])
        _bolt_head();

        translate([w_thin/2 + 25, -25, -0.1])
        cylinder(d=3, h=5, $fn=30);

        translate([w_thin/2 + 25, -25, 0.3])
        _bolt_head();

        translate([w_thin/2 - 25, 25, -0.1])
        cylinder(d=3, h=9, $fn=30);

        translate([w_thin/2 - 25, 25, 0.3])
        _bolt_head();

        translate([w_thin/2 + 25, 25, -0.1])
        cylinder(d=3, h=9, $fn=30);

        translate([w_thin/2 + 25, 25, 0.3])
        _bolt_head();

        translate([w_thin/2, 0, -0.1])
        cube([42, 42, 10], center=true);
    }
}

module window_frame() {
    union() {
        difference() {
            hull() {
                translate([0, 0, 1/2])
                rounded_cube_side(
                    60, 60, 1, 4, center=true, $fn=30
                );

                translate([0, 0, 3.4 - 0.4/2])
                rounded_cube_side(
                    63, 63, 0.4, 4.4, center=true, $fn=30
                );
            }

            translate([-25, -25, 2])
            cylinder(d=3.3, h=4, $fn=20);

            translate([25, -25, 2])
            cylinder(d=3.3, h=4, $fn=20);

            translate([25, 25, 2])
            cylinder(d=3.3, h=4, $fn=20);

            translate([-25, 25, 2])
            cylinder(d=3.3, h=4, $fn=20);

            translate([-25, -25, -0.2])
            M3_nut(2, cone=false);

            translate([25, -25, -0.2])
            M3_nut(2, cone=false);

            translate([25, 25, -0.2])
            M3_nut(2, cone=false);

            translate([-25, 25,-0.2])
            M3_nut(2, cone=false);

            // window hole
            rounded_cube_side(
                42, 42, 10, 2, center=true, $fn=30
            );

            // pane indent
            translate([0, 0, 10/2 + 2.6])
            rounded_cube_side(
                47, 47, 10, 3, center=true, $fn=30
            );
        }
    }
}

module window_frame_seal() {
    difference() {
        union() {
            translate([0, 0, 0.8/2])
            rounded_cube_side(
                63, 63, 0.8, 4.4, center=true, $fn=30
            );

            translate([0, 0, 1.2/2])
            rounded_cube_side(
                46, 46, 1.2, 6, center=true, $fn=40
            );

            translate([-25, -25, 0])
            tube(8, 1.2, 1, $fn=30);

            translate([25, -25, 0])
            tube(8, 1.2, 1, $fn=30);

            translate([25, 25, 0])
            tube(8, 1.2, 1, $fn=30);

            translate([-25, 25, 0])
            tube(8, 1.2, 1, $fn=30);

            translate([26, 0, 1.2/2])
            cube([1, 44, 1.2], center=true);

            translate([-26, 0, 1.2/2])
            cube([1, 44, 1.2], center=true);

            translate([0, 26, 1.2/2])
            cube([44, 1, 1.2], center=true);

            translate([0, -26, 1.2/2])
            cube([44, 1, 1.2], center=true);
        }
        rounded_cube_side(
            42, 42, 10, 2, center=true, $fn=30
        );

        translate([0, 0, 0.8 + 10/2])
        rounded_cube_side(
            44, 44, 10, 4, center=true, $fn=40
        );

        translate([-25, -25, -1])
        cylinder(d=3.3, h=4, $fn=20);

        translate([25, -25, -1])
        cylinder(d=3.3, h=4, $fn=20);

        translate([25, 25, -1])
        cylinder(d=3.3, h=4, $fn=20);

        translate([-25, 25, -1])
        cylinder(d=3.3, h=4, $fn=20);
    }

    
}

module nut_cylinder(d1=11, d2=9, h=2.6) {
    difference() {
        cylinder(d1=d1, d2=d2, h=h, $fn=30);
        //cylinder(d=3, h=h, $fn=30);
        M3_nut(h + 1);
    }
}

module new_base_bracket() {
    base_bracket();

    translate([22.35, 6.05, 2.98])
    nut_cylinder();

    translate([22.35, -18.45, 2.98])
    nut_cylinder();

    translate([28.35, -48.95, 2.98])
    nut_cylinder();

    translate([-22.35, 6.05, 2.98])
    nut_cylinder();

    translate([-22.35, -18.45, 2.98])
    nut_cylinder();

    translate([-28.35, -48.95, 2.98])
    nut_cylinder();
}

module new_lid_bracket() {
    lid_bracket();

    translate([0, -3.3, 2.9])
    nut_cylinder(d1=10);

    translate([0, -23.2, 2.9])
    nut_cylinder();

    translate([22.85, -44.3, 2.9])
    nut_cylinder(d1=10);

    translate([-22.85, -44.3, 2.9])
    nut_cylinder(d1=10);

    module block() {
        difference() {
            cube([10.5, 11, 6]);

            translate([0, 4, -2])
            rotate([-45, 0, 0])
            cube([10.5, 5, 15]);
        }
    }
    translate([-27.85, 42, 0])
    block();

    translate([27.85 - 10.5, 42, 0])
    block();
}

module new_clasp_bracket() {
    clasp_bracket();

    translate([16.5, 19, 0])
    nut_cylinder(d1=9, h=5.6);

    translate([16.5, -14, 0])
    nut_cylinder(d1=9, h=5.6);

    translate([-16.5, 19, 0])
    nut_cylinder(d1=9, h=5.6);

    translate([-16.5, -14, 0])
    nut_cylinder(d1=9, h=5.6);
}

module new_base() {
    difference() {
        translate([w_1kg/2, 1.75, 87.13])
        import(str(
            sph_stl_path,
            "BASE_v3_0_1kg_Spool.stl"
        ), convexity=10);

        translate([36, 100, 101])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([80.6, 100, 101])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);
    }
}

module new_thin_base() {
    difference() {
        translate([w_1kg/2, 1.75, 87.13])
        import(str(
            sph_stl_path,
            "BASE_v2_0.stl"
        ), convexity=10);

        translate([36, 100, 101])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);

        translate([80.6, 100, 101])
        rotate([90, 0, 0])
        cylinder(d=3.3, h=20, center=true, $fn=30);
    }
}

module new_lid_window() {
    difference() {
        translate([w_1kg/2, 0, 85.38])
        import(str(
            sph_stl_path,
            "LID_v3_0_1kg_Spool.stl"
        ), convexity=10);
    
        translate([0, 68, 33.5])
        rotate([45, 0, 0]) {
            translate([w_1kg/2 - 25, -25, -1.1])
            cylinder(d=3, h=5, $fn=30);

            translate([w_1kg/2 - 25, -25, 0])
            _bolt_head();

            translate([w_1kg/2 + 25, -25, -1.1])
            cylinder(d=3, h=5, $fn=30);

            translate([w_1kg/2 + 25, -25, 0])
            _bolt_head();

            translate([w_1kg/2 - 25, 25, -1.1])
            cylinder(d=3, h=9, $fn=30);

            translate([w_1kg/2 - 25, 25, 0])
            _bolt_head();

            translate([w_1kg/2 + 25, 25, -1.1])
            cylinder(d=3, h=9, $fn=30);

            translate([w_1kg/2 + 25, 25, 0])
            _bolt_head();

            translate([w_1kg/2, 0, -1.1])
            cube([42, 42, 10], center=true);
        }
    }
}

module new_thin_lid_window() {
    difference() {
        translate([w_1kg/2, 0, 85.38])
        import(str(sph_stl_path,
            "LID_v2_0.stl"), convexity=10);

        translate([0, 68, 33.5])
        rotate([45, 0, 0]) {
            translate([w_1kg/2 - 25, -25, -1.1])
            cylinder(d=3, h=5, $fn=30);

            translate([w_1kg/2 - 25, -25, 0])
            _bolt_head();

            translate([w_1kg/2 + 25, -25, -1.1])
            cylinder(d=3, h=5, $fn=30);

            translate([w_1kg/2 + 25, -25, 0])
            _bolt_head();

            translate([w_1kg/2 - 25, 25, -1.1])
            cylinder(d=3, h=9, $fn=30);

            translate([w_1kg/2 - 25, 25, 0])
            _bolt_head();

            translate([w_1kg/2 + 25, 25, -1.1])
            cylinder(d=3, h=9, $fn=30);

            translate([w_1kg/2 + 25, 25, 0])
            _bolt_head();

            translate([w_1kg/2, 0, -1.1])
            cube([42, 42, 10], center=true);
        }
    }
}


module new_ptfe_nozle() {
    difference() {
        union() {
            ptfe_nozle();

            translate([(37.3 + 4)/2, -26.5, 6.5])
            rotate([45, 0, 0])
            difference() {
                cylinder(d=7, h=7.07, $fn=40);
                cylinder(d=4, h=10, $fn=40);
            }
        }
        translate([(37.3 + 4)/2, -26.5, 6.5])
        rotate([45, 0, 0])
        cylinder(d1=7, d2=0, h=7, $fn=40);

        translate([37.3, -36.65, 3])
        M3_nut();

        translate([4, -36.65, 3])
        M3_nut();

        translate([(37.3 + 4)/2, -25, -0.05])
        cylinder(d1=20, d2=0, h=10, $fn=60);
    }
    translate([37.3, -3.35, 0])
    nut_cylinder(d1=9, h=5.6);

    translate([37.3, -36.65, 0])
    nut_cylinder(d1=9, h=5.6);

    translate([4, -3.35, 0])
    nut_cylinder(d1=9, h=5.6);

    translate([4, -36.65, 0])
    nut_cylinder(d1=9, h=5.6);
}

module new_bearing_mount() {
    //%bearing_mount();

    difference() {
        union() {
            hull() {
                cylinder(d=27.5, h=1, $fn=90);

                translate([0, 0, 2])
                cylinder(d=30, h=3, $fn=90);
            }

            translate([0, 0, 4])
            tube(22, 1.4, 1, $fn=90);

            cylinder(d=11, h=5.6, $fn=70);
        }

        translate([0, 0, 0.6])
        _threads(
            d=8, h=20, z_step=1.8, depth=0.5,
            direction=0, $fn=50
        );
    }
}

module bearing_bolt(h=89) {
    hh = h + 10;
    td = 8 - 4*0.15;
    d = 7.9;

    intersection() {
        translate([0, 0, d/2 - 0.8])
        union() {
            translate([hh/2 - 5, 0, 0])
            rotate([0, 90, 0])
            _threads(
                d=td, h=5.1, z_step=1.8,
                depth=0.5, direction=0,$fn=50
            );

            translate([-hh/2 + 5, 0, 0])
            rotate([0, 90, 180])
            _threads(
                d=td, h=5.1, z_step=1.8,
                depth=0.5, direction=0,$fn=50
            );

            rotate([0, 90, 0])
            cylinder(d=d, h=hh - 10, center=true, $fn=50);

        }

        difference() {
            union() {
                translate([0, 0, 8/2])
                cube([hh - 10, 20, 8], center=true);

                translate([-hh/2, 0, 6.4/2])
                cube([10, 20, 6.4], center=true);

                translate([hh/2, 0, 6.4/2])
                cube([10, 20, 6.4], center=true);
            }

            translate([0, 0, d/2 - 0.8])
            rotate([0, 90, 0])
            cylinder(d=0.2, h=200, center=true, $fn=10);
        }
    }
}

module bearing_spacer(h=89) {
    tube(10, h - 14, (10 - 8.2)/2, $fn=40);
}

module bearing_spacer_small() {
    bearing_spacer(h=55.1);
}

module bearing_bolt_small() {
    bearing_bolt(h=55.1);
}

module lid_nut() {
    difference() {
        M8_nut(h=15, cone=false);

        translate([0, 0, 5])
        _threads(
            d=8, h=20, z_step=1.8, depth=0.5,
            direction=0, $fn=50
        );
    }
}

module lid_bolt() {
    l = 83 - 2*8 + 2*11;
    d = 8 - 4*0.15;

    difference() {
        intersection() {
            translate([0, l/2, 8/2 - 1.1])
            rotate([90, 0, 0]) {
                _threads(
                    d=d, h=11, z_step=1.8,
                    depth=0.5, direction=0,$fn=50
                );

                translate([0, 0, l - 11])
                _threads(
                    d=d, h=11, z_step=1.8,
                    depth=0.5, direction=0, $fn=50
                );

                translate([0, 0, 11 - 0.1])
                cylinder(d=d, h=l - 2*11 + 0.2, $fn=40);
            }
            translate([0, 0, 8/2])
            cube([10, l, 8], center=true);
        }

        translate([0, 0, d/2 + 1])
        rotate([90, 0, 0])
        cylinder(d=0.1, h=l + 6, center=true);

        translate([1.5, 0, d/2 - 1])
        rotate([90, 0, 0])
        cylinder(d=0.1, h=l + 6, center=true);

        translate([-1.5, 0, d/2 - 1])
        rotate([90, 0, 0])
        cylinder(d=0.1, h=l + 6, center=true);
    }
}

core_wall = 1.8;

module new_core_750g_50mm() {
    roll(55, 50, wall=core_wall, edges=false, dent=true);
}

module new_core_750g_51mm() {
    roll(55, 51, wall=core_wall, edges=false, dent=true);
}

module new_core_750g_52mm() {
    roll(55, 52, wall=core_wall, edges=false, dent=true);
}

module new_core_1kg_50mm() {
    roll(87.50, 50, wall=core_wall, edges=false, dent=true);
}

module new_core_1kg_51mm() {
    roll(87.50, 51, wall=core_wall, edges=false, dent=true);
}

module new_core_1kg_52mm() {
    roll(87.50, 52, wall=core_wall, edges=false, dent=true);
}

module new_core_1kg_53mm() {
    roll(87.50, 53, wall=core_wall, edges=false, dent=true);
}

module new_core_1kg_54mm() {
    roll(87.50, 54, wall=core_wall, edges=false, dent=true);
}

ball_size = 5.92 + 0.05;

module small_core_bearing() {
    // bearing
    difference() {
        union() {
            scale([1, 1, 1.05])
            intersection() {
                bearing_mount();
                cylinder(d=50, h=5);
            }
            union() {
                translate([
                    0, 0,
                    5*1.05 + sqrt(ball_size*ball_size*2)/2
                ])
                cube_donut(30, ball_size);

                translate([0, 0, 5*1.05])
                difference() {
                    cylinder(
                        d=30, h=sqrt(ball_size*ball_size*2),
                        $fn=100
                    );
                    cylinder(
                        d=26,
                        h=sqrt(ball_size*ball_size*2) + 1,
                        $fn=100
                    );
                }

                translate([0, 0, 5*1.05])
                cylinder(
                    d=12,
                    h=sqrt(
                        ball_size*ball_size*2
                    )/2 - 7/2 - 0.1
                );
            }
        }
        translate([
            0, 0, 5*1.05 + sqrt(ball_size*ball_size*2)/2
        ])
        ball_path(ball_size, dent=true);

        %translate([
            0, 0,
            5*1.05 + sqrt(ball_size*ball_size*2)/2 - 7/2
        ])
        center_circle_hole(dent=true);

        cylinder(d=9, h=20, center=true, $fn=30);
    }
}

module small_core_bearing_center() {
    difference() {
        center_circle_hole(dent=true);

        hull() {
            translate([0, 8/2, 0])
            cylinder(d=1.5, h=20, center=true, $fn=20);

            translate([0, -8/2, 0])
            cylinder(d=1.5, h=20, center=true, $fn=20);
        }
    }
}

module small_core_axle() {
    intersection() {
        translate([0, 0, 7.9/2 - 0.6])
        rotate([-90, 0, 0])
        cylinder(d=7.6, h=26.5, $fn=50);

        translate([-8/2, 0, 0])
        cube([8, 26.5, 8]);
    }
}

small_core_h = 89.5 - sqrt(ball_size*ball_size*2) - 7 + 0.5;

module _small_core(diameter) {
    // core
    difference() {
        cylinder(d=diameter, h=small_core_h, $fn=50);
        cylinder(d=8, h=20, $fn=50);

        translate([0, 0, small_core_h - 20])
        cylinder(d=8, h=20, $fn=50);

        translate([0, 0, 20 + 1])
        cylinder(d=diameter-3, h=small_core_h-42, $fn=50);
    }
}

module _core_universal(h=89) {

    module _wing() {
        wall = 1.4;

        intersection() {
            difference() {
                cylinder(d=50, h=h, $fn=50);
                cylinder(
                    d=50 - wall*2, h=h*3,
                    center=true, $fn=50
                );
            }

            cube([26, 26, h]);

            translate([-8, 0, 0])
            rounded_cube(
                50, 40, h, 8, $fn=30
            );
        }
    }
    //!_wing();

    module _core() {
        inner_d = 22.5;

        union() {
            difference() {
                cylinder(d=inner_d + 3, h=h, $fn=80);
                cylinder(d=22.5, h=h, $fn=80);
            }
            translate([0, 0, 7.1 + sqrt(2)/2])
            cube_donut(inner_d, 2);

            translate([0, 0, h - (7.1 + sqrt(2)/2)])
            cube_donut(inner_d, 2);

            for(i = [0:4]) {
                rotate([0, 0, 360/5 * i]) {
                    translate([0, inner_d/2 + 0.2, 7/2])
                    cube([1, 1, 7], center=true);

                    translate([
                        0, inner_d/2 + 0.2, h - 7/2
                    ])
                    cube([1, 1, 7], center=true);
                }
            }
        }
    }

    wings = 6;
    intersection() {
        union() {
            _core();
            for(i = [0 : wings - 1]) {
                rotate([0, 0, 360/wings*i])
                translate([1.4, -12.5, 0])
                _wing();
            }
        }
        rounded_cylinder(58, h, 7, $fn=50);
    }
}

module core_1kg_20mm() {
    _small_core(20);
}

module core_1kg_16mm() {
    _small_core(16);
}

module core_1kg_universal() {
    _core_universal();
}

module core_750g_universal() {
    _core_universal(55.1);
}

module sunlu_core_adapter() {
    // 73mm hole on Sunlu spools
    h = 60;
    wall = 1.2;

    intersection() {
        union() {
            tube(72, h, wall, $fn=50);
            tube(54, h, wall, $fn=50);

            for(i = [0:3]) {
                rotate([0, 0, i*360/4])
                translate([52/2 + 10/2, 0, h/2])
                cube([10, wall, h], center=true);

                rotate([0, 0, i*360/4 + 45])
                translate([70/2, 0, 0])
                scale([1, 1.5, 1])
                cylinder(d=3.5, h=h, $fn=20);
            }
        }
        chamfered_cylinder(73.5, h, 1, $fn=60);
    }
}

module _lip(h) {
    difference() {
        union() {
            cylinder(d=2, h=h, center=true, $fn=30);

            //translate([0, 100/2, 0])
            //cube([2, 100, h], center=true);

            intersection() {
                translate([280/2 - 1, 0, 0])
                difference() {
                    cylinder(d=280, h=h, center=true, $fn=100);
                    cylinder(
                        d=280 - 4, h=h + 2, center=true, $fn=100
                    );
                }
                translate([0, 80/2, 0])
                rounded_cube_side(52, 80, h, 2, center=true);
            }
            rotate([0, 0, -164.5])
            translate([0, 20/2, 0])
            difference() {
                cube([2, 20, h], center=true);

                translate([0, 0, -22.3])
                rotate([0, 90, 0])
                cylinder(d=3.2, h=10, center=true, $fn=30);

                translate([0, 0, 22.3])
                rotate([0, 90, 0])
                cylinder(d=3.2, h=10, center=true, $fn=30);
            }
        }
        
    }
}

module lip() {
    _lip(96);
}

module lip_thin() {
    _lip(62);
}

module lip_nutholder() {
    difference() {
        union() {
            translate([0, 0, 2/2])
            cube([56.5, 8.7, 2], center=true);

            translate([-44.6/2, 0, 0])
            cylinder(d=10, h=4, $fn=6);

            translate([44.6/2, 0, 0])
            cylinder(d=10, h=4, $fn=6);
        }

        translate([-44.6/2, 0, 1.4])
        M3_nut(3);

        translate([44.6/2, 0, 1.4])
        M3_nut(3);

        translate([-44.6/2, 0, 0])
        cylinder(d=3.4, h=20, center=true, $fn=20);

        translate([44.6/2, 0, 0])
        cylinder(d=3.4, h=20, center=true, $fn=20);
    }
}

module _small_spool_adapter_disk() {
    difference() {
        union() {
            translate([0, 0, 4/2])
            intersection() {
                donut(199 - 5, 5, $fn=90);

                cube([300, 300, 4], center=true);
            }

            cylinder(d=194, h=2, $fn=90);

            cylinder(d=22.1, h=8, $fn=40);
        }

        for(i = [0:5]) {
            rotate([0, 0, 360/6 * i])
            hull() {
                translate([0, 30, 0])
                cylinder(d=12, h=20, center=true);

                translate([0, 199/2 - 23, 0])
                cylinder(d=12, h=20, center=true);
            }
        }

        for(i = [0:19]) {
            rotate([0, 0, 360/20 * i])
            translate([0, 199/2 - 5, 0])
            cylinder(d=4, h=20, center=true, $fn=10);
        }

        for(i = [0:5]) {
            rotate([0, 0, 360/6 * i + 360/6/2])
            translate([0, 199/2 - 32, 0])
            cylinder(d=24, h=20, center=true, $fn=40);
        }
    }
}

module small_spool_adapter_disk_1() {
    difference() {
        _small_spool_adapter_disk();

         intersection() {
            cylinder(d=17.4, h=50, center=true, $fn=50);
            cube([13.4, 22, 100], center=true);
        }
    }
}

module small_spool_adapter_disk_2(thread_slop=0.4) {
    difference() {
        _small_spool_adapter_disk();

        translate([0, 0, -1])
        v_screw(
            h=15, screw_d=17 + thread_slop, pitch=2, direction=0,
            steps=50, depth=0, chamfer=true
        );

        cylinder(
            d1=23 + thread_slop, d2=11 + thread_slop,
            h=6, center=true, $fn=50
        );

        translate([0, 0, 8])
        cylinder(
            d2=23 + thread_slop, d1=11 + thread_slop,
            h=6, center=true, $fn=50
        );
    }
}

module small_spool_adapter_core() {
    difference() {
        intersection() {
            v_screw(
                h=small_core_h, screw_d=17, pitch=2, direction=0,
                steps=50, depth=0, chamfer=true);

            cube([13, 22, 400], center=true);

            chamfered_cylinder(17.2, small_core_h, 1.4, $fn=50);
        }

        cylinder(d=6, h=small_core_h * 3, center=true, $fn=40);

        translate([0, 0, small_core_h - 22])
        chamfered_cylinder(8, 24, 2, $fn=40);

        translate([0, 0, -3])
        chamfered_cylinder(8, 25, 2, $fn=40);
    }
}

module small_spool_adapter_nut() {

    module _handle_dent() {
        difference() {
            cylinder(d=80, h=20, center=true, $fn=60);

            donut(82, 7, $fn=60);
        }
    }

    difference() {
        union() {
            intersection() {
                translate([0, 0, 5/2])
                hull()
                donut(26, 7, $fn=60);

                cylinder(d=40, h=7);
            }

            intersection() {
                hull() {
                    translate([30/2 - 7/2, 70/2 - 7/2, 5/2])
                    sphere(d=7, $fn=60);

                    translate([30/2 - 7/2, -70/2 + 7/2, 5/2])
                    sphere(d=7, $fn=60);

                    translate([-30/2 + 7/2, 70/2 - 7/2, 5/2])
                    sphere(d=7, $fn=60);

                    translate([-30/2 + 7/2, -70/2 + 7/2, 5/2])
                    sphere(d=7, $fn=60);
                }
                cylinder(d=200, h=5);
            }
        }

        translate([80/2 + 8.7, 23, 5/2])
        _handle_dent();

        translate([-80/2 - 8.7, 23, 5/2])
        _handle_dent();

        translate([80/2 + 8.7, -23, 5/2])
        _handle_dent();

        translate([-80/2 - 8.7, -23, 5/2])
        _handle_dent();

        translate([0, 0, -1])
        v_screw(
            h=12, screw_d=17 + 0.4, pitch=2, direction=0,
            steps=50, depth=0, chamfer=true
        );

        cylinder(d1=23.4, d2=11.4, h=6, center=true, $fn=50);

        translate([0, 0, 6])
        cylinder(d2=23.4, d1=11.4, h=6, center=true, $fn=50);
    }
}

//translate([-250/2, -210/2, -16.17])
//import(
//    "PTFE_coupler_printed_tinkercad_ps.stl",
//    convexity=10
//);


module PTFE_coupler_printed_M4_nutholders() {
    w = 32.92;

    difference() {
        union() {


            translate([w/2, w/2, 0])
            cylinder(d=9.6, h=5.6, $fn=6);

            translate([-w/2, w/2, 0])
            cylinder(d=9.6, h=5.6, $fn=6);

            translate([w/2, -w/2, 0])
            cylinder(d=9.6, h=5.6, $fn=6);

            translate([-w/2, -w/2, 0])
            cylinder(d=9.6, h=5.6, $fn=6);
        }

        translate([w/2, -w/2, 0])
        cylinder(d=3.4, h=15, center=true, $fn=30);

        translate([-w/2, -w/2, 0])
        cylinder(d=3.4, h=15, center=true, $fn=30);

        translate([w/2, w/2, 0])
        cylinder(d=3.4, h=15, center=true, $fn=30);

        translate([-w/2, w/2, 0])
        cylinder(d=3.4, h=15, center=true, $fn=30);

        translate([w/2, -w/2, 2])
        M3_nut(4);

        translate([-w/2, -w/2, 2])
        M3_nut(4);

        translate([w/2, w/2, 2])
        M3_nut(4);

        translate([-w/2, w/2, 2])
        M3_nut(4);
    }
}

module PTFE_coupler_printed_M4_insert() {
//    difference() {
//        union() {


//            translate([0, -19.7, 25.7])
//            rotate([45, 0, 0])
//            cylinder(d=14, h=15, center=true, $fn=40);
//        }

//        translate([0, 6, 0])
//        rotate([45, 0, 0])
//        cylinder(d1=7, d2=4.6, h=100, center=true, $fn=40);
//    }

    %intersection() {
        union() {
            translate([0, -4.95, -26.5])
            rotate([-45, 0, 0])
            import(
                "PTFE_coupler_printed_tinkercad.stl",
                convexity=10
            );

            translate([0, 0, 9.3])
            rotate([-180, 0, 0])
            rotate([0, 0, -90])
            PTFE_coupler_printed_cap();
        }

        translate([100/2, 0, 0])
        cube([100, 100, 100], center=true);
    }

    //cylinder(d=4.5, h=50, $fn=30);

    %translate([0, 0, -3.2])
    M4_nut(cone=false);

    %translate([0, 0, 3])
    M4_nut(cone=false);

    difference() {
        cylinder(d1=10.7, d2=11.7, h=3, $fn=30);

        cylinder(d=4.4, h=20, center=true, $fn=30);
    }
}

module PTFE_coupler_printed_cap() {
    scale([1.02, 1.02, 1])
    translate([-10.25, -10.25, 0])
    import(
        str(sph_stl_path,
            "PRESS_CAP_1.75.STL"
        ), convexity=10
    );
}

module PTFE_coupler_printed_M4_seal() {
    w = 32.92;

    difference() {
        union() {
            translate([w/2, w/2, 0])
            cylinder(d=9.6, h=0.6, $fn=6);

            translate([-w/2, w/2, 0])
            cylinder(d=9.6, h=0.6, $fn=6);

            translate([w/2, -w/2, 0])
            cylinder(d=9.6, h=0.6, $fn=6);

            translate([-w/2, -w/2, 0])
            cylinder(d=9.6, h=0.6, $fn=6);

            translate([0, 0, 0.6/2])
            rounded_cube_side(
                39, 39, 0.6, 4, center=true
            );

            tube(36, 1, 0.8, $fn=40);
            
            tube(31, 1, 0.8, $fn=40);
        }

        cylinder(d=28, h= 10, center=true, $fn=40);

        translate([w/2, -w/2, 0])
        cylinder(d=3.6, h=15, center=true, $fn=30);

        translate([-w/2, -w/2, 0])
        cylinder(d=3.6, h=15, center=true, $fn=30);

        translate([w/2, w/2, 0])
        cylinder(d=3.6, h=15, center=true, $fn=30);

        translate([-w/2, w/2, 0])
        cylinder(d=3.6, h=15, center=true, $fn=30);

    }
}
