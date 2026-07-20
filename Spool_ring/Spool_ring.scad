
use <../Dollo/NEW_long_ties/include.scad>;

t_slop = 0.35;
// common ID
c_id = 48;


//debug();

//_spool_insert_disk(70);

//spool_ring(id=199, h=3);
//spool_ring(id=198, h=3);

//spool_insert();
//spool_insert_end();

//spool_insert(sd=54, h=62.2, id=50);
//spool_insert_end(sd=54);

// ****** Cardboard spools ******
// FormFutura
//spool_ring(id=200, h=2.8);
//spool_insert(sd=55.5, h=66);
//spool_insert_end(sd=55.5);

// Creality Hyper Series
//spool_ring(id=200.5, h=3.6);
//spool_insert(sd=55.3, h=65);
//spool_insert_end(sd=55.3);

// PolyTerra PLA
//spool_ring(id=198.6, h=2.9);
//spool_insert(sd=54.9, h=64);
//spool_insert_end(sd=54.9);

// R3D
//spool_ring(id=195, h=3);
//spool_insert(sd=54.5, h=57.8);
//spool_insert_end(sd=54.5);

// Esun
//spool_ring(id=199.3, h=3);
//spool_insert(sd=54.2, h=61.4);
//spool_insert_end(sd=54.2);

// ColorFabb
//spool_ring(id=198.5, h=2.3);
//spool_insert(sd=55.9, h=51.6);
//spool_insert_end(sd=55.9);

// FormFutura BVOH
//spool_ring(id=198.8, h=2.2);
//spool_insert(sd=56, h=39.5);
//spool_insert_end(sd=56);


// ****** Other spools ******
// Clas Ohlson
//spool_insert_clas_ohlson();
//spool_insert_end_clas_ohlson();

// 3DJake
//spool_insert_3djake();
//spool_insert_end_3djake();
//spool_insert_end_3djake_no_lip();

// Anycubic
//spool_insert_anycubic();
//spool_insert_end_anycubic();

// Prusa
//spool_insert_prusa();
//spool_insert_prusa(h=64);
//spool_insert_end_prusa();

// Extrudr
//spool_insert_extrudr();
//spool_insert_end_extrudr();

// Filamentum
//spool_insert_filamentum();
//spool_insert_end_filamentum();

// Esun
//spool_insert_esun();
//spool_insert_end_esun();

// PolyMax
//spool_insert_polymax();
//spool_insert_end_polymax();

// Extrudr #2
//spool_insert_extrudr2();
//spool_insert_end_extrudr2();

// 3DJake small nicepva
//spool_insert_3djake_smol();
//spool_insert_end_3djake_smol();

// Qidi
//spool_insert_qidi();
//spool_insert_end_qidi();

// Extrudr3
//spool_insert_extrudr3();
//spool_insert_end_extrudr3();

// Recreus
//spool_insert_recreus();
//spool_insert_end_recreus();

// Fiberlogy PC-ABS
//spool_insert_fiberlogy();
//spool_insert_end_fiberlogy();

// Easyprint
//spool_insert_easyprint();
//spool_insert_end_easyprint();

// FormFutura
//spool_insert_formfutura();
//spool_insert_end_formfutura();

// alpaplastic.com
//spool_insert_alpaplastic();
//spool_insert_end_alpaplastic();

// devildesign.com
//spool_insert_devildesign();
//spool_insert_end_devildesign();

// Spege
//spool_insert_spege();
//spool_insert_end_spege();

//spool_insert_extrudr_4();
spool_insert_end_extrudr_4();


module debug() {

//    intersection() {
//        spool_insert();
//
//        translate([0, 200/2, 0])
//        cube([200, 200, 400], center=true);
//    }
//
//    translate([0, 0, 72.2])
//    rotate([0, 180, 0])
//    intersection() {
//        spool_insert_end();
//
//        translate([0, 200/2, 0])
//        cube([200, 200, 400], center=true);
//    }

    // Prusa
//    intersection() {
//        spool_insert_prusa();
//
//        translate([0, 200/2, 0])
//        cube([200, 200, 400], center=true);
//    }
//
//    translate([0, 0, 71.25])
//    rotate([0, 180, 0])
//    intersection() {
//        spool_insert_end_prusa();
//
//        translate([0, 200/2, 0])
//        cube([200, 200, 400], center=true);
//    }

