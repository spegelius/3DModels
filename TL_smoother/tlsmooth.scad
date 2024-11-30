use <../PCParts/common.scad>;
include <../Dollo/New_long_ties/globals.scad>;
use <../Dollo/New_long_ties/include.scad>;
use <../Dollo/New_long_ties/mockups.scad>;

// for DIY box
w_diy = 32;
l_diy = 56;
h_diy = 7;

//diode_1N5404();
mock_tl_smoother();

//assembly_diy();
//assembly_diy_fan();


//base_diy();
//lid_diy();

//base_diy_fan();
//lid_diy_fan();


module diode_1N5404() {
    color("black")
    translate([0, 0, -1.5/2])
    cylinder(d=5.3, h=7.5, $fn=20, center=true);

    color("grey")
    translate([0, 0, -1.5/2 + 9/2])
    cylinder(d=5.3, h=1.5, $fn=20, center=true);

    color("grey")
    cylinder(d=1, h=16, $fn=20, center=true);
}

module _diode_pack() {
    offset = 8;

    translate([-3, offset, 0])
    rotate([90, 0, 0])
    diode_1N5404();

    translate([-3, -offset, 0])
    rotate([90, 0, 0])
    diode_1N5404();

    translate([3, offset, 0])
    rotate([-90, 0, 0])
    diode_1N5404();

    translate([3, -offset, 0])
    rotate([-90, 0, 0])
    diode_1N5404();
}

module assembly_diy() {
    base_diy();


    translate([-8, 0, 2.6])
    _diode_pack();

    translate([8, 0, 2.6])
    _diode_pack();

    translate([-4, l_diy/2 - 6.3, 2.6])
    rotate([-90, 0, 0])
    pin_header(4);
}

module assembly_diy_fan() {
    intersection() {
        union() {
            base_diy_fan();

            translate([0, 0, 11.6])
            rotate([0, 180, 0])
            lid_diy_fan();
        }

        translate([100/2, 0, 0])
        cube([100, 100, 100], center=true);
    }

//    %translate([0, 0, 12])
//    mock_fan_40mm();

    translate([-8, 0, 2.6])
    _diode_pack();

    translate([8, 0, 2.6])
    _diode_pack();

    translate([-4, l_diy/2 - 6.3, 2.6])
    rotate([-90, 0, 0])
    pin_header(4);
}

module _longhole(l, h=7.1) {
    hull() {
        translate([0, l/2 - 9, 0])
        cylinder(d=3, h=h, center=true, $fn=20);

        translate([0, -l/2 + 9, 0])
        cylinder(d=3, h=h, center=true, $fn=20);
    }
}

module _base(w, l, h) {

    difference() {
        union() {
            rounded_cube_side(w, l, h, 6, center=true, $fn=30);

            // connector addition
            translate([0, l/2, 0])
            cube([12.5, 11, h], center=true);
        }

        // inside
        difference() {
            translate([0, 0, 1.5])
            rounded_cube_side(w - 3, l - 3, h, 3, center=true);

            // corners
            translate([w/2 - 3, l/2 - 3, 0])
            cylinder(d=6, h=h, $fn=30, center=true);

            translate([-w/2 + 3, l/2 - 3, 0])
            cylinder(d=6, h=h, $fn=30, center=true);

            translate([w/2 - 3, -l/2 + 3, 0])
            cylinder(d=6, h=h, $fn=30, center=true);

            translate([-w/2 + 3, -l/2 + 3, 0])
            cylinder(d=6, h=h, $fn=30, center=true);

            // middle
            cube([4, l - 18, h], center=true);

            // diode stands
            translate([0, 8, -h/2])
            cube([w, 2, h], center=true);

            translate([0, -8, -h/2])
            cube([w, 2, h], center=true);

            translate([0, 0, -h/2 + 1.5])
            cube([w, 4, h], center=true);

            translate([0, -l/2 + 6/2, 0])
            cube([10, 6, h + 1], center=true);

            translate([0, l/2 - 4.4/2, -1])
            cube([10, 4.4, 3.9], center=true);
        }

        // connector cuts
        translate([0, l/2 - 2.2/2 - 1, -h/2 + 5/2 + 4])
        cube([10.5, 2.5, 5], center=true);

        translate([0, l/2 + 6/2, h/2 + 5/2 - 2.5])
        cube([10.5, 6, 5], center=true);

        // middle wire cut
        translate([0, 0, 1.5])
        cube([2, l - 17, h], center=true);

        // cable hole
        translate([0, -l/2, 2])
        rotate([90, 0, 0])
        cylinder(d=5, h=17, center=true, $fn=20);

        translate([0, -l/2 + 3, 4])
        cube([12, 2, 5], center=true);

        // connector pin holes
        x_offset = -10.5/2 + 2.54/2 + 0.2;
        for (i=[0:4 - 1]) {
            translate([x_offset + i*2.54, l/2, h/2 - 2.5/2])
            rotate([-90, 0, 0])
            cube([0.8, 0.8, 11.5], center=true);
        }

        // corner screw holes
        translate([w/2 - 3, l/2 - 3, -0.1])
        cylinder(d=2.8, h=h + 2, $fn=30, center=true);

        translate([-w/2 + 3, l/2 - 3, -0.1])
        cylinder(d=2.8, h=h + 2, $fn=30, center=true);

        translate([w/2 - 3, -l/2 + 3, -0.1])
        cylinder(d=2.8, h=h + 2, $fn=30, center=true);

        translate([-w/2 + 3, -l/2 + 3, -0.1])
        cylinder(d=2.8, h=h + 2, $fn=30, center=true);

        // bottom air holes
        translate([-11, 0, -h/2])
        _longhole(l);

        translate([-5, 0, -h/2])
        _longhole(l);

        translate([11, 0, -h/2])
        _longhole(l);

        translate([5, 0, -h/2])
        _longhole(l);

        // chamfer
        translate([0, l/2 + 6, -h/2])
        rotate([45, 0, 0])
        cube([20, 6, 6], center=true);
    }
}

