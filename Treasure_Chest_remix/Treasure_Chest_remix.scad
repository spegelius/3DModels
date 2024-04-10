use <../Dollo/NEW_long_ties/include.scad>;

stl_path = "../_downloaded/";
tc_path = str(
    stl_path,
    "TREASURE CHEST/"
);


//_chest();
//_closing();
//_cove();
//_frame();
//_hinge_frame();
//_hinge_frame_bottom();
//_hinge_frame_top();
//_lid();
//_side();

//assembly();

//debug_chest();
//debug_hinge_frame();

//new_chest();
//new_closing();
new_hinge_frame_inserts();
//new_side();


module _chest() {
    import(str(tc_path, "Chest.stl"), convexity=10);
}

module _closing() {
    translate([0, 50, 0])
    import(str(tc_path, "Closing.stl"), convexity=10);
}

module _cove() {
    import(str(tc_path, "Cove.stl"), convexity=10);
}

module _frame() {
    import(str(tc_path, "Frame.stl"), convexity=10);
}

module _hinge_frame() {
    import(str(tc_path, "Hinge_Frame.stl"), convexity=10);
}

module _hinge_frame_bottom() {
    intersection() {
        import(
            str(tc_path, "Hinge_Frame.stl"),
            convexity=10
        );

        translate([110/2, 110/2 - 25, 50])
        cube([110, 110, 40], center=true);
    }
}

module _hinge_frame_top() {
    translate([0, 163, 104.5])
    rotate([180, 0, 0])
    intersection() {
        import(
            str(tc_path, "Hinge_Frame.stl"),
            convexity=10
        );

        translate([110/2, 110/2 + 77, 50])
        cube([110, 110, 40], center=true);
    }
}

module _lid() {
    import(str(tc_path, "Lid.stl"), convexity=10);
}

module _side() {
    translate([-0.3, 0, 0])
    import(str(tc_path, "Side.stl"), convexity=10);
}

module assembly() {
    //_chest();
    //_closing();

    intersection() {
        _cove();

        translate([80/2 + 5, 80, 200/2])
        cube([80, 200, 200], center=true);
    }

    intersection() {
        _frame();

//        translate([80/2 + 10, 80, 200/2])
//        cube([80, 200, 200], center=true);

        translate([100/2, 130, 200/2])
        cube([100, 200, 200], center=true);
    }

    //_hinge_frame();
    _hinge_frame_bottom();

    intersection() {
        _hinge_frame_top();

        translate([90/2 + 5, 80, 200/2])
        cube([90, 200, 200], center=true);
    }

    _lid();

//    _side();

//    rotate([0, -90, 0])
//    translate([65, 30, -6.33])
//    new_side();

    translate([100, 60, 0])
    rotate([0, -90, 180])
    translate([65, 30, -6.33])
    new_side();

    new_chest();

    rotate([90, 0, 0])
    translate([50, 49.5, 20])
    new_closing();
}

module debug_chest() {
    intersection() {
        new_chest();

//        translate([50, 0, 0])
//        cube([50, 200, 200], center=true);
    }
}

module debug_hinge_frame() {
    intersection() {
        new_hinge_frame_inserts();

//        translate([50, 0, 0])
//        cube([7, 200, 200], center=true);
    }
}

module new_chest() {
    difference() {
        union() {
            _chest();

            intersection() {
                translate([5, 73.6, 67.64])
                rotate([0, 90, 0])
                cylinder(d=170, h=90, $fn=200);

                translate([0, 0, 45.7])
                cube([200, 100, 1], center=true);
            }

            intersection() {
                translate([5, -13.5965, 67.64])
                rotate([0, 90, 0])
                cylinder(d=170, h=90, $fn=200);

                translate([0, 50, 45.7])
                cube([200, 100, 1], center=true);
            }
        }

        union() {
            intersection() {
                translate([9, 73.6, 65])
                rotate([0, 90, 0])
                cylinder(d=161, h=82, $fn=200);

                translate([100/2, 0, 50/2 + 12])
                cube([100, 80, 50], center=true);
            }

            intersection() {
                translate([9, -13.6, 65])
                rotate([0, 90, 0])
                cylinder(d=161, h=82, $fn=200);

                translate([100/2, 70, 50/2 + 12])
                cube([100, 80, 50], center=true);
            }
        }
    }
}

module new_closing() {
    difference() {
        union() {
            scale([1.07, 1.12, 1.1])
            translate([-49.76, -50, -20])
            rotate([-90, 0, 0])
            _closing();

            translate([3, 0.5, -0.014])
            cube([1.2, 8, 4.502], center=true);

            translate([-3, 0.5, -0.014])
            cube([1.2, 8, 4.502], center=true);
        }

        translate([0, 10/2, 0])
        cube([1.5, 10, 15], center=true);
    }

    // positioning aid
    //%cube([9.4, 20, 5], center=true);
}

module new_side() {
    module _new_side() {
        scale([1.005, 1.005, 1])
        translate([-65, -30, 6.317])
        rotate([0, 90, 0])
        _side();
    }

    union() {
        _new_side();

        translate([-1.2, 0, 0])
        intersection() {
            _new_side();

            translate([-10, 0, 0])
            cube([4, 80, 6], center=true);
        }
    }
}

// inserts for the hinge frame.
// Due to OpenSCADS inability to merge the hinge frame
// and these inserts, the merging is done in 
// Prusaslicer:
// - printer profile needs to have multiple toolheads!
//   otherwise PS moves objects to origins separately
// - import Hinge_frame.stl and 
//   new_hinge_frame_inserts.stl together as one object
//   (answwer yes)
// - export the plate as new_hinge_frame.stl
// - reimport the new stl to the printer profile 
//   you'd like to use
module new_hinge_frame_inserts() {
    od = 10.2;
    oh = 8.1;
    wall = 1.7;

    union() {
        %_hinge_frame();

        translate([20.935, 81.438, 52.25])
        rotate([0, 90, 0])
        tube(od, oh, wall, $fn=40);

        translate([21.435, 80.938, 46.25])
        cube([oh - 1, 1, 2]);
        
        translate([45.935, 81.438, 52.25])
        rotate([0, 90, 0])
        tube(od, oh, wall, $fn=40);

        translate([46.435, 80.938, 46.25])
        cube([oh - 1, 1, 2]);

        translate([70.935, 81.438, 52.25])
        rotate([0, 90, 0])
        tube(od, oh, wall, $fn=40);

        translate([71.435, 80.938, 46.25])
        cube([oh - 1, 1, 2]);
    }

//    %translate([0, 81.438, 52.25])
//    rotate([0, 90, 0])
//    cylinder(d=6, h=100, $fn=40);
    
}