    // Clas Ohlson
//    intersection() {
//        spool_insert_clas_ohlson();
//
//        translate([0, 200/2, 0])
//        cube([200, 200, 400], center=true);
//    }
//
//    translate([0, 0, 61])
//    rotate([0, 180, 0])
//    intersection() {
//        spool_insert_end_clas_ohlson();
//
//        translate([0, 200/2, 0])
//        cube([200, 200, 400], center=true);
//    }

    // 3DJake
//    intersection() {
//        spool_insert_3djake();
//
//        translate([0, 200/2, 0])
//        cube([200, 200, 400], center=true);
//    }
//
//    translate([0, 0, 71.2])
//    rotate([0, 180, 0])
//    intersection() {
//        rotate([0, 0, 80])
//        spool_insert_end_3djake();
//
//        translate([0, 200/2, 0])
//        cube([200, 200, 400], center=true);
//    }

    // Anycubic
    intersection() {
        spool_insert_anycubic();

        translate([0, 200/2, 0])
        cube([200, 200, 400], center=true);
    }

    translate([0, 0, 66.2])
    rotate([0, 180, 0])
    intersection() {
        rotate([0, 0, 80])
        spool_insert_end_anycubic();

        translate([0, 200/2, 0])
        cube([200, 200, 400], center=true);
    }
}



module spool_ring(id=199, h=3) {

    difference() {
        chamfered_cylinder(
            id + 3.1, h + 2, 1, $fn=200
        );

        intersection() {
            cylinder(
                d=id - 5, h=h*4, center=true, $fn=200
            );

            cube([id - 12, id - 12, h*4], center=true);
        }

        translate([0, 0, 1])
        cylinder(d=id + 0.1, h=h, $fn=200);

        translate([0, 0, 1.5])
        chamfered_cylinder(id + 0.1, h, 0.5, $fn=200);

        translate([0, 0, 2])
        cylinder(d=id - 0.8, h=h*2, $fn=200);
    }
}

module _spool_insert_disk(od, holes=true) {

    difference() {
        hull() {
            cylinder(d=od - 1.2, h=2, $fn=80);

            translate([0, 0, 0.4])
            cylinder(d=od, h=1.2, $fn=80);
        }

        for(i = [0:7]) {
            rotate([0, 0, 360/16 + i*360/8])
            translate([od/2 + 2, 0, 0])
            cylinder(d=13, h=20, center=true, $fn=30);
        }

        if (holes) {
            for(i = [0:3]) {
                rotate([0, 0, i*90])
                translate([od/2 - 4, 0, 0])
                cylinder(d=1.8, h=10, center=true, $fn=20);
            }
        }

        difference() {
            translate([0, 0, 1])
            cylinder(d=od - 3, h=10, $fn=80);

            for(i = [0:5]) {
                rotate([0, 0, i*30])
                cube([200, 2, 10], center=true);
            }

            for(i = [0:7]) {
                rotate([0, 0, 360/16 + i*360/8])
                translate([od/2 + 2, 0, 0])
                cylinder(d=17, h=20, center=true, $fn=30);
            }

            if (holes) {
                for(i = [0:3]) {
                    rotate([0, 0, i*90])
                    translate([od/2 - 4, 0, 0])
                    cylinder(
                        d=4, h=10, center=true, $fn=20
                    );
                }
            }
        }
    }
}

module spool_insert(sd=55.5, h=68, id=c_id, holes=true, disk=true) {
    od = sd + 25;
    th = h + 5.3;

