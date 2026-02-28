use <../Dollo/NEW_long_ties/include.scad>;

stl_base_path = "../_downloaded/";
spath = str(
    stl_base_path, "Multitool third arm/"
);


//_orig_arm_1();

//debug_new_tool_support();

//new_arm_1();
//base_2_50mm();
new_tool_support();


module _orig_arm_1() {
    import(
        str(spath, "arm_1.stl"),
        convexity=10
    );
}

module _orig_base_2() {
    import(
        str(spath, "base_2.STL"),
        convexity=10
    );
}

module _orig_tool_support() {
    import(
        str(spath, "tool_support.STL"),
        convexity=10
    );
}

module debug_new_tool_support() {
    intersection() {
        new_tool_support();

        translate([0, 100/2, 0])
        cube([100, 100, 200], center=true);
    }
}

module new_arm_1() {
    module _supports() {

        hull() {
            translate([70.3, 15, -2])
            cylinder(d=1.8, h=0.1, $fn=10);

            translate([70.3, 11, -2])
            cylinder(d=1.9, h=0.1, $fn=10);

            translate([70.3, 11, -5])
            cylinder(d=1.5, h=0.1, $fn=10);
        }

        hull() {
            translate([64.7, 15, -2])
            cylinder(d=1.8, h=0.1, $fn=10);

            translate([64.7, 11, -2])
            cylinder(d=1.9, h=0.1, $fn=10);

            translate([64.7, 11, -5])
            cylinder(d=1.5, h=0.1, $fn=10);
        }

        hull() {
            translate([25.3, 15, -2])
            cylinder(d=1.8, h=0.1, $fn=10);

            translate([25.3, 11, -2])
            cylinder(d=1.9, h=0.1, $fn=10);

            translate([25.3, 11, -5])
            cylinder(d=1.5, h=0.1, $fn=10);
        }

        hull() {
            translate([19.7, 15, -2])
            cylinder(d=1.8, h=0.1, $fn=10);

            translate([19.7, 11, -2])
            cylinder(d=1.9, h=0.1, $fn=10);

            translate([19.7, 11, -5])
            cylinder(d=1.5, h=0.1, $fn=10);
        }
    
    }

    union() {
        rotate([90, 0, 90])
        _orig_arm_1();

        _supports();

        mirror([1, 0, 0])
        _supports();

        mirror([0, 0, 1])
        _supports();

        mirror([1, 0, 0])
        mirror([0, 0, 1])
        _supports();
    }
}

module base_2_50mm() {
//    %_orig_base_2();

//    %translate([0, 20/2 + 15, 100/2 + 30])
//    cube([200, 20, 100], center=true);

    %translate([0, 50/2 + 15, 100/2 + 30])
    cube([200, 50, 100], center=true);


    union() {
        intersection() {
            _orig_base_2();
            cube([200, 40, 200], center=true);
        }

        translate([0, 8, 0])
        intersection() {
            _orig_base_2();

            translate([0, 15.5, 0])
            cube([200, 9, 200], center=true);
        }

        translate([0, 17, 0])
        intersection() {
            _orig_base_2();

            translate([0, 15.5, 0])
            cube([200, 9, 200], center=true);
        }

        translate([0, 26, 0])
        intersection() {
            _orig_base_2();

            translate([0, 15.5, 0])
            cube([200, 9, 200], center=true);
        }

        translate([0, 31, 0])
        intersection() {
            _orig_base_2();

            translate([0, 15.5, 0])
            cube([200, 9, 200], center=true);
        }

        translate([0, 30, 0])
        intersection() {
            _orig_base_2();

            translate([0, 40, 0])
            cube([200, 40, 200], center=true);
        }
    }
}

module new_tool_support() {
    union() {
        translate([-20, 20, 0])
        rotate([90, 0, 0])
        _orig_tool_support();

        // bridge
        translate([0, 0, 2])
        cylinder(d=10, h=0.22);

        // bottom
        tube(9, 1.7, 1);
        tube(17, 1.7, 0.8);
        tube(25, 1.7, 0.8);

        for(i = [0:5]) {
            rotate([0, 0, 360/6*i])
            translate([8, 0, 1.7/2])
            cube([8, 0.8, 1.7], center=true);
        }

        // gear
        translate([0, 0, 5.3])
        tube(8.2, 0.7, 1, $fn=40);

        translate([0, 0, 5.3])
        tube(16, 0.7, 1, $fn=40);

        translate([0, 0, 5.3])
        tube(24.5, 1.3, 1, $fn=40);
    }
}
