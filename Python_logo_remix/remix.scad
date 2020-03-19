
use <../lib/includes.scad>;
use <../ColorBlend/ColorBlend.scad>;


////// VARIABLES //////
view_text = "python";

// text is sliced in 0.2mm slices,
// for blending colors
sliced_text = true;
scaling = 1;
width = 116;
depth = 91;
height = 163;
rounding = 33;


////// VIEW //////
//_back_curve();
stand_1();
//stand_1(with_brim=true, with_wall=true);
//stand_text();



////// MODULES //////
module logo() {
    scale([scaling, scaling, scaling]) {
        import("../_downloaded/Python_Logo_Assembly/T-PythonBOTTOM-yellow.stl",
          convexity=10);
        import("../_downloaded/Python_Logo_Assembly/T-PythonTOP-blue.stl",
          convexity=10);
    }
}

module enlarged_logo() {
    translate([0,0,-6])
    linear_extrude(20)
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
        rounded_cube_side(width+10,depth+10,0.2,rounding-5);
        _stand_form();
    }
}

module stand_wall() {
    // experimental wall, meant to keep heat inside when printing with ABS
    translate([-5.5,-5.5,0])
    difference() {
        hull() {
            rounded_cube_side(width+11,depth+11,0.2,rounding-5);

            translate([0,84,height])
            rounded_cube_side(width+11,17,0.2,4);
        }
        translate([0.5,0.6,0])
        hull() {
            rounded_cube_side(width+10,depth+10,0.2,rounding-5);

            translate([0,84,height])
            rounded_cube_side(width+10,15.7,0.2,4);
        }

    }
}

module stand_1(with_brim=false,
               with_wall=false) {

    difference() {
        _stand_form();

        translate([-15,76.7,158.3])
        rotate([70,0,0])
        scale([1,1,1.05])
        enlarged_logo();

        #stand_text();
    }

    if (with_brim) {
        stand_brim();
    }
    if (with_wall) {
        stand_wall();
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

module stand_text() {
    translate([23,17.9,11])
    intersection() {
        if (sliced_text) {
            slice(view_text,
                  size=17,
                  height=20,
                  true,
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
