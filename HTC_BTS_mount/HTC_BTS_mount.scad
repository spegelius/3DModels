use <../Dollo/NEW_long_ties/include.scad>;

BTS_h = 84;

BTS_mount_w = 53;
BTS_mount_d = 50;
BTS_mount_h = 64;

BTS_2_w = 68.5;
BTS_2_d = 63.5;
BTS_2_h = 78;

axle_l = 35;

//_mock_BTS();
//_mock_BTS_2_0();
//_thread(5);

//screw();
//mount_axle();
//bts_mount();
//bts_mount_2_0();
wall_mount();

//debug();
//debug_2_0();

module _mock_BTS_body() {

    union() {
        intersection() {
            rounded_cube(BTS_h,BTS_h,BTS_h,13,center=true,$fn=50);

            translate([0,-BTS_h/2,0])
            cube([100,61.5*2,100],center=true);
        }
        translate([0,-BTS_h/2+61.5-26,-BTS_h/2])
        rounded_cube_side(53.5,46.5,4,12.5,center=true);
    }
}

module _mock_BTS() {

    color("darkgrey")
    difference() {
        _mock_BTS_body();

        translate([0,-BTS_h/2,-BTS_h/2+47])
        rotate([90,0,0])
        cylinder(d=6,h=14,center=true,$fn=30);
        
        translate([0,-BTS_h/2+61.5-26,-BTS_h/2])
        cylinder(d=6,h=14,center=true,$fn=30);
        
        translate([0,-BTS_h/2+3.9,-84/2+12+13.5])
        rotate([90,0,0])
        hull() {
            translate([-(58-13.5)/2,0,0])
            cylinder(d=13.5,h=4,$fn=30);

            translate([(58-13.5)/2,0,0])
            cylinder(d=13.5,h=4,$fn=30);
        }
    }
}


module _mock_BTS_2_0() {
    h = BTS_2_h;
    
    module _form() {
        intersection() {
            hull() {
                translate([0,-BTS_2_d/2+1/2,0])
                cube([BTS_2_w,1,h], center=true);

                translate([0,BTS_2_d/2-1/2,0])
                cube([BTS_2_w+10,1,h], center=true);
            }
            translate([0,-95/2+BTS_2_d/2,0])
            cylinder(d=95,h=h,center=true,$fn=80);
        }
    }

    color("darkgrey")
    difference() {
        union() {
            _form();
            
            translate([0,0,-h/2-1.5])
            linear_extrude(1.5)
            offset(delta=-1.8)
            projection(cut=true)
            _form();
        }

        // top
        translate([0,0,h/2+3.8])
        rotate([2,0,0])
        cube([100,100,10],center=true);

        // back screw hole
        translate([0,-BTS_2_d/2,-h/2+50.5])
        rotate([90,0,0])
        cylinder(d=6,h=14,center=true,$fn=30);

        // bottom screw hole
        translate([0,-BTS_2_d/2+17.5,-h/2])
        cylinder(d=6,h=14,center=true,$fn=30);

        // power cord hole
        translate([-BTS_2_w/2+14+8/2,-BTS_2_d/2,-h/2+23+8/2])
        rotate([90,0,0])
        cylinder(d=8,h=10,center=true,$fn=30);

       // usb hole
       translate([0,-BTS_2_d/2,-h/2+23+8/2])
       cube([12,10,16],center=true);
    }
}

module _thread(h) {
    v_screw(h=h, screw_d=6.1-0.1, pitch=1.27, direction=0, steps=70,depth=0.3);
}

module screw() {
    d = 18;
    notches = 16;
    intersection() {
        difference() {
            union() {
                rounded_cylinder(d,4,1,$fn=30);
                cylinder(d=6,h=4+5,$fn=30);
                translate([0,0,4+5])
                _thread(6.5);
            }
            for(i=[0:notches-1]) {
                rotate([0,0,360/notches*i])
                translate([d/2,0,0])
                cylinder(d=2,h=6,$fn=20);
            }
            cylinder(d=0.1,h=20,$fn=10);
        }
        cylinder(d1=2*17.5,d2=0,h=17.5,$fn=30);
    }
}