    difference() {
        union() {
            if (disk) {
                _spool_insert_disk(od, holes=holes);
            }

            intersection() {
                translate([0, 0, -1])
                chamfered_cylinder(id + 2.4, th - 2.2, 1, $fn=80);

                cylinder(d=100, h=th - 3);
            }

            intersection() {
                union() {
                    cube([1.2, 200, 400], center=true);
                    cube([200, 1.2, 400], center=true);

                    rotate([0, 0, 45])
                    cube([200, 1.2, 400], center=true);

                    rotate([0, 0, -45])
                    cube([200, 1.2, 400], center=true);
                }

                hull() {
                    cylinder(d=sd, h=th - 4.5, $fn=80);
                    cylinder(d=sd - 1, h=th - 4, $fn=80);
                }
            }

            translate([0, 0, th - 4])
            intersection() {
                v_screw(
                    h=4,
                    screw_d=51.3,
                    pitch=1.5,
                    direction=0,
                    steps=80,
                    depth=0.6,
                    chamfer=false
                );

                chamfered_cylinder(50.8, 20, 0.5, $fn=80);
            }

            translate([0, 0, th - 5])
            cylinder(d=49.5, h=5, $fn=80);
        }

        // inner hole
        cylinder(
            d=id, h=300, center=true, $fn=80
        );

        // chamfers
        translate([0, 0, th - 0.5])
        chamfered_cylinder(id + 5, 20, 2.7, $fn=80);

        translate([0, 0, -20 + 0.5])
        chamfered_cylinder(id + 5, 20, 2.7, $fn=80);
    }
}

module spool_insert_end(sd=55.5, holes=true) {
    od = sd + 25;

    difference() {
        union() {
            _spool_insert_disk(od, holes=holes);

            cylinder(
                d=51.3 + t_slop + 2.5, h=2.6, $fn=80
            );
        }

        intersection() {
            translate([0, 0, -1])
            v_screw(
                h=4,
                screw_d=51.3 + t_slop,
                pitch=1.5,
                direction=0,
                steps=80,
                depth=0.6,
                chamfer=false
            );

            cylinder(d=50.8 + t_slop, h=20, center=true, $fn=80);
        }

        cylinder(d=50.8 + t_slop - 1.3, h=20, center=true, $fn=80);
    }
}

module spool_insert_clas_ohlson() {
    union() {
        spool_insert(sd=53, h=57, id=c_id, holes=false);

        difference() {
            translate([0, 0, 12/2])
            cube([8, 71, 12], center=true);

            cylinder(d=57.5, h=100, center=true, $fn=80);

            translate([0, 0, 10/2 + 2.6 + 7.4])
            cube([2.8, 80, 10], center=true);
        }
    }
}

module spool_insert_end_clas_ohlson() {
    spool_insert_end(sd=53, holes=false);
}

module spool_insert_3djake() {
    union() {
        spool_insert(sd=52.2, h=66, id=c_id, holes=false, disk=false);

        difference() {
            tube(61.2, 4, 5.9, $fn=80);

            translate([0, 0, 1.6])
            cylinder(d=58.2, h=10, $fn=80);
        }
        
        difference() {
            translate([0, 7/2 + 58.5/2, 8/2])
            cube([8, 7, 8], center=true);

            translate([0, 0, 10/2 + 5])
            cube([1.8, 80, 10], center=true);
       }
    }
}

module spool_insert_end_3djake() {
    sd = 52.2;
    difference() {
        union() {
            intersection() {
                spool_insert_end(sd=sd, holes=false);

                cylinder(d=100, h=1.8);
            }
            cylinder(d=54.5, h=3, $fn=80);
        }

        intersection() {
            translate([0, 0, -1])
            v_screw(
                h=10,
                screw_d=51.3 + t_slop,
                pitch=1.5,
                direction=0,
                steps=80,
                depth=0.6,
                chamfer=false
            );

            cylinder(d=50.8 + t_slop, h=20, center=true, $fn=80);
        }

        cylinder(d=50.8 + t_slop - 1.3, h=20, center=true, $fn=80);
    }
}

module spool_insert_end_3djake_no_lip() {
    spool_insert_end(sd=52.2, holes=false);
}

module spool_insert_anycubic() {
    difference() {
        union() {
            spool_insert(sd=72.2, h=61, id=c_id, holes=false, disk=false);

            difference() {
                tube(80, 2, 15, $fn=80);
            }

            intersection() {
                tube(87, 3, 4, $fn=80);

                translate([0, 35, 0])
                cube([36.6, 20, 10], center=true);
            }

            translate([0, 79/2 + 1.7, 0])
            cylinder(d=3, h=4.4, $fn=30);
        }
    }
}

module spool_insert_end_anycubic() {
    spool_insert_end(sd=72.2, holes=false);
}

module spool_insert_prusa(h=66.5) {
    union() {
        spool_insert(sd=51, h=h, id=c_id, holes=false, disk=false);

