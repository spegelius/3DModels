use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Silica Gel Spool-Core Drying Container/"
);



//_orig_silica_dose_v3();
//_orig_silica_dose_v3_deckel2();

//debug();


new_silica_gel_spool_core();
//new_silica_gel_spool_core_lid();

//new_silica_gel_spool_core(d=54.2);
//new_silica_gel_spool_core_lid(d=54.2);


module _orig_silica_dose_v3() {
    rotate([90, 0, 0])
    import(
        str(spath, "silica-dose-v3.stl"),
        convexity=10
    );

    // determine sizes
    //%cylinder(d=55, h=1, $fn=80);
    //%cylinder(d=1.5, h=5, $fn=30);
}

module _orig_silica_dose_v3_deckel2() {
    rotate([90, 0, 0])
    import(
        str(spath, "silica-dose-v3-deckel2.stl"),
        convexity=10
    );

    // determine sizes
    //%cylinder(d=55, h=1, $fn=80);
    //%cylinder(d=1.5, h=5, $fn=30);
}


module debug() {
    intersection() {
        %_orig_silica_dose_v3();
        new_silica_gel_spool_core(d=54.2);

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }

    intersection() {
        translate([0, 0, 61.5])
        rotate([180, 0, -10])
        new_silica_gel_spool_core_lid(d=54.2);

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }
}

module _bottom_grills(gd=1.2, spacing=9.5) {
    cylinder(d=gd, h=20, center=true, $fn=60);

    intersection() {
        tube(spacing + gd, 20, gd, center=true, $fn=60);

        union() {
            cube([100, 100, 100]);

            rotate([0, 0, 180])
            cube([100, 100, 100]);
        }
    }
    translate([0, spacing/2, 0])
    cylinder(d=gd, h=20, center=true, $fn=60);

    translate([spacing/2, 0, 0])
    cylinder(d=gd, h=20, center=true, $fn=60);

    translate([0, -spacing/2, 0])
    cylinder(d=gd, h=20, center=true, $fn=60);

    translate([-spacing/2, 0, 0])
    cylinder(d=gd, h=20, center=true, $fn=60);

    intersection() {
        tube(2*spacing + gd, 20, gd, center=true, $fn=60);

        for(i = [0:3]) {
            rotate([0, 0, i*90])
            translate([0, 0, -10])
            linear_extrude(20)
            polygon([[0, 0], [0, 100], [100, 100]]);
        }
    }

    for(i = [0:3]) {
        rotate([0, 0, i*90])
        translate([0, spacing, 0])
        cylinder(d=gd, h=20, center=true, $fn=60);

        rotate([0, 0, 45 + i*90])
        translate([0, spacing, 0])
        cylinder(d=gd, h=20, center=true, $fn=60);
    }

    intersection() {
        tube(3*spacing + gd, 20, gd, center=true, $fn=60);

        for(i = [0:3]) {
            rotate([0, 0, i*90])
            translate([0, 0, -10])
            linear_extrude(20)
            polygon([[0, 0], [0, 100], [-200, 100]]);
        }
    }

    for(i = [0:3]) {
        rotate([0, 0, i*90])
        translate([0, spacing*1.5, 0])
        cylinder(d=gd, h=20, center=true, $fn=60);

        rotate([0, 0, 63.2 + i*90])
        translate([0, spacing*1.5, 0])
        cylinder(d=gd, h=20, center=true, $fn=60);
    }

    intersection() {
        tube(4*spacing + gd, 20, gd, center=true, $fn=60);

        for(i = [0:3]) {
            rotate([0, 0, 25 + i*90])
            translate([0, 0, -10])
            linear_extrude(20)
            polygon([[0, 0], [0, 100], [-200, 100]]);
        }
    }

    for(i = [0:3]) {
        rotate([0, 0, 25 + i*90])
        translate([0, 2*spacing, 0])
        cylinder(d=gd, h=20, center=true, $fn=60);

        rotate([0, 0, 88.2 + i*90])
        translate([0, 2*spacing, 0])
        cylinder(d=gd, h=20, center=true, $fn=60);
    }
}

