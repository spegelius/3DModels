use <../Dollo/NEW_long_ties/include.scad>;


// HOWTO:
// 1. Mexhmixer: 3headedSkull.stl to solid. Huge file
// 2. PrusaSlicer: simplify -> export stl
// 3. TinkerCad: load simplified stl and export it. This centers it
// 4. OpenScad: import the TK eported stl and use it to design the dish cut
// 4.1. Add three cubes to dish cut :
//   - -100, -100, 0
//   - 100, -100, 0
//   - 0, 100, 0
//   - these force TK to retain the object position when imported.
// 5. TinkerCad: import the TK export + disk cut.
// 5.1. Set disk cut to hole
// 5.2. Merge both objects
// 5.3. Export result


stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "TriSkullQuadraClops Candy Dish/"
);

spath2 = str(
    stl_base_path, "TriSkullQuadraClops/"
);

//_orig_3headedSkull_Dished();
//_orig_3headedSkull();
//_orig_cateye_v2();
//_orig_eyeball_v2();

//debug_eye();
//debug_skull();

//_triskull_solid_simple();

//_filled();

//_triskull_tk();

//_outer_dished();
//_dish_cut();

//dish_cut_for_tk();

//eyeball_v3();
//cateye_v3();
//cateye_v3_black();
//cateye_v3_green();
eye_screw();


module _orig_3headedSkull_Dished() {
    translate([-50.25, -51.1, 0])
    import(
        str(spath, "3headedSkull_Dished.stl"),
        convexity=10
    );
}

module _orig_cateye_v2() {
    translate([-6.375, -6.375, 0])
    import(
        str(spath, "catEye_v2.stl"),
        convexity=10
    );
}

module _orig_eyeball_v2() {
    translate([-11.873, -11.873, -3.072])
    import(
        str(spath, "eyeBall_v2.stl"),
        convexity=10
    );
}

module debug_eye() {
    color("white")
    intersection() {
        eyeball_v3();

//        translate([0, 100/2, 0])
//        cube([100, 100, 100], center=true);
    }

    //cateye_v3();

    color("darkgrey")
    cateye_v3_black();

    color("lightgreen")
    cateye_v3_green();

//    #cylinder(d=9.1, h=40, $fn=50);

//    translate([0, 0, -2.1])
//    eye_screw();

    cylinder(d=7, h=20, center=true, $fn=30);
}

module debug_skull() {
    //difference() {
        %_triskull_tk_final();

        translate([13.3, -18.2, 43])
        rotate([87, 0, 25])
        render()
        debug_eye();
        
        translate([-13.3, -18.2, 43])
        rotate([87, 0, -25])
        render()
        debug_eye();

        translate([-33, -1, 43.7])
        rotate([83, 0, -60])
        render()
        debug_eye();

        translate([33, -1, 43.7])
        rotate([83, 0, 60])
        render()
        debug_eye();
    //}
}

module _triskull_solid() {
    translate([-280.02, -264.95, -37.25])
    import(
        "triskull_solid.stl",
        convexity=10
    );
}

module _triskull_solid_simple() {
    translate([-280.02, -264.95, -37.25])
    import(
        "triskull_solid_simple.stl",
        convexity=10
    );
}

module _orig_3headedSkull() {
    translate([-110, -109.97, 0])
    import(
        str(spath2, "3headedSkull.stl"),
        convexity=10
    );
}


// TK 4.
module _triskull_tk() {
    import(
        "triskull_tk.stl",
        convexity=10
    );
}

module _triskull_tk_final() {
    import(
        "triskull_tk_final.stl",
        convexity=10
    );
}

// test stuff
module _filled() {
    hull()
    _orig_3headedSkull_Dished();
}

module _outer_dished() {
    difference() {
        translate([0, 0, 70/2])
        cube([200, 200, 70], center=true);

        //_orig_3headedSkull_Dished();
        _triskull_tk();
    }
}

