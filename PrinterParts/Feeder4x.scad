use <../Dollo/NEW_long_ties/include.scad>;
use <../_downloaded/ISOThreads/uploads_6f_12_f1_10_d2_ISOThread.scad>;
use <../lib/fittings.scad>;

//ProFeeder();

////// VARIABLES //////
dia = 250;
tube_d = 2.3;
fitting_d = 5;
fitting_h = 6;

// set true for final render
render_threads = true;
//render_threads = false;

// tube smoothness, higher value is smoother
//tube_smooth = 400;
tube_smooth = 200;

function tube_angle(d, h) = asin(h/(d/2));

////// VIEW DEV //////
//tube(straight=10);
//junction1();
//junction1(d=200,h=32,fittings=true);
//tubex4();
//tubex6();
//tubex8();
//tubes4x_M6_M6();
//tubes4x_M10_M6();
//tubes4x_collet_M6();
//tubes6x_M6_M6();
//tubes6x_M10_M6();
//tubes6x_collet_M6();
//tubes8x_M6_M6();
//tubes8x_M10_M6();
//tubes8x_collet_M6();

//debug_PTFE_cutting_jig();

////// VIEW PRINT //////
//hole_test();
//feeder4x_M6_M6();
//feeder4x_M10_M6();
feeder4x_collet_M6();

//feeder6x_M6_M6();
//feeder6x_M10_M6();
//feeder6x_collet_M6();

//feeder8x_M6_M6();
//feeder8x_M10_M6();
//feeder8x_collet_M6();

//PTFE_2x_tubes_M4();
//PTFE_2x_cover_1();
//PTFE_2x_cover_2();
//PTFE_cutting_jig();


////// MODULES //////

module ProFeeder() {
    import("../_downloaded/ProFeeder/Dual_Feeder_[3D_Print.stl",
           convexity=10);
}

module PTFE_tube() {
    tube(d=150, td=4.4, h=30, straight=10, fitting=false, nut=false);
}

module PTFE_2x_tubes_M4() {
    union() {
        cylinder(d=4.3,h=4,$fn=tube_smooth);
        translate([0,0,4]) {
            PTFE_tube();
            mirror([1,0,0])
            PTFE_tube();
        }
        translate([0,0,1])
        scale([1.01,1.01,1.01])
        M4_nut(cone=false);
        
        // nuts
        translate([0,0,4]) {
            _tube_translate(150, 20, straight=5)
            rotate([0,0,30])
            scale([1.01,1.01,1.01])
            M4_nut(cone=false);

            mirror([1,0,0])
            _tube_translate(150, 20, straight=5)
            rotate([0,0,30])
            scale([1.01,1.01,1.01])
            M4_nut(cone=false);
        }
        
        // end caps
        translate([0,0,4]) {
            _tube_translate(150, 20, straight=9.5)
            cylinder(d=20,h=5);

            mirror([1,0,0])
            _tube_translate(150, 20, straight=9.5)
            cylinder(d=20,h=5);
        }
    }
}

module _PTFE_2x_cover() {
    difference() {
        intersection() {
            hull() {
                rotate([0,0,-8])
                translate([0,35/2,12/2])
                cube([12,35,12],center=true);

                rotate([0,0,8])
                translate([0,35/2,12/2])
                cube([12,35,12],center=true);
                
                translate([6,15,0])
                rotate([0,0,30])
                cylinder(d=8,h=12/2,$fn=6);

                translate([-6,15,0])
                rotate([0,0,30])
                cylinder(d=8,h=12/2,$fn=6);

            }
            translate([0,38/2,0])
            cube([30,38,12],center=true);
        }
        translate([0,0,12/2])
        rotate([-90,0,0])
        PTFE_2x_tubes_M4();
    }
}

module PTFE_2x_cover_1() {
    difference() {
        _PTFE_2x_cover();
        
        translate([6,15,0]) {
            rotate([0,0,30])
            M3_nut(cone=false, bridging=true);
            cylinder(d=3.3,h=10,$fn=40);
        }
        translate([-6,15,0]) {
            rotate([0,0,30])
            M3_nut(cone=false, bridging=true);
            cylinder(d=3.3,h=10,$fn=40);
        }
    }
}

