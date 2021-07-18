
include <../Dollo/NEW_long_ties/include.scad>;

//supports_block_1();
//supports_64thick();
//support_blockers_1();
supports_1();

scaling = 1.67; //50x50x50
//scaling = 1; // 30x30x30

block = 30/7;
infill_size = 0.2 * 1/scaling;

blocker_size = 0.8 * 1/scaling;
z_gap = 0.4 * 1/scaling;


module hilbert_cube_1(scaling=scaling, infill=true) {

    echo(block, infill_size);

    scale([scaling, scaling, scaling])
    difference() {
        import(
            "../_downloaded/Hilbert Cube/hilbert_cube1.stl",
            convexity=10);

        if (infill) {
            #translate([block, -3*block, 1.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);

            #translate([-block, -3*block, 1.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);


            #translate([block, -3*block, 5.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);

            #translate([-block, -3*block, 5.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);


            #translate([3*block, -3*block, 2.5*block - 1])
            cube([infill_size, infill_size, 5*block],center=true);

            #translate([-3*block, -3*block, 2.5*block - 1])
            cube([infill_size, infill_size, 5*block],center=true);


            #translate([3*block, -block, 1.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);

            #translate([-3*block, -block, 1.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);


            #translate([block, -block, 1.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);

            #translate([-block, -block, 1.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);


            #translate([block, -block, 5.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);

            #translate([-block, -block, 5.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);


            #translate([block, block, 5.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);

            #translate([-block, block, 5.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);


            #translate([block, 3*block, 1.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);

            #translate([-block, 3*block, 1.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);


            #translate([block, 3*block, 5.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);

            #translate([-block, 3*block, 5.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);


            #translate([3*block, 3*block, 3.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);

            #translate([-3*block, 3*block, 3.5*block - 1])
            cube([infill_size, infill_size, 3*block],center=true);

        }
    }
}

module hilbert_cube_64thick() {
    intersection() {
        translate([0, 0, -1])
        import(
            "../_downloaded/Hilbert Cube/Hilb64Thick.stl",
            convexity=10);

        translate([0, 0, 31/2])
        cube([31, 31, 31], center=true);
    }
}

module supports_block_1() {
    difference() {
        union() {
            translate([0, 0, 25.7/2])
            cube([29.9, 29.9, 25.7], center=true);

            translate([0 ,0, 0.2/2])
            cube([36, 36, 0.2], center=true);
        }

        hilbert_cube_1(scaling=1, infill=false);

        translate([0, 4.75, 20/2 + 0.2])
        cube([4.4, 31, 20], center=true);

        translate([0, 0, 20/2 + 12])
        cube([4.4, 31, 20], center=true);

        translate([0, 0,40/2 + 0.2])
        cube([29.9 - 8.45, 4.4, 40], center=true);

        translate([0, 8.6, 40/2 + 9])
        cube([29.9 - 8.45, 4.4, 40], center=true);

        translate([0, -8.6, 40/2 + 0.2])
        cube([29.9 - 8.45, 4.4, 40], center=true);

        translate([0, 0, 10/2 + 20])
        cube([31, 4.4, 10], center=true);

        translate([-8.6, 8.6, 40/2 + 0.2])
        cube([4.4, 4.4, 40], center=true);
       
        translate([8.6, 8.6, 40/2 + 0.2])
        cube([4.4, 4.4, 40], center=true);
    }
}

module supports_64thick() {
    difference() {
        union() {
            translate([0, 0, 25.7/2])
            rounded_cube_side(
                29, 29, 25.7, 3, center=true, $fn=20);
            //cube([28.5,28.5,25.7],center=true);

            translate([0, 0, 0.2/2])
            cube([36, 36, 0.2], center=true);
        }
        #hilbert_cube_64thick();

        translate([0, 0, 40/2 + 0.2])
        cube([4.2, 21, 40], center=true);

        translate([0,0, 40/2 + 20])
        cube([4.2, 31, 40], center=true);

        translate([0, -16, 20])
        cylinder(d=10, h=10);

        translate([0, 16, 20])
        cylinder(d=10, h=10);

        translate([0, 0, 40/2 + 0.2])
        cube([21, 4.2, 40], center=true);

        translate([0, 0, 40/2 + 10])
        cube([31, 4.2, 40], center=true);

        translate([-8.3, -10/2 - 6.4, 40/2 + 10])
        cube([4.2, 10, 40], center=true);
        
        translate([-8.3, -18, 10])
        cylinder(d=10, h=30);

        translate([8.3, -10/2 - 6.4, 40/2 + 10])
        cube([4.2, 10, 40], center=true);
        
        translate([8.3, -18, 10])
        cylinder(d=10, h=30);

        translate([-8.3, 10/2 + 6.4, 40/2 + 10])
        cube([4.2, 10, 40], center=true);
        
        translate([-8.3, 18, 10])
        cylinder(d=10, h=30);

        translate([8.3, 10/2 + 6.4, 40/2 + 10])
        cube([4.2, 10, 40], center=true);
        
        translate([8.3, 18, 10])
        cylinder(d=10, h=30);

        hull() {
            translate([0, 0, 15/2 + 0.2])
            cube([0.1, 31, 15], center=true);

            translate([0, 0, 13/2 + 0.2])
            cube([4.2, 31, 13], center=true);
        }
    }
}

module support_blockers_1() {

    module _blockers() {
        translate([0, 0, (4*block - z_gap)/2])
        cube([36, blocker_size, 4*block - z_gap], center=true);

        translate([0, 0, (2*block - z_gap)/2])
        cube([blocker_size, 36, 2*block - z_gap], center=true);

