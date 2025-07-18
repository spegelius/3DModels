use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Stackable Sieves/"
);


//%_orig_sieve_140();
//_sieve_hole_4_5mm();
//_sieve_hole_4_8mm();

//_sieve_hole_basic_4mm();

//debug_sieve_4_5mm();
//debug_sieve_4_8mm();


//sieve_4_5mm();
//sieve_4_8mm();

sieve_basic_4mm();


module _orig_sieve_140() {
    import(
        str(spath, "sieve_140mm.stl"),
        convexity=10
    );
}

module _sieve_hole_4_5mm() {

    rotate([90, 0, 0])
    union() {
        donut(6, 4.5, angle=100, $fn=40);

        rotate([-90, 0, 50])
        translate([6/2, 0, -0.01])
        cylinder(d=4.5, h=10, $fn=40);

        rotate([90, 0, -50])
        translate([6/2, 0, -0.01])
        cylinder(d=4.5, h=10, $fn=40);
    }
}

module _sieve_hole_4_8mm() {

    rotate([90, 0, 0])
    union() {
        donut(6, 4.8, angle=100, $fn=40);

        rotate([-90, 0, 50])
        translate([6/2, 0, -0.01])
        cylinder(d=4.8, h=15, $fn=40);

        rotate([90, 0, -50])
        translate([6/2, 0, -0.01])
        cylinder(d=4.8, h=15, $fn=40);
    }
}

module _sieve_hole_basic_4mm() {
    union() {
        cylinder(d=4, h=3, $fn=40);
        cylinder(d1=7, d2=3, h=2, center=true, $fn=40);

        translate([0, 0, 3])
        cylinder(d1=3, d2=7, h=2, center=true, $fn=40);
    }
}

module debug_sieve_4_5mm() {
    intersection() {
        sieve_4_5mm();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }
}

module debug_sieve_4_8mm() {
    intersection() {
        sieve_4_8mm();

        translate([0, 200/2, 0])
        cube([200, 200, 200], center=true);
    }
}

module _sieve_body() {
    difference() {
        union() {
            cylinder(d=140, h=48, $fn=120);

            translate([0, 0, 46.4])
            chamfered_cylinder(
                143.3, 20, (143.2 - 140)/2, $fn=120
            );
        }

        translate([0, 0, 60])
        cylinder(d=200, h=20);

        translate([0, 0, -1])
        cylinder(d=137.75, h=100, $fn=120);

        translate([0, 0, 50])
        cylinder(d=141, h=30, $fn=120);
    }
}

module sieve_4_5mm() {

