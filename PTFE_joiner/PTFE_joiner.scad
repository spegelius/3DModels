use <../Dollo/NEW_long_ties/include.scad>;


////// VARIABLES //////
resolution = 60;
screw_d = 11;
outer_d = 12.5;


////// VIEW DEV //////
//debug();
//mock_PTFE();


////// VIEW PRINT //////
//cap1();
//cap2();
//insert();
plate();


////// MODULES //////
module mock_PTFE() {
    rotate([90,0,0])
    cylinder(d=4,h=25,center=true,$fn=30);

    translate([0,-1,0])
    rotate([90,0,0])
    M4_nut(cone=false);

    translate([0,1,0])
    rotate([-90,0,0])
    M4_nut(cone=false);
}

module cap1() {
    difference() {
        union() {
            translate([0,0,1])
            cylinder(d2=outer_d,d1=5.5,h=(outer_d-5.5)/2+2,$fn=50);

            translate([0,0,(outer_d-5.5)/2+3])
            cylinder(d=outer_d,h=6,$fn=50);

            M4_nut();
        }
        cylinder(d=4.4,h=15,$fn=50);

        translate([0,0,5])
        cylinder(d=8.2,h=10,$fn=30);

        translate([0,0,8.2])
        v_screw(h=11,
                screw_d=screw_d+0.5,
                pitch=1.5,
                direction=0,
                steps=resolution);
    }
}

module cap2() {
    difference() {
        union() {
            translate([0,0,1])
            cylinder(d2=outer_d,d1=5.5,h=(outer_d-5.5)/2+2,$fn=50);

            translate([0,0,(outer_d-5.5)/2+3])
            v_screw(h=4.25,
                    screw_d=screw_d,
                    pitch=1.5,
                    direction=0,
                    steps=resolution);

            M4_nut();
        }
        cylinder(d=4.4,h=15,$fn=50);

        translate([0,0,5])
        cylinder(d=8.2,h=10,$fn=30);
    }
}

module insert() {
    difference() {
        cylinder(d=7.9,h=2.6,$fn=40);
        cylinder(d=4.4,h=3.1,$fn=40);
    }
}

module plate() {
    translate([-7,0,0])
    cap1();

    translate([7,0,0])
    cap2();

    translate([0,5,0])
    insert();
}

module debug() {
    intersection() {
        union() {
            cap1();

            translate([0,0,19.15])
            rotate([0,180,130])
            cap2();

            translate([0,0,8.25])
            insert();

            color("grey") {
                translate([0,0,5])
                M4_nut(cone=false);

                translate([0,0,10.9])
                M4_nut(cone=false);
            }
        }
        cube([20,20,20]);
    }
}