module PTFE_2x_cover_2() {
    difference() {
        _PTFE_2x_cover();
        
        translate([6,15,0]) {
            cylinder(d=3.3,h=10,$fn=40);
            cylinder(d1=5.9,d2=3.3,h=1.3,$fn=40);
        }

        translate([-6,15,0]) {
            cylinder(d=3.3,h=10,$fn=40);
            cylinder(d1=5.9,d2=3.3,h=1.3,$fn=40);
        }
    }
}

module PTFE_cutting_jig() {
    difference() {
        translate([-2,0,28/2])
        cube([15,10,28],center=true);

        translate([0,-1.5,5])
        PTFE_tube();
        
        translate([0,-1,25/2+4.5])
        cube([0.5,10,25],center=true);
    }
}

module mock_fitting_M6() {
    union() {
        cylinder(d=6,h=5,$fn=30);

        translate([0,0,5])
        cylinder(d=11.55,h=fitting_h,$fn=6);
    }
}

module _tube_translate(d, h, straight=0) {
    angle = tube_angle(d, h);

    translate([-d/2,0,0])
    rotate([0,-angle,0])
    translate([d/2,0,straight])
    children();
}

module tube(d=dia,
            td=tube_d,
            h=60,
            straight=0,
            fitting=true,
            nut=false) {
    c_h = h - straight;
    angle = tube_angle(d, c_h);
    union() {
        rotate([90,0,0])
        translate([-d/2,0,0])
        rotate([0,0,(angle+0.1)/2])
        donut(d,td,angle=angle+0.1,$fn=tube_smooth);

        if (straight > 0) {
            _tube_translate(d, c_h)
            cylinder(d=td,h=straight+0.1,$fn=tube_smooth);
        }

        if (fitting) {
            _tube_translate(d, c_h, straight)
            _fitting();
        } else if (nut) {
            _tube_translate(d, c_h, straight)
            rotate([0,0,30])
            M4_nut(cone=false);
        }
    }
}

module _fitting() {
    union() {
        cylinder(d1=tube_d, d2=3.3,h=3, $fn=40);
        translate([0,0,2.99]) {
            if (render_threads) {
                fitting_thread_M6(fitting_h);
            } else {
                cylinder(d=6,h=fitting_h,$fn=30);
            }
            //%translate([0,0,3]) mock_fitting_M6();
        }
        translate([0,0,fitting_h+2.98])
        cylinder(d=20,h=5, $fn=20);
    }
}

module junction1(d=dia, h=60, fittings=false) {
    angle = tube_angle(d, h);
    union() {
        tube(d=d, h=h, fitting=fittings);

        rotate([0,0,180])
        tube(d=d, h=h, fitting=fittings);
    }
}

module junction2(d=dia, h=60, fittings=false) {
    angle = tube_angle(d, h);
    union() {
        rotate([0,0,180])
        tube(h=h,fitting=fittings);

        cylinder(d=tube_d, h=h,$fn=tube_smooth);

        if (fittings) {
            translate([0,0,h])
            _fitting();
        }
    }
}

h1 = fitting_h + 5;
h2 = 16;
h3_4x = 30;

module tubex4() {

    angle1 = tube_angle(dia, h2-0.1);

    // first junction
    rotate([0,0,90])
    translate([0,0,h1])
    junction1(h=h2);

    // second junction
    translate([0,-dia/2,h1])
    rotate([angle1,0,0])
    translate([0,dia/2,0])
    junction1(h=h3_4x, fittings=true);

    // second junction
    translate([0,dia/2,h1])
    rotate([-angle1,0,0])
    translate([0,-dia/2,0])
    junction1(h=h3_4x, fittings=true);
}

module tubex6() {
    angle1 = tube_angle(dia, 11);
    
    h = 55;
    module 3x_tube() {
        union() {
            cylinder(d=tube_d,h=h+0.1,$fn=tube_smooth);

            translate([0,0,h])
            _fitting();

            translate([0,0,h-45])
            tube(d=250,h=44);

            translate([0,0,h-56])
            rotate([0,0,180])
            tube(d=250,h=55.5,straight=27);
        }
    }
    
    // first junction
    rotate([0,0,90])
    translate([0,0,h1])
    junction1(h=11);
    
    translate([0,-dia/2,h1])
    rotate([angle1,0,0])
    translate([0,dia/2,0]) {
        3x_tube();
    }

    // second junction
    translate([0,dia/2,h1])
    rotate([-angle1,0,0])
    translate([0,-dia/2,0]) {
        3x_tube();
    }
    
}

h3_8x = 16;
h4_8x = 44;

module tubex8() {