    module _bottom() {
        translate([0, 0, 12/2])
        difference() {
            cylinder(d=139, h=12, center=true, $fn=80);

            for(i = [0:9]) {
                translate([0, 7/2 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([0, -7/2 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:9]) {
                translate([7, 0 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([7, 0 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:9]) {
                translate([-7, 0 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([-7, 0 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:8]) {
                translate([2*7, 7/2 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([2*7, -7/2 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:8]) {
                translate([-2*7, 7/2 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([-2*7, -7/2 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:8]) {
                translate([3*7, 0 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([3*7, 0 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:8]) {
                translate([-3*7, 0 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([-3*7, 0 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:8]) {
                translate([4*7, 7/2 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([4*7, -7/2 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:7]) {
                translate([-4*7, 7/2 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([-4*7, -7/2 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:7]) {
                translate([5*7, 0 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([5*7, 0 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:7]) {
                translate([-5*7, 0 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([-5*7, 0 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:6]) {
                translate([6*7, 7/2 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([6*7, -7/2 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:6]) {
                translate([-6*7, 7/2 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([-6*7, -7/2 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:6]) {
                translate([7*7, 0 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([7*7, 0 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:5]) {
                translate([-7*7, 0 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([-7*7, 0 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:4]) {
                translate([8*7, 7/2 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([8*7, -7/2 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:3]) {
                translate([-8*7, 7/2 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([-8*7, -7/2 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            for(i = [0:1]) {
                translate([9*7, 0 + i*7, 0])
                _sieve_hole_4_5mm();

                translate([9*7, 0 - i*7, 0])
                _sieve_hole_4_5mm();
            }

            translate([-9*7, 0, 0])
            _sieve_hole_4_5mm();

        }
    }

    union() {
        _bottom();
        _sieve_body();
    }
}

module sieve_4_8mm() {

    module _bottom() {
        step = 6.9;
        x_step = 7.6;

        translate([0, 0, 14/2])
        difference() {
            cylinder(d=139, h=14, center=true, $fn=80);

            for(i = [0:9]) {
                translate([0, step/2 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([0, -step/2 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:9]) {
                translate([x_step, 0 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([x_step, 0 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:9]) {
                translate([-x_step, 0 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([-x_step, 0 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:8]) {
                translate([2*x_step, 7/2 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([2*x_step, -7/2 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:8]) {
                translate([-2*x_step, 7/2 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([-2*x_step, -7/2 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:8]) {
                translate([3*x_step, 0 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([3*x_step, 0 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:8]) {
                translate([-3*x_step, 0 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([-3*x_step, 0 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:7]) {
                translate([4*x_step, step/2 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([4*x_step, -step/2 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:7]) {
                translate([-4*x_step, step/2 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([-4*x_step, -step/2 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:7]) {
                translate([5*x_step, 0 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([5*x_step, 0 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:7]) {
                translate([-5*x_step, 0 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([-5*x_step, 0 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:6]) {
                translate([6*x_step, step/2 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([6*x_step, -step/2 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:5]) {
                translate([-6*x_step, step/2 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([-6*x_step, -step/2 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:5]) {
                translate([7*x_step, 0 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([7*x_step, 0 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:4]) {
                translate([-7*x_step, 0 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([-7*x_step, 0 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:2]) {
                translate([8*x_step, step/2 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([8*x_step, -step/2 - i*step, 0])
                _sieve_hole_4_8mm();
            }

            for(i = [0:0]) {
                translate([-8*x_step, step/2 + i*step, 0])
                _sieve_hole_4_8mm();

                translate([-8*x_step, -step/2 - i*step, 0])
                _sieve_hole_4_8mm();
            }

        }
    }

    union() {
        _bottom();
        _sieve_body();
    }
}

module sieve_basic_4mm() {
    module _bottom() {
        step = 6.5;
        x_step = 6;

        difference() {
            cylinder(d=139, h=3, $fn=80);

            for(i = [0:9]) {
                translate([0, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([0, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:10]) {
                translate([x_step, 0 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([x_step, 0 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:10]) {
                translate([-x_step, 0 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([-x_step, 0 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:9]) {
                translate([2*x_step, 7/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([2*x_step, -7/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:9]) {
                translate([-2*x_step, 7/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([-2*x_step, -7/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:9]) {
                translate([3*x_step, 0 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([3*x_step, 0 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:9]) {
                translate([-3*x_step, 0 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([-3*x_step, 0 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:9]) {
                translate([4*x_step, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([4*x_step, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:9]) {
                translate([-4*x_step, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([-4*x_step, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:9]) {
                translate([5*x_step, 0 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([5*x_step, 0 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:9]) {
                translate([-5*x_step, 0 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([-5*x_step, 0 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:8]) {
                translate([6*x_step, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([6*x_step, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:8]) {
                translate([-6*x_step, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([-6*x_step, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:7]) {
                translate([7*x_step, 0 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([7*x_step, 0 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:7]) {
                translate([-7*x_step, 0 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([-7*x_step, 0 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:6]) {
                translate([8*x_step, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([8*x_step, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:6]) {
                translate([-8*x_step, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([-8*x_step, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:5]) {
                translate([9*x_step, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([9*x_step, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:5]) {
                translate([-9*x_step, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([-9*x_step, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:3]) {
                translate([10*x_step, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([10*x_step, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:3]) {
                translate([-10*x_step, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([-10*x_step, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:0]) {
                translate([11*x_step, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([11*x_step, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }

            for(i = [0:0]) {
                translate([-11*x_step, step/2 + i*step, 0])
                _sieve_hole_basic_4mm();

                translate([-11*x_step, -step/2 - i*step, 0])
                _sieve_hole_basic_4mm();
            }
        }
    }

    union() {
        _bottom();
        _sieve_body();
    }
}