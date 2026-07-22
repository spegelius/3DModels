use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Small spool adapter ring for Bambu Labs AMS/"
);


//_orig_ring_199_5();
//debug();


//new_small_spool_adapter_ring(id=180, h=1.5);
//new_small_spool_adapter_ring(id=160, h=2.6);
new_small_spool_adapter_ring(id=160.2, h=2.2);


module _orig_ring_199_5() {
    translate([0, 0, 4])
    rotate([90, 0, 0])
    import(
        str(spath, "Ring 119.5mm.stl"),
        convexity=10
    );

    //%cylinder(d=105, h=20);
}

module mock_spool() {
    difference() {
        union() {
            cylinder(d=180, h=1.5, $fn=100);

            translate([0, 0, 53.5])
            cylinder(d=180, h=1.5, $fn=100);

            cylinder(d=100, h=55, $fn=100);
        }

        cylinder(d=55, h=200, center=true, $fn=100);
    }
}


module debug() {
    new_small_spool_adapter_ring(id=180, h=1.5);

    %translate([0, 0, 2.6])
    mock_spool();
}


module new_small_spool_adapter_ring(id=119, h=2) {
    eh = 2.6 + 1.5 + h;

    module _edge_clip() {
        difference() {
            intersection() {
                translate([0, id/2 + 10/2 - 2, eh/2])
                cube([34, 10, eh], center=true);

                translate([0, 0, -20])
                chamfered_cylinder(id + 20, 20 + eh, eh, $fn=100);

                rounded_cylinder(199, eh, 1.4, $fn=100);
            }

            rotate([0, 0, -7])
            translate([20/2, 200/2, 20/2])
            chamfered_cube(
                20, 200, 20, eh, center=true
            );

            rotate([0, 0, 7])
            translate([-20/2, 200/2, 20/2])
            chamfered_cube(
                20, 200, 20, eh, center=true
            );

            difference() {
                cylinder(d=id + 0.2, h=eh, $fn=100);

                translate([0, 0, eh - 1.6/2])
                donut(id + 1.2, 2, $fn=100);
            }
        }
    }

    difference() {
        union() {
            intersection() {
                scale([1.005, 1.005, 1])

                _orig_ring_199_5();
                rounded_cylinder(200, 2.6, 1.4, $fn=100);
            }

            difference() {
                rounded_cylinder(200, 3.2, 1.4, $fn=100);

                translate([0, 0, -0.2])
                chamfered_cylinder(200, 40, 6, $fn=100);
            }

            for(i = [0:2]) {
                rotate([0, 0, i*120 + 38])
                _edge_clip();
            }
        }

        // hex pattern cut
        intersection() {
            difference() {
                translate([0, 0, 0.6])
                tube(155, 10, 22.5, $fn=120);

                for(i = [0:2]) {
                    rotate([0, 0, i*120 + 38])

                    translate([0, id/2 + 10/2 - 2, eh/2])
                    rounded_cube(
                        34, 10, 20, 4, center=true, $fn=30
                    );
                }
            }

            for(j = [0:40]) {
                translate([0, -200 + j*10, 0])
                rotate([0, 0, -60])
                for (i = [0:49]) {
                    translate([0, i*10, 0])
                    cylinder(
                        d=9.5, h=60,
                        center=true, $fn=6
                    );

                    translate([0, -10 - i*10, 0])
                    cylinder(
                        d=9.5, h=60,
                        center=true, $fn=6
                    );
                }
            }
        }

        // filament holes
        for(i = [0:11]) {
            rotate([0, 0, -6.3 + i*30])
            translate([200/2 - 7, 0, 0])
            cylinder(d=4.5, h=20, center=true, $fn=30);
        }
    }
    
}