    angle1 = tube_angle(dia, h2-0.1);
    angle2 = tube_angle(dia, h3_8x-0.1);

    rotation = 50;

    // first junction
    rotate([0,0,90])
    translate([0,0,h1])
    junction1(h=h2);

    // second junction
    translate([0,-dia/2,h1])
    rotate([angle1,0,0])
    translate([0,dia/2,0]) {
        junction1(h=h3_8x);

        translate([dia/2,0,0])
        rotate([0,angle2,0])
        translate([-dia/2,0,0])
        rotate([0,0,45])
        junction2(h=h4_8x, fittings=true);

        translate([-dia/2,0,0])
        rotate([0,-angle2,0])
        translate([dia/2,0,0])
        rotate([0,-1,50])
        junction2(h=h4_8x, fittings=true);
    }

    // second junction
    translate([0,dia/2,h1])
    rotate([-angle1,0,0])
    translate([0,-dia/2,0]) {
        junction1(h=h3_8x);

        translate([dia/2,0,0])
        rotate([0,angle2,0])
        translate([-dia/2,0,0])
        rotate([-0.8,-2,126])
        junction2(h=h4_8x, fittings=true);

        translate([-dia/2,0,0])
        rotate([0,-angle2,0])
        translate([dia/2,0,0])
        rotate([0,0,230])
        junction2(h=h4_8x, fittings=true);
    }
}

module _push_fitting_M6() {
    if (render_threads) {
        fitting_thread_M6(fitting_h);
    } else {
        cylinder(d=6,h=fitting_h,$fn=40);
    }
    translate([0,0,fitting_h + .2])
    cylinder(d=tube_d, h=h1-5.2, $fn=40);
}

module tubes4x_M6_M6() {
    union() {
        _push_fitting_M6();
        tubex4();
    }
}

module tubes6x_M6_M6() {
    union() {
        _push_fitting_M6();
        tubex6();
    }
}

module tubes8x_M6_M6() {
    union() {
        if (render_threads) {
            fitting_thread_M6(fitting_h);
        } else {
            cylinder(d=6,h=fitting_h,$fn=40);
        }
        translate([0,0,fitting_h + .2])
        cylinder(d=tube_d, h=h1-5.2, $fn=40);

        tubex8();
    }
}

module _push_fitting_M10() {
    if (render_threads) {
        fitting_thread_M10(fitting_h);
    } else {
        cylinder(d=10,h=fitting_h,$fn=40);
    }
    translate([0,0,fitting_h + .2])
    cylinder(d=4.2, h=3, $fn=40);

    translate([0,0,fitting_h + 3 + .4])
    cylinder(d=tube_d, h=h1-(3.2 + 5.2), $fn=40);
}

module tubes4x_M10_M6() {
    union() {
        _push_fitting_M10();
        tubex4();
    }
}

module tubes6x_M10_M6() {
    union() {
        _push_fitting_M10();
        tubex6();
    }
}

module tubes8x_M10_M6() {
    union() {
        _push_fitting_M10();
        tubex8();
    }
}

module _collet() {
    cylinder(d=7.5, h=3.5, $fn=30);

    translate([0,0,1])
    donut(6.8,1,$fn=20);

    translate([0,0,3.5])
    cylinder(d1=7.5, d2=4.1, h=2, $fn=30);

    translate([0,0,7/2])
    cube([30,1,7], center=true);

    translate([0,0,5.5])
    cylinder(d=4.1, h=3, $fn=30);

    translate([0,0,8.7])
    cylinder(d=tube_d, h=h1-8.7, $fn=40);
}

module tubes4x_collet_M6() {
    difference() {
        union() {
            _collet();
            tubex4();
        }
    }
}

module tubes6x_collet_M6() {
    difference() {
        union() {
            _collet();
            tubex6();
        }
    }
}

module tubes8x_collet_M6() {
    difference() {
        union() {
            _collet();
            tubex8();
        }
    }
}

module _feeder4x_body() {
    cylinder(d1=15,d2=25,h=h1+h2+h3_4x + fitting_h+3.5);
}

module _feeder6x_body() {
    hull() {
        cylinder(d=15,h=1);

        translate([-4.8,0,87])
        cylinder(d=25,h=0.1);

        translate([5,0,87])
        cylinder(d=25,h=0.1);
    }
}