module bts_mount() {

    difference() {
        union() {
            // bottom
            hull() {
                translate([0,35.5,0])
                cylinder(d=12,h=5,$fn=40);

                translate([0,-5/2,5/2])
                cube([50,5,5],center=true);
            }
            // back
            hull() {
                translate([0,-5/2,5/2])
                cube([50,5,5],center=true);

                translate([-48/2,0,31])
                rotate([90,0,0])
                cylinder(d=20,h=5,$fn=40);

                translate([48/2,0,30])
                rotate([90,0,0])
                cylinder(d=20,h=5,$fn=40);

                translate([0,0,51.5])
                rotate([90,0,0])
                cylinder(d=12,h=5,$fn=40);
            }
            // mount arm
            hull() {
                translate([0,-5/2,20/2])
                cube([10,5,20],center=true);

                translate([0,-20/2-6,20/2])
                rotate([0,90,0])
                cylinder(d=20,h=10,center=true,$fn=40);
            }
        }
        // back hole
        translate([0,1,30.5])
        rotate([90,0,0])
        difference() {
            hull() {
                translate([-(58-13.5)/2,0,0])
                cylinder(d=13.5,h=14,$fn=30);

                translate([(58-13.5)/2,0,0])
                cylinder(d=13.5,h=14,$fn=30);
                
                translate([0,16,14/2])
                cube([19,1,14],center=true);
            }
            translate([0,16+15/2+3,14/2])
            rotate([-45])
            cube([60,15,60],center=true);
        }

        // mount holes
        translate([0,35.5,-1])
        cylinder(d=6.3,h=10,$fn=40);

        translate([0,1,52])
        rotate([90,0,0])
        cylinder(d=6.3,h=10,$fn=40);

        translate([0,-20/2-6,20/2])
        rotate([0,90,0])
        cylinder(d=4.4,h=20,center=true,$fn=40);
    }
}

module bts_mount_2_0() {

    difference() {
        union() {
            // bottom
            hull() {
                translate([0,17.5,0])
                cylinder(d=12,h=5,$fn=40);

                translate([0,-5/2,5/2])
                cube([40,5,5],center=true);
            }
            // back
            hull() {
                translate([0,-5/2,5/2])
                cube([40,5,5],center=true);

                translate([-38/2,0,33.5])
                rotate([90,0,0])
                cylinder(d=18,h=5,$fn=40);

                translate([38/2,0,33.5])
                rotate([90,0,0])
                cylinder(d=18,h=5,$fn=40);

                translate([0,0,57])
                rotate([90,0,0])
                cylinder(d=12,h=5,$fn=40);
            }
            // mount arm
            hull() {
                translate([0,-5/2,20/2])
                cube([10,5,20],center=true);

                translate([0,-20/2-6,20/2])
                rotate([0,90,0])
                cylinder(d=20,h=10,center=true,$fn=40);
            }
        }
        // back hole
        translate([0,2,33.5])
        rotate([90,0,0])
        difference() {
            hull() {
                translate([-(47-12.5)/2,0,0])
                cylinder(d=12.5,h=14,$fn=30);

                translate([(47-12.5)/2,0,0])
                cylinder(d=12.5,h=14,$fn=30);
                
                translate([0,16,14/2])
                cube([18,0.1,14],center=true);

                translate([0,-12,14/2])
                cube([28,0.1,14],center=true);
            }
            translate([0,16+15/2+1,14/2])
            rotate([-45])
            cube([60,15,60],center=true);
        }

        // mount holes
        translate([0,17.5,-1])
        cylinder(d=6.3,h=10,$fn=40);

        translate([0,1,57])
        rotate([90,0,0])
        cylinder(d=6.3,h=10,$fn=40);

        translate([0,-20/2-6,20/2])
        rotate([0,90,0])
        cylinder(d=4.4,h=20,center=true,$fn=40);
    }
}