        tube(65, 1.6, (65 - 49)/2, $fn=80);

        translate([0, 6/2 + 50/2, 4/2 + 1])
        cube([2, 6, 4], center=true);
    }
}

module spool_insert_end_prusa() {
    spool_insert_end(sd=51, holes=false);
}

module spool_insert_extrudr() {
    union() {
        spool_insert(sd=52.3, h=67, id=c_id, holes=false, disk=false);

        tube(61.3, 1.6, 5.9, $fn=80);
        
        difference() {
            translate([0, 7/2 + 58.5/2, 4/2])
            cube([8, 7, 4], center=true);

            translate([0, 0, 10/2 + 1.6])
            cube([2.4, 80, 10], center=true);
       }
    }
}

module spool_insert_end_extrudr() {
    spool_insert_end(sd=52.3, holes=false);
}

module spool_insert_filamentum() {
    union() {
        spool_insert(sd=52.5, h=54.7, id=c_id, holes=false, disk=false);

        tube(61.3, 1.6, 5.9, $fn=80);
        
        difference() {
            translate([0, 7/2 + 58.6/2, 4/2])
            cube([8, 7, 4], center=true);

            translate([0, 0, 10/2 + 1.6])
            cube([2.4, 80, 10], center=true);
       }
    }
}

module spool_insert_end_filamentum() {
    spool_insert_end(sd=52.5, holes=false);
}

module spool_insert_esun() {
    union() {
        spool_insert(sd=51.5, h=60.7, id=c_id, holes=false, disk=false);

        tube(61.3, 1.6, 5.9, $fn=80);
        
        difference() {
            translate([0, 4/2 + 57/2, 4/2])
            cube([8.3, 4, 4], center=true);

            translate([0, 0, 10/2 + 1.6])
            cube([3.7, 80, 10], center=true);
       }
    }
}

module spool_insert_end_esun() {
    spool_insert_end(sd=51.5, holes=false);
}

module spool_insert_polymax() {
    spool_insert(sd=55.2, h=46.4, id=c_id);
}

module spool_insert_end_polymax() {
    spool_insert_end(sd=55.2, holes=false);
}

module spool_insert_extrudr2() {
    difference() {
        union() {
            spool_insert(
                sd=53.3, h=54.5, id=c_id, holes=false, disk=false
            );

            tube(60, 2, 5, $fn=80);

            intersection() {
                tube(63.8, 3, 3, $fn=80);

                translate([0, 30, 0])
                cube([24.4, 20, 10], center=true);
            }
        }
    }
}

module spool_insert_end_extrudr2() {
    spool_insert_end(sd=53.3, holes=false);
}

module spool_insert_3djake_smol() {
    difference() {
        union() {
            spool_insert(
                sd=52.7, h=42.2, id=c_id, holes=false, disk=false
            );

            tube(60, 2, 5, $fn=80);

            intersection() {
                tube(63.8, 3, 3, $fn=80);

                translate([0, 30, 0])
                cube([24.4, 20, 10], center=true);
            }
        }
    }
}

module spool_insert_end_3djake_smol() {
    spool_insert_end(sd=52.7, holes=false);
}

module spool_insert_qidi() {
    union() {
        spool_insert(sd=55.2, h=62, id=c_id, holes=false, disk=false);

        tube(63, 1.6, 7, $fn=80);
        
        difference() {
            translate([0, 6/2 + 59/2, 4/2])
            cube([8.3, 6, 4], center=true);

            translate([0, 0, 10/2 + 1.6])
            cube([2.6, 80, 10], center=true);
       }
    }
}

module spool_insert_end_qidi() {
    spool_insert_end(sd=55.2, holes=false);
}

module spool_insert_extrudr3() {
    difference() {
        union() {
            spool_insert(
                sd=52.4, h=54.5, id=c_id, holes=false, disk=false
            );

            tube(60, 2, 5, $fn=80);

            difference() {
                translate([0, 5/2 + 58/2, 4/2])
                cube([8.3, 5, 4], center=true);

                translate([0, 0, 10/2 + 1.6])
                cube([2.2, 80, 10], center=true);
            }
        }
    }
}