module new_silica_gel_spool_core(d=47, gd=1.2, h=60) {
    sg = floor((h - 10 - 7)/3.5);

    difference() {
        union() {
            hull() {
                chamfered_cylinder(d, h - 10, 2, $fn=60);

                translate([0, 0, h - 8])
                cylinder(d=d - 10, h=1, $fn=60);
            }

            translate([0, 0, 13.5])
            chamfered_cube(d + 1.4, 4, 5, 1, center=true, $fn=30);

            translate([0, 0, (sg - sg%2)*3.5 - 0.5])
            chamfered_cube(d + 1.4, 4, 5, 1, center=true, $fn=30);

            translate([0, 0, 10])
            chamfered_cube(4, d + 1.4, 5, 1, center=true, $fn=30);

            translate([0, 0, (sg - sg%2)*3.5 - 4])
            chamfered_cube(4, d + 1.4, 5, 1, center=true, $fn=30);

            if(h > 60) {
                translate([0, 0, floor(sg/2)*3.5 + 3])
                chamfered_cube(d + 1.4, 4, 5, 1, center=true, $fn=30);

                translate([0, 0, ceil(sg/2)*3.5 + 3])
                chamfered_cube(4, d + 1.4, 5, 1, center=true, $fn=30);
            }

            translate([0, 0, h - 10])
            intersection() {
                v_screw(
                    h=10,
                    screw_d=d - 4,
                    pitch=2.5,
                    direction=0,
                    steps=60,
                    depth=0.8,
                    chamfer=true
                );

                cylinder(d=d - 5, h=200, center=true, $fn=60);
            }
        }

        // insides
        translate([0, 0, h - 15])
        cylinder(d=d - 10, h=20, $fn=60);

        hull() {
            translate([0, 0, 1.6])
            chamfered_cylinder(d - 3, h - 13, 1.1, $fn=60);

            translate([0, 0, h - 9.5])
            cylinder(d=d - 11, h=1, $fn=60);
        }

        // bottom grills
        _bottom_grills(gd);

        // side grills
        for(j = [0:floor((h - 10 - 7)/3.5) - 1]) {
            for(i = [0:9]) {
                rotate([0, 0, i*36 + j%2*36/2])
                translate([0, 0, 6.5 + j*3.5])
                hull() {
                    rotate([-90, 0, 0])
                    cylinder(d=gd, h=0.1, $fn=30);

                    translate([3.5, d/2 + 1, 0])
                    rotate([-90, 0, 0])
                    cylinder(d=gd, h=0.1, $fn=30);

                    translate([-3.5, d/2 + 1, 0])
                    rotate([-90, 0, 0])
                    cylinder(d=gd, h=0.1, $fn=30);
                }
            }
        }
    }
}

module new_silica_gel_spool_core_lid(d=47, gd=1.2) {
    difference() {
        union() {
            intersection() {
                chamfered_cylinder(d - 1.5, 12, 1, $fn=60);

                cylinder(d=100, h=11.4);
            }

            for(i = [0:29]) {
                rotate([0, 0, i*360/30])
                hull() {
                    translate([d/2 - 2/2, 0, 2])
                    sphere(d=1.9, $fn=30);

                    translate([d/2 - 2/2, 0, 9.5])
                    sphere(d=1.9, $fn=30);
                }
            }
        }

        translate([0, 0, 20 + 1.6])
        rotate([180, 0, 0])
        v_screw(
            h=20,
            screw_d=d - 3.5,
            pitch=2.5,
            direction=0,
            steps=60,
            depth=0.8,
            chamfer=true
        );

        translate([0, 0, 1.6])
        chamfered_cylinder(d - 6.8, 20, 0.9, $fn=60);

        translate([0, 0, 6.4])
        chamfered_cylinder(d, 30, 7, $fn=60);

        intersection() {
            _bottom_grills(gd, 8.7);

            //cylinder(d=35, h=20, center=true);
        }
    }
}