module base_diy() {
    _base(w_diy, l_diy, h_diy);
}

module base_diy_fan() {
    h = h_diy;
    difference() {
        union() {
            _base(46, l_diy, h);

            translate([0, 0, -h/2 + 11/2])
            fan_mount_holes(40, h_d=6, h=11);

            translate([0, 0, -h/2 + 13.4/2])
            fan_mount_holes(40, h_d=3.8, h=13.4);

        }

        translate([-17, 0, -h/2])
        _longhole(l_diy - 16);

        translate([17, 0, -h/2])
        _longhole(l_diy - 16);
    }
}

module _longhole_lid(w, h=6) {
    hull() {
        translate([-w/9, 0, 0])
        cylinder(d=3, h=h, center=true, $fn=20);

        translate([w/9, 0, 0])
        cylinder(d=3, h=h, center=true, $fn=20);
    }
}

module _lid(w, l, h) {
    
    lh = h;
    
    difference() {
        union() {
            rounded_cube_side(w, l, lh, 6, center=true, $fn=30);

            translate([0, 0, 1.5])
            rounded_cube_side(
                w - 3.2, l - 3.2, lh, 2.8, center=true, $fn=30
            );

            // connector block
            difference() {
                translate([0, l/2, lh/2 - 8/2])
                cube([12.5, 11, 8], center=true);

                // chamfer
                translate([0, l/2 + 6, lh/2 - 8])
                rotate([50, 0, 0])
                cube([20, 9, 9], center=true);

                translate([0, l/2, -lh/2 - 10/2])
                cube([30, 30, 10], center=true);
            }
        }

        difference() {
            translate([0, 0, 1.6])
            rounded_cube_side(
                w - 5.2, l - 5.2, lh, .8, center=true
            );

            translate([0, 0, 1.5])
            cube([1.8, l - 18, h], center=true);

            translate([0, -l/2 + 3, 0])
            cube([12, 1.8, h], center=true);
            
            translate([w/2 - 3, l/2 - 3, 0])
            cylinder(d=6, h=h, $fn=30, center=true);

            translate([-w/2 + 3, l/2 - 3, 0])
            cylinder(d=6, h=h, $fn=30, center=true);

            translate([w/2 - 3, -l/2 + 3, 0])
            cylinder(d=6, h=h, $fn=30, center=true);

            translate([-w/2 + 3, -l/2 + 3, 0])
            cylinder(d=6, h=h, $fn=30, center=true);

            translate([0, -l/2 + 2, 2/2 + lh/2])
            cube([10.5, 2.2, 2], center=true);
        }

        // connector cut
        translate([
            0, l/2 - 4/2,
            //2/2 + lh/2 + (h/2 - (-h/2 + 5/2 + 4))
            lh/2 + 2.5/2
        ])
        cube([11, 4, 2.5], center=true);

        // wire hole
        difference() {
            translate([0, -l/2, 3/2 + lh/2])
            rotate([90, 0, 0])
            cylinder(d=5, h=17, center=true, $fn=20);

            translate([0, -l/2 + 3, lh/2 - 1.2])
            cube([10, 1, 2], center=true);
        }

        // corner cuts
        translate([w/2 - 3, l/2 - 3, lh/2])
        cylinder(d=6.5, h=4, $fn=30);

        translate([-w/2 + 3, l/2 - 3, lh/2])
        cylinder(d=6.5, h=4, $fn=30);

        translate([w/2 - 3, -l/2 + 3, lh/2])
        cylinder(d=6.5, h=4, $fn=30);

        translate([-w/2 + 3, -l/2 + 3, lh/2])
        cylinder(d=6.5, h=4, $fn=30);

        // screw holes
        translate([w/2 - 3, l/2 - 3, 0])
        cylinder(d=3.2, h=40, center=true ,$fn=30);

        translate([-w/2 + 3, l/2 - 3, 0])
        cylinder(d=3.2, h=40, center=true, $fn=30);

        translate([w/2 - 3, -l/2 + 3, 0])
        cylinder(d=3.2, h=40, center=true, $fn=30);

        translate([-w/2 + 3, -l/2 + 3, 0])
        cylinder(d=3.2, h=40, center=true, $fn=30);

        // screw head holes
        translate([w/2 - 3, l/2 - 3, -lh/2])
        cylinder(d1=7, d2=3.2, h=2, center=true, $fn=30);

        translate([-w/2 + 3, l/2 - 3, -lh/2])
        cylinder(d1=7, d2=3.2, h=2, center=true, $fn=30);

        translate([w/2 - 3, -l/2 + 3, -lh/2])
        cylinder(d1=7, d2=3.2, h=2, center=true, $fn=30);

        translate([-w/2 + 3, -l/2 + 3, -lh/2])
        cylinder(d1=7, d2=3.2, h=2, center=true, $fn=30);


    }
}

