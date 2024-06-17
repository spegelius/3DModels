use <../../Dollo/NEW_long_ties/include.scad>;
use <../Gigabyte_Aorus-remix/Gigabyte_Aorus-remix.scad>;


stl_base_path = "../../_downloaded/";
gpath = str(
    stl_base_path, "Gigabyte Aorus logo/"
);

cpath = str(
    stl_base_path, "Corsair/"
);



//_orig_cover();
//_cover_blank();

//debug_cover_aorus_logo_text();
//debug_cover_aorus_mesh1();
//debug_cover_aorus_mesh2();

//cover_aorus_logo_text_bottom();
//cover_aorus_logo_text_top();

//cover_aorus_mesh1_bottom();
//cover_aorus_mesh1_top();

//cover_aorus_mesh2_bottom();
cover_aorus_mesh2_top();


module _orig_cover() {
    translate([-0.5275, -6.1545, 0.84])
    import(
        str(cpath, "corsair H100i v3.stl"),
        convexity=10
    );
}

module debug_cover_aorus_logo_text() {
    color("GhostWhite")
    render()
    cover_aorus_logo_text_bottom();

    color(c = [40/255, 40/255, 40/255])
    render()
    //translate([0, 0, 0.05])
    cover_aorus_logo_text_top();
}

module debug_cover_aorus_2() {
    color("GhostWhite")
    render()
    cover_aorus_2_bottom();

    color(c = [40/255, 40/255, 40/255])
    render()
    //translate([0, 0, 0.05])
    cover_aorus_2_top();
}

module _cover_holes(d=3.2, h=10) {
    for (i = [0:3]) {
        rotate([0, 0, i*90])
        translate([20.5, 20.5, 0])
        cylinder(d=d, h=h, $fn=40);
    }
}

module _cover_blank(chamfer=true, h=5) {
    //%_orig_cover();

    h2 = h - 2.2;

    difference() {
        if (chamfer) {
            hull() {
                translate([0, 0, h2/2])
                chamfered_cube_side(
                    60.7, 60.7, h2, 10.8, center=true
                );

                translate([0, 0, h/2])
                chamfered_cube_side(
                    57, 57, h, 9.61, center=true
                );
            }
        } else {
            translate([0, 0, h/2])
            chamfered_cube_side(
                60.7, 60.7, h, 10.8, center=true
            );
        }

        translate([0, 0, -1])
        _cover_holes();

        translate([0, 0, 2])
        _cover_holes(d=6.65);

    }
}

module cover_aorus_logo_text_bottom() {
    intersection() {
        _cover_blank(chamfer=false);

        translate([0, 0, 4.4/2])
        cube([100, 100, 4.4], center=true);
    }
    
}

module cover_aorus_logo_text_top() {
    difference() {
        intersection() {
            _cover_blank(chamfer=false);

            translate([0, 0, 4/2 + 4.4])
            cube([100, 100, 4.4], center=true);
        }

        translate([25, 5, 0])
        scale([0.16, 0.16, 1])
        aorus_logo();

        translate([-2, -11, 0])
        rotate([0, 0, 39])
        scale([0.09, 0.09, 1])
        aorus_text();
    }
}

module cover_aorus_mesh1_bottom() {
    intersection() {
        union() {
            _cover_blank(chamfer=false, h=4);

//            translate([0, 0, 4.4/2])
//            chamfered_cube_side(
//                35, 35, 4.4, 2, center=true
//            );
        }
    }
}

module cover_aorus_mesh2_bottom() {
    intersection() {
        union() {
            _cover_blank(chamfer=false, h=4);

//            translate([0, 0, 4.4/2])
//            chamfered_cube_side(
//                35, 35, 4.4, 2, center=true
//            );
        }
    }
}

module cover_aorus_mesh1_top() {

    module _mesh1() {
        mesh_step = 2;

        difference() {
            //scale([0.97, 0.97, 4])
            linear_extrude(5)
            offset(-0.8)
            projection()
            _cover_blank(chamfer=false);

            cube([38, 38, 40], center=true);

            _cover_holes(d=9);

            for(j = [0:10]) {
                translate([0, 0, j*0.2 + 0.2/2])
                rotate([0, 0, 45 + j*90])
                for(i = [0:99]) {
                    translate([-100 + i*mesh_step, 0, 0])
                    cube([0.8, 200, 0.2], center=true);
                }
            }
        }
    }

    module _aorus_logo() {
        translate([24.5, 0.7, 0])
        scale([0.13, 0.13, 1])
        aorus_logo();
    }

    z_off = 4;

    difference() {
        intersection() {
            _cover_blank(chamfer=false, h=5);

            translate([0, 0, 2/2 + z_off])
            cube([100, 100, 2], center=true);
        }

        _aorus_logo();

        linear_extrude(z_off + 0.6)
        offset(0.12)
        projection()
        _aorus_logo();

        translate([0, 0, 3.8])
        _mesh1();

//        translate([0, 0, 4.4/2])
//        chamfered_cube_side(
//            35, 35, 4.4, 2, center=true
//        );
    }
}

module cover_aorus_mesh2_top() {

    module _mesh2() {
        //mesh_step = 2.5;
        mesh_step = 3;
        xoff = -3*25;

        difference() {
            //scale([0.97, 0.97, 4])
            linear_extrude(5)
            offset(-0.8)
            projection()
            _cover_blank(chamfer=false);

            cube([38, 38, 40], center=true);

            //_cover_holes(d=6.65);

            for(j = [0:6]) {
                translate([0, 0, j*0.2 + 0.2/2])
                for(i = [0:49]) {
                    translate([xoff + i*mesh_step, 0, 0])
                    cube([0.8, 200, 0.2], center=true);
                }

                translate([0, 0, j*0.2 + 0.2/2])
                rotate([0, 0, 120])
                for(i = [0:49]) {
                    translate([xoff + i*mesh_step, 0, 0])
                    cube([0.8, 200, 0.2], center=true);
                }

                translate([0, 0, j*0.2 + 0.2/2])
                rotate([0, 0, -120])
                for(i = [0:49]) {
                    translate([xoff + i*mesh_step, 0, 0])
                    cube([0.8, 200, 0.2], center=true);
                }
            }
        }
    }

    module _aorus_logo() {
        translate([24.5, 0.7, 0])
        scale([0.13, 0.13, 1])
        aorus_logo();
    }

    z_off = 4;

    difference() {
        intersection() {
            _cover_blank(chamfer=false, h=5);

            translate([0, 0, 2/2 + z_off])
            cube([100, 100, 2], center=true);
        }

        _aorus_logo();

        linear_extrude(z_off + 0.6)
        offset(0.12)
        projection()
        _aorus_logo();

        translate([0, 0, 3.8])
        _mesh2();

//        translate([0, 0, 4.4/2])
//        chamfered_cube_side(
//            35, 35, 4.4, 2, center=true
//        );
    }
}