module spool_insert_end_extrudr3() {
    spool_insert_end(sd=52.4, holes=false);
}

module spool_insert_recreus() {
    difference() {
        union() {
            spool_insert(
                sd=52.4, h=53, id=c_id, holes=false, disk=false
            );

            tube(60, 2, 5, $fn=80);

            difference() {
                translate([0, 5/2 + 58/2, 4/2])
                cube([8.3, 5, 4], center=true);

                translate([0, 0, 10/2 + 1.6])
                cube([2.2, 80, 10], center=true);
            }
        }
    }
}

module spool_insert_end_recreus() {
    spool_insert_end(sd=52.4, holes=false);
}

module spool_insert_fiberlogy() {
    difference() {
        union() {
            spool_insert(
                sd=52.4, h=56.5, id=c_id, holes=false, disk=false
            );

            tube(60, 2, 5, $fn=80);

            translate([0, 5/2 + 58/2, 2/2])
            cube([8.3, 5, 2], center=true);

            translate([0, 54/2 + 4 + 12.6/2, 0 ])
            tube(12.5, 5, 1.2, $fn=30);
        }
    }
}

module spool_insert_end_fiberlogy() {
    spool_insert_end(sd=52.4, holes=false);
}

module spool_insert_easyprint() {
    difference() {
        union() {
            spool_insert(
                sd=53.5, h=54.2, id=c_id, holes=false, disk=false
            );

            tube(60, 2, 5, $fn=80);

            translate([0, 5/2 + 53/2, 4/2])
            cube([6, 5, 4], center=true);
        }
    }
}

module spool_insert_end_easyprint() {
    spool_insert_end(sd=53.5, holes=false);
}

module spool_insert_formfutura() {
    difference() {
        union() {
            spool_insert(
                sd=52.3, h=53, id=c_id, holes=false, disk=false
            );

            tube(60, 2, 5, $fn=80);

            intersection() {
                tube(63.8, 3, 3, $fn=80);

                translate([0, 30, 0])
                cube([23, 20, 10], center=true);
            }
        }
    }
}

module spool_insert_end_formfutura() {
    spool_insert_end(sd=52.3, holes=false);
}

module spool_insert_alpaplastic() {
    difference() {
        union() {
            spool_insert(
                sd=51.8, h=44, id=c_id, holes=false, disk=false
            );

            tube(60, 2, 5, $fn=80);

            translate([0, 5/2 + 58/2, 2/2])
            cube([8.3, 5, 2], center=true);

            translate([0, 51.8/2 + 5.7 + 10/2, 0 ])
            tube(9.8, 5, 1.2, $fn=30);
        }
    }
}

module spool_insert_end_alpaplastic() {
    spool_insert_end(sd=51.8, holes=false);
}

module spool_insert_devildesign() {
    difference() {
        union() {
            spool_insert(
                sd=52.4, h=44, id=c_id, holes=false, disk=false
            );

            tube(60, 2, 5, $fn=80);

            translate([0, 5/2 + 58/2, 2/2])
            cube([8.3, 5, 2], center=true);

            translate([0, 52.4/2 + 5.4 + 11/2, 0 ])
            tube(10.6, 5, 1.2, $fn=30);
        }
    }
}

module spool_insert_end_devildesign() {
    spool_insert_end(sd=52.4, holes=false);
}

module spool_insert_spege() {
    difference() {
        union() {
            spool_insert(
                sd=55.2, h=66, id=c_id, holes=false, disk=false
            );

            tube(62, 2, 6, $fn=80);
        }
    }
}

module spool_insert_end_spege() {
    spool_insert_end(sd=55.2, holes=false);
}

module spool_insert_extrudr_4() {
    union() {
        spool_insert(sd=53, h=67, id=c_id, holes=false, disk=false);

        difference() {
            tube(61.4, 4, 5.9, $fn=80);

            translate([0, 0, 1.6])
            cylinder(d=58.4, h=10, $fn=80);
        }
        
        difference() {
            translate([0, 7/2 + 58.5/2, 8/2])
            cube([8, 7, 8], center=true);

            translate([0, 0, 10/2 + 5])
            cube([1.8, 80, 10], center=true);
       }
    }
}

module spool_insert_end_extrudr_4() {
    spool_insert_end(sd=53, holes=false);
}