module lid_diy() {
    difference() {
        _lid(w_diy, l_diy, 4);

        h_x = w_diy/4;
        
        translate([-h_x, 0, -h/2])
        _longhole_lid(w_diy);

        translate([h_x, 0, -h/2])
        _longhole_lid(w_diy);
        
        translate([-h_x, 5, -h/2])
        _longhole_lid(w_diy);

        translate([h_x, 5, -h/2])
        _longhole_lid(w_diyw);

        translate([-h_x, 10, -h/2])
        _longhole_lid(w_diy);

        translate([h_x, 10, -h/2])
        _longhole_lid(w_diy);

        translate([-h_x, 15, -h/2])
        _longhole_lid(w_diy);

        translate([h_x, 15, -h/2])
        _longhole_lid(w_diy);
       
        translate([-h_x, -5, -h/2])
        _longhole_lid(w_diy);

        translate([h_x, -5, -h/2])
        _longhole_lid(w_diy);

        translate([-h_x, -10, -h/2])
        _longhole_lid(w_diy);

        translate([h_x, -10, -h/2])
        _longhole_lid(w_diy);

        translate([-h_x, -15, -h/2])
        _longhole_lid(w_diy);

        translate([h_x, -15, -h/2])
        _longhole_lid(w_diy);
    }
}

module lid_diy_fan() {
    h = 16;

    difference() {
        union() {
            _lid(46, l_diy, h);

            translate([0, 0, -h/2 + 2/2])
            fan_mount_holes(40, h_d=7, h=2);

            translate([0, 0, -h/2 + 4/2])
            fan_mount_holes(40, h_d=3.8, h=4);
        }

        difference() {
            cylinder(d=39, h=40, center=true, $fn=40);
            cylinder(d=10, h=50, center=true, $fn=40);

            tube(30, 50, 0.8, center=true, $fn=40);
            tube(20, 50, 0.8, center=true, $fn=40);

            for(i = [0:10]) {
                rotate([0, 0, 360/11*i])
                translate([30/2, 4, 0])
                cube([30, 1, 50], center=true);
            }
        }

        difference() {
            translate([0, 0, 20/2 - h/2 + 1.6])
            cube([40.5, 40.5, 20], center=true);

            translate([0, 0, -h/2 + 2/2])
            fan_mount_holes(40, h_d=7, h=2);

            translate([0, 0, -h/2 + 4/2])
            fan_mount_holes(40, h_d=3.8, h=4);
        }

        //fan_mount_holes(40, h_d=4);
    }

    %translate([0, 0, -h/2 + 10/2 + 2])
    mock_fan_40mm();


}