module _feeder8x_body() {
    h = h1+h2+h3_8x+h4_8x + fitting_h+4;
    hull() {
        cylinder(d=15,h=1);

        translate([15,-2,h])
        cylinder(d=10,h=0.1);

        translate([8,-9,h])
        cylinder(d=10,h=0.1);

        translate([-7.8,-9.8,h])
        cylinder(d=10,h=0.1);

        translate([-14,1,h])
        cylinder(d=10,h=0.1);

        translate([-7.5,9,h])
        cylinder(d=10,h=0.1);

        translate([2,16.2,h])
        cylinder(d=10,h=0.1);
    }
}

module _collet_body() {
    module ear() {
        rotate([90,0,0]) intersection() {
            cylinder(d=8,h=10, $fn=30);

            translate([0,1,8/2])
            cube([8,8,10],center=true);
        }
    }

    union() {
        translate([8,8/2,3])
        ear();

        translate([-8,8/2,3])
        ear();
    }
}

module _collet_holes() {
    translate([8,30/2,3])
    rotate([90,0,0])
    cylinder(d=3.2, h=30,$fn=30);

    translate([-8,30/2,3])
    rotate([90,0,0])
    cylinder(d=3.2, h=30,$fn=30);

    translate([8,8,3])
    rotate([90,0,0])
    cylinder(d=6, h=4,$fn=30);

    translate([-8,8,3])
    rotate([90,0,0])
    cylinder(d=6, h=4,$fn=30);

    translate([8,-4,3])
    rotate([90,30,0])
    M3_nut();

    translate([-8,-4,3])
    rotate([90,30,0])
    M3_nut();
}

module feeder4x_M6_M6() {

    difference() {
        _feeder4x_body();
        tubes4x_M6_M6();
    }
}

module feeder6x_M6_M6() {

    difference() {
        _feeder6x_body();
        tubes6x_M6_M6();
    }
}

module feeder8x_M6_M6() {

    difference() {
        _feeder8x_body();
        tubes8x_M6_M6();
    }
}

module feeder4x_M10_M6() {

    difference() {
        _feeder4x_body();
        tubes4x_M10_M6();
    }
}

module feeder6x_M10_M6() {

    difference() {
        _feeder6x_body();
        tubes6x_M10_M6();
    }
}

module feeder8x_M10_M6() {

    difference() {
        _feeder8x_body();
        tubes8x_M10_M6();
    }
}

module feeder4x_collet_M6() {
    difference() {
        union() {
            _feeder4x_body();
            _collet_body();
        }
        tubes4x_collet_M6();
        _collet_holes();
    }
}

module feeder6x_collet_M6() {
    difference() {
        union() {
            _feeder6x_body();
            _collet_body();
        }
        tubes6x_collet_M6();
        _collet_holes();
    }
}

module feeder8x_collet_M6() {
    difference() {
        union() {
            _feeder8x_body();
            _collet_body();
        }
        tubes8x_collet_M6();
        _collet_holes();
    }
}

module hole_test() {
    $fn=50;
    difference() {
        cube([30,20,10]);

        translate([5,5,0])
        cylinder(d=2.1,h=21,$fn=40);

        translate([1.2,0.4,3])
        rotate([90,0,0])
        linear_extrude(0.4)
        text("2.1", size=4);

        translate([15,5,0])
        cylinder(d=2.2,h=21,$fn=40);

        translate([11.2,0.4,3])
        rotate([90,0,0])
        linear_extrude(0.4)
        text("2.2", size=4);

        translate([25,5,0])
        cylinder(d=2.3,h=21,$fn=40);

        translate([21.2,0.4,3])
        rotate([90,0,0])
        linear_extrude(0.4)
        text("2.3", size=4);

        translate([5,15,0])
        cylinder(d=2.4,h=21,$fn=40);

        translate([8.2,20-0.4,3])
        rotate([90,0,180])
        linear_extrude(0.4)
        text("2.4", size=4);

        translate([15,15,0])
        cylinder(d=2.5,h=21,$fn=40);

        translate([18.2,20-0.4,3])
        rotate([90,0,180])
        linear_extrude(0.4)
        text("2.5", size=4);

        translate([25,15,0])
        cylinder(d=2.6,h=21,$fn=40);

        translate([28.2,20-0.4,3])
        rotate([90,0,180])
        linear_extrude(0.4)
        text("2.6", size=4);
    }
}

module debug_PTFE_cutting_jig() {
    intersection() {
        PTFE_cutting_jig();

        translate([0,20/2,0])
        cube([40,20,80],center=true);
    }
}
