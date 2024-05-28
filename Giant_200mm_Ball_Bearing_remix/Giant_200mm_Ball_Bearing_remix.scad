include <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Giant 200mm Ball Bearing/"
);



//_orig_bearing();
//debug();
_ball();

//bearing_housing();
//balls();

//soluble_blocks();
//support_blocks();


module _orig_bearing() {
    translate([-128, -128, 0])
    import(
        str(spath, "Giant Bearing 200mm.stl"),
        convexity=10
    );

    // for positioning
    //%cylinder(d=200, h=60, $fn=100);
    //%cylinder(d=129.8, h=60, $fn=200);
    //%tube(200, 60, 13.15, $fn=200);
}

module debug() {
    intersection() {
        union() {
            bearing_housing();

            balls();

            color("lightgrey")
            soluble_blocks();

            support_blocks();
        }
        cube([100, 100, 100]);
    }
    // positionin aids
//    %translate([76, 0, 24.1])
//    sphere(d=36.4, $fn=100);

//    %translate([75.9, 0, 5.5])
//    cylinder(d=30, h=5);

}

module _ball() {
    // save as _ball.stl
    intersection() {
        _orig_bearing();

        translate([75.9, 0, 24.1])
        sphere(d=36.4, $fn=100);

    }
}

module bearing_housing() {
    difference() {
        _orig_bearing();

        for(i = [0:12]) {
            rotate([0, 0, i*360/13])
            translate([75.9, 0, 24.1])
            sphere(d=36.4, $fn=100);
        }
    }
}

module balls() {
    for(i = [0:12]) {
        rotate([0, 0, i*360/13])
        import(
            "_ball.stl", convexity=10
        );
    }
}

module _balls() {
    import(
        "balls.stl", convexity=10
    );
}

module _support_cross() {
    translate([0, 0, 7/2])
    union() {
        cube([1, 6, 7], center=true);
        cube([6, 1, 7], center=true);        
    }
}

module _support_crosses() {
    for(i = [0:12]) {
        rotate([0, 0, i*360/13])
        translate([75.9, 0, 0])

        _support_cross();
    }
}

module soluble_blocks(extra=false) {
    difference() {
        union() {
            for(i = [0:12]) {
                rotate([0, 0, i*360/13])
                translate([75.9, 0, 5.5])
                cylinder(d=26, h=5);
            }
        }

        if (extra) {
            _support_crosses();
        }

        cylinder(d=129.8, h=60, $fn=200);
        tube(200, 60, 13.15, $fn=200);
        _balls();
    }
}

module support_blocks(extra=false) {
    module _block() {
        difference() {
            union() {
                cylinder(d=26, h=5.5);
                cylinder(d=28, h=0.25);

                if (extra) {
                    _support_cross();
                }
            }

            difference() {
                translate([0, 0, -1])
                cylinder(d=24, h=6);

                translate([-10.4, 0, 0])
                cube([1, 30, 10], center=true);

                translate([-10.4, 0, 0])
                cube([3, 30, 0.5], center=true);

                translate([-6.5, 0, 0])
                cube([0.8, 30, 10], center=true);

                translate([-2.4, 0, 0])
                cube([0.8, 30, 10], center=true);
                
                translate([2, 0, 0])
                cube([0.8, 30, 10], center=true);

                translate([6.1, 0, 0])
                cube([0.8, 30, 10], center=true);

                translate([10, 0, 0])
                cube([1, 30, 10], center=true);

                translate([10, 0, 0])
                cube([3, 30, 0.5], center=true);

            }
        }
    }

    difference() {

        for(i = [0:12]) {
            rotate([0, 0, i*360/13])
            translate([75.9, 0, 0])
            _block();
        }

        translate([0, 0, -1])
        cylinder(d=130.8, h=60, $fn=200);

        translate([0, 0, -1])
        tube(200, 60, 13.65, $fn=200);

        if (extra) {
            translate([0, 0, -0.1])
            _balls();
        }
    }
}