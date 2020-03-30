
use <../lib/includes.scad>;
use <../ColorBlend/ColorBlend.scad>;


////// VARIABLES //////
view_text = "python";

// text is sliced in 0.2mm slices,
// for blending colors
sliced_text = false;
scaling = 0.6;
width = 116;
depth = 91;
height = 163;
rounding = 33;


////// VIEW //////
//_back_curve();
//stand_1();
//stand_1(with_brim=true, with_wall=true);
stand_text();



////// MODULES //////
module logo() {
    union() {
        import("../_downloaded/Python_Logo_Assembly/T-PythonBOTTOM-yellow.stl",
          convexity=10);
        import("../_downloaded/Python_Logo_Assembly/T-PythonTOP-blue.stl",
          convexity=10);
    }
}

module enlarged_logo() {
    translate([0,0,-6])
    linear_extrude(20.5)
    offset(0.2)
    projection()
    logo();
}

module _stand_form() {
    union() {
        difference() {
            intersection() {
                cube([width,depth,height+2]);

                translate([0,0,-2])
                rounded_cube(width,depth,height,rounding);
            }
            translate([-1,-20,0])
            rotate([-20,0,0])
            cube([width+2,20,50]);

            rotate([-20,0,0])
            translate([-0.5,-67,33])
            cube([width+1,depth,200]);

            translate([0,88,33])
            _back_curve();
        }
        translate([6, 49,50])
        rotate([20,0,0])
        cylinder(d=12, h=14, $fn=60);

        translate([width-6, 49,50])
        rotate([20,0,0])
        cylinder(d=12, h=14, $fn=60);

        translate([2.4,10,5])
        intersection() {
            slice(false);

            translate([0,-7,0])
            rotate([-20,0,0])
            cube([70,3,40]);
        }
    }
}

module stand_brim() {
    // brim, mainly to be used with the wall as it sticks to it
    difference() {
        translate([-5,-5,0])
        rounded_cube_side(width+10,depth+10,0.2/scaling,rounding-5);
        _stand_form();
    }
}

module stand_wall() {
    // experimental wall, meant to keep heat inside when printing with ABS
    wall = 0.5/scaling;
    translate([-5-wall,-5-wall,0])
    difference() {
        hull() {
            rounded_cube_side(width+10+2*wall,
                              depth+10+2*wall,
                              0.2/scaling,
                              rounding-5);

            translate([0,84,height])
            rounded_cube_side(width+10+2*wall,
                              17,
                              0.2/scaling,
                              4);
        }
        translate([wall,wall,0])
        hull() {
            rounded_cube_side(width+10,
                              depth+10,
                              0.2/scaling,
                              rounding-5-wall);

            translate([0,84+(wall*1.2-wall),height])
            rounded_cube_side(width+10,
                              17-2*wall*1.2,
                              0.2/scaling,
                              4-wall);
        }

    }
}

module stand_1(with_brim=false,
               with_wall=false) {

    scale([scaling, scaling, scaling]) {
        difference() {
            _stand_form();

            translate([-15,76.7,158.3])
            rotate([70,0,0])
            scale([1,1,1.05])
            enlarged_logo();

            #_stand_text();
        }

        if (with_brim) {
            stand_brim();
        }
        if (with_wall) {
            stand_wall();
        }
    }
}

module _back_curve() {
    hull() {
        rotate([0,90,0])
        cylinder(d=50,h=width, $fn=100);

        translate([0,224.5,-rounding/2])
        intersection() {
            rotate([0,90,0])
            cylinder(d=500,h=width, $fn=300);

            translate([0,-250,20])
            cube([width,depth+10,height]);
        }
    }
}

module _stand_text() {
    translate([23,17.9,11])
    intersection() {
        if (sliced_text) {
            slice(view_text,
                  size=17,
                  height=20,
                  even=true,
                  slice_h=0.2/scaling,
                  $fn=50);
        } else {
            thetext(view_text,
                    height=20,
                    size=17,
                    font="",
                    $fn=50);
        }

        translate([0,-14.5,-5])
        rotate([-20,0,0])
        cube([70,3,40]);
    }
}

module stand_text() {
    scale([scaling,scaling,scaling])
    _stand_text();
}