module mount_axle() {
    difference() {
        union() {
            translate([0,axle_l/2-12/2,0])
            sphere(d=12,$fn=50);
            hull() {
                translate([0,axle_l/2-12,0])
                sphere(d=12,$fn=50);
                translate([0,-axle_l/2+12/2,0])
                sphere(d=12,$fn=50);
            }
            hull() {
                translate([0,0,13])
                rotate([0,90,0])
                cylinder(d=20,h=22,center=true,$fn=40);

                rotate([90,0,0])
                cylinder(d=12,h=20,center=true,$fn=40);
            }
        }
        translate([0,0,13])
        rotate([0,90,0]) {
            cylinder(d=22,h=10.3,center=true,$fn=40);
            cylinder(d=4.4,h=25,center=true,$fn=40);
        }

        translate([0,0,-10/2-12/2+1])
        cube([100,100,10],center=true);
        
        translate([22/2-3,0,13])
        rotate([0,90,0])
        M4_nut(cone=false);

        translate([-22/2+3,0,13])
        rotate([0,-90,0])
        cylinder(d=9,h=4,$fn=40);
    }
}

module wall_mount() {
    w_l = axle_l + 20;
    difference() {
        union() {
            intersection() {
                hull() {
                    translate([0,w_l/2-15/2,0])
                    rounded_cube(40,15,8,6,center=true,$fn=40);

                    translate([0,-w_l/2+10/2,0])
                    rounded_cube(22,10,8,6,center=true,$fn=40);

                }
                translate([0,0,10/2])
                cube([100,100,10],center=true);
            }
            translate([0,axle_l/2-2,18/2])
            hull() {
                rotate([90,0,0])
                cylinder(d=17,h=8,center=true,$fn=40);

                translate([0,15/2-8/2,1-18/2])
                cube([19,15,1],center=true);
            }

            translate([0,-axle_l/2+3,18/2])
            hull() {
                rotate([90,0,0])
                cylinder(d=17,h=8,center=true,$fn=40);

                translate([0,-15/2+8/2,1-18/2])
                cube([19,15,1],center=true);
            }
        }
        translate([0,0,4+12.2/2])
        hull() {
            translate([0,axle_l/2-12.2/2,0])
            sphere(d=12.2,$fn=50);
            translate([0,-axle_l/2+12.2/2,0])
            sphere(d=12,$fn=50);
        }

        hull() {
            translate([0,-axle_l/2+11/2,4+12.2/2])
            sphere(d=11,$fn=50);

            translate([0,-axle_l/2+14/2,4+12.2/2+10])
            sphere(d=13,$fn=50);
        }

        translate([0,-axle_l/2,4+20/2+1])
        cube([5,10,20],center=true);

        // screw holes
        translate([40/2-6.2,w_l/2-7,2]) {
            cylinder(d=4,h=10,center=true,$fn=30);
            cylinder(d1=4,d2=8.2,h=2,$fn=30);
        }

        translate([-40/2+6.2,w_l/2-7,2]) {
            cylinder(d=4,h=10,center=true,$fn=30);
            cylinder(d1=4,d2=8.2,h=2,$fn=30);
        }

        translate([0,-w_l/2+7,2]) {
            cylinder(d=4,h=10,center=true,$fn=30);
            cylinder(d1=4,d2=8.2,h=2,$fn=30);
            
            translate([0,0,1.99])
            cylinder(d=8.2,h=20,$fn=30);
        }
    }
//    %translate([0,0,4+12/2])
//    mount_axle();
}


module debug() {
    translate([0, BTS_h/2, BTS_h/2+5])
    _mock_BTS();
    
    %bts_mount();
    
    translate([0,-29,20/2])
    rotate([90,0,180])
    mount_axle();

    translate([0,-39,20/2])
    rotate([90,0,180])
    wall_mount();
}

module debug_2_0() {
    translate([0, BTS_2_d/2, BTS_2_h/2+5+1.5])
    _mock_BTS_2_0();
    
    bts_mount_2_0();
    
    translate([0,-29,20/2])
    rotate([90,0,180])
    mount_axle();

    translate([0,-39,20/2])
    rotate([90,0,180])
    wall_mount();
}