        translate([0, block/2 + 0.25 + 3/2, 20/2])
        cube([blocker_size, 33 - block - 0.25, 20], center=true);


        translate([2*block, -36/4, (2*block - z_gap)/2])
        cube([blocker_size, 36/2, 2*block - z_gap], center=true);

        translate([-2*block, -36/4, (2*block - z_gap)/2])
        cube([blocker_size, 36/2, 2*block - z_gap], center=true);

        translate(
            [2*block, -block - 2.75/2 - 1.5*block - 0.25,
             (4*block - z_gap)/2])
        cube(
            [blocker_size, 2*block + 2.75,
             4*block - z_gap], center=true);

        translate(
            [-2*block, -block - 2.75/2 - 1.5*block - 0.25,
             (4*block - z_gap)/2])
        cube(
            [blocker_size, 2*block + 2.75,
             4*block - z_gap], center=true);


        translate(
            [2*block, block + 2.75/2 + 1.5*block + 0.25,
             (4*block - z_gap)/2])
        cube(
            [blocker_size, 2*block + 2.75,
             4*block - z_gap], center=true);

        translate(
            [-2*block, block + 2.75/2 + 1.5*block + 0.25,
            (4*block - z_gap)/2])
        cube(
            [blocker_size, 2*block + 2.75,
             4*block - z_gap], center=true);
    }

    hilbert_cube_1();

    scale([scaling, scaling, scaling])
    _blockers();
}

module supports_1() {

    s_h = block - 2 * z_gap;
    s_wall = 1 * 1/scaling;

    module _support(x, y, z, open=false) {
        holes = ceil(z / 8);

        _z = (z - s_wall) / holes - (holes - 1) * s_wall/(holes*2);
    
        _c = (x - s_wall)/2 - 0.01;

        rotate([90, 0, 0])
        difference() {
            cube([x, z, y], center=true);

            if (open) {
                for (i = [0:holes - 1 ]) {
                    translate(
                        [0, i*(_z + s_wall/2)- z/2 + s_wall/2, 0])
                    translate([0,_z/2 - _c/2,0])
                    intersection() {
                        chamfered_cube_side(
                            x - s_wall, _z + _c, y + s_wall,
                            _c, center=true);

                        translate([0,_c/2,0])
                        cube([x, _z, y + s_wall], center=true);
                    }
                }
            }
        }
    }

    module _supports_right() {
        translate([3*block, 2.5*block, 1.5*block])
        _support(block, 2*block, s_h);

        translate([block, 1.5*block-0.25/2, 1.5*block])
        _support(block, 2*block-0.25, s_h);

        translate([2.5*block, 1*block, 1.5*block])
        rotate([0,0,90])
        _support(block, 2*block, s_h);

        translate([2*block, 3*block, 2*block - z_gap/2])
        _support(block - 0.5, block, 3*block + s_h + z_gap);

        translate([3*block, 2*block, 4*block + z_gap/2])
        _support(block, block-0.5, block + s_h + z_gap);

        translate([3*block, block + 0.25/2, 3.5*block])
        _support(block, block + 0.25, s_h);

        translate([block, 2.5*block, 3.5*block])
        _support(block, 2*block, s_h);

        translate([1.5*block, 1*block, 3.5*block])
        rotate([0,0,90])
        _support(block, 2*block, s_h);

        translate([2*block + 0.25, 3*block, 5.5*block])
        rotate([0,0,90])
        _support(block, block, s_h);

        translate([2*block + 0.25, block, 5.5*block])
        rotate([0,0,90])
        _support(block, block, s_h);

        translate([2*block + 0.25, -block, 5.5*block])
        rotate([0,0,90])
        _support(block, block, s_h);

        translate([3*block, block, 5.5*block])
        _support(block, 5*block, s_h);

        translate([3*block, 0, 2*block - z_gap/2])
        rotate([0,0,90])
        _support(block - 0.5, block, 3*block + s_h + z_gap);

        translate([2*block, -block, 3.5*block])
        rotate([0,0,90])
        _support(block, 3*block, s_h);

        translate([2*block, -block, block - z_gap/2])
        _support(block - 0.5, block, block + s_h + z_gap);

        translate([2*block, -2*block, 0.5*block + z_gap/2])
        _support(block - 0.5, block - 0.5, block + z_gap);

        translate(
            [2.5*block + 0.25/2, -2*block,
             1.5*block + z_gap + s_wall/4])
        rotate([0,0,90])
        _support(block - 0.5, 2*block - 0.25, block + s_wall/2);

        translate([3*block, -2*block, 4*block])
        rotate([0,0,90])
        _support(block - 0.5, block, 3*block + s_h);

        translate([2.5*block+0.25/2, -3*block, 5.5*block])
        rotate([0,0,90])
        _support(block, 2*block - 0.25, s_h);

        translate([2*block, -3*block, 1.5*block + z_gap/2])
        _support(block - 0.5, block, 2*block + s_h + 3*z_gap);

        translate([1.5*block - 0.25/2, -3*block, 3.5*block])
        rotate([0,0,90])
        _support(block, 2*block - 0.25, s_h);

        translate([0, -3*block, block - z_gap/2])
        _support(block - 0.5, block, block + s_h + z_gap);
    }

    module _supports_left() {
        mirror([1,0,0])
        _supports_right();
    }

    hilbert_cube_1();

    color("grey")
    scale([scaling, scaling, scaling])
    _supports_right();

    color("grey")
    scale([scaling, scaling, scaling])
    _supports_left();
}