// real deal
module _dish_cut() {
    //%_orig_3headedSkull_Dished();

    module _eye_hole() {
        union() {
            cylinder(d=7.5, h=30, center=true, $fn=40);

            translate([0, 0, -4.4])
            hull() {
                cylinder(d=9.5, h=2, $fn=30);
                cylinder(d=7.3, h=3, $fn=30);
            }
        }
    }

    difference() {
        union() {
            translate([0, 15, 40])
            scale([0.97, 1, 1])
            sphere(d=68, $fn=100);

            hull() {
                translate([0, 15, 40])
                scale([0.97, 1, 1])
                sphere(d=65, $fn=100);

                translate([8, 12, 80])
                cylinder(d=50, $fn=100);

                translate([-8, 12, 80])
                cylinder(d=50, $fn=100);

            }

            hull() {
                translate([0, 21, 1])
                cylinder(d=30, h=1, $fn=60);

                translate([0, 22.9, 36])
                cylinder(d=52, h=1, $fn=60);
            }

            translate([0, 30, 75.7])
            rotate([-18.9, 0, ])
            cube([100, 100, 50], center=true);

            // eye holes
            translate([13.3, -18.2, 43])
            rotate([87, 0, 25])
            _eye_hole();
            
            translate([-13.3, -18.2, 43])
            rotate([87, 0, -25])
            _eye_hole();

            translate([-33, -1, 43.7])
            rotate([83, 0, -60])
            _eye_hole();

            translate([33, -1, 43.7])
            rotate([83, 0, 60])
            _eye_hole();
        }

        translate([0, -14, 16])
        rotate([-50, 0, 0])
        cylinder(d=20, h=5);
    }
}

module dish_cut_for_tk() {
    union() {
        _dish_cut();

        translate([-100, -100, 5/2])
        cube([5, 5, 5], center=true);

        translate([100, -100, 5/2])
        cube([5, 5, 5], center=true);

        translate([0, 100, 5/2])
        cube([5, 5, 5], center=true);
    }
}

module eyeball_v3() {
    difference() {
        _orig_eyeball_v2();

        translate([0, 0, -1])
        intersection() {
            v_screw(
                h=13,
                screw_d=7,
                pitch=1.1,
                direction=0,
                steps=50,
                depth=0.3,
                chamfer=true
            );

            cylinder(d1=25, d2=1, h=13, $fn=40);
        }

        translate([0, 0, 14.2])
        cylinder(d=20, h=1);
    }
}

module cateye_v3(dc=false) {
    if (dc) {
        translate([0, 0, 12.85])
        scale([1.017, 1.017, 1])
        _orig_cateye_v2();
    } else {
        translate([0, 0, 12.85])
        _orig_cateye_v2();
    }    
}

module cateye_v3_black() {
    intersection() {
        cateye_v3(dc=true);

        translate([0, 0, 12.8])
        cylinder(d=20, h=1.4);
    }
}

module cateye_v3_green() {
    intersection() {
        cateye_v3(dc=true);

        translate([0, 0, 14.2])
        cylinder(d=20, h=2);
    }
}

module eye_screw() {
    difference() {
        union() {
            hull() {
                cylinder(d=9, h=1, $fn=30);
                cylinder(d=6.8, h=2, $fn=30);
            }
            cylinder(d=6.7, h=2, $fn=30);

            v_screw(
                h=10,
                screw_d=6.7,
                pitch=1.1,
                direction=0,
                steps=50,
                depth=0.25,
                chamfer=true
            );
        }

        cube([1.5, 20, 3], center=true);
    }
}

// temp stuff, not needed
module temp_drill_jig() {
    difference() {
        scale(1.2)
        _orig_eyeball_v2();

        cylinder(d=3.2, h=100, center=true, $fn=20);

        translate([0, 0, 15])
        cylinder(d=30, h=20);
    }
}