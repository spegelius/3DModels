
hd_width = 102;

screw_dia = 3.6;

module HD() {
    difference() {
        cube([hd_width,146,26]);
        translate([0,28.3,6.40]) rotate([0,90,0]) cylinder(d=screw_dia, h=5, $fn=30);
        translate([0,69.8,6.40]) rotate([0,90,0]) cylinder(d=screw_dia, h=5, $fn=30);
        translate([0,129.8,6.40]) rotate([0,90,0]) cylinder(d=screw_dia, h=5, $fn=30);

        translate([hd_width-5,28.3,6.40]) rotate([0,90,0]) cylinder(d=screw_dia, h=5, $fn=30);
        translate([hd_width-5,69.8,6.40]) rotate([0,90,0]) cylinder(d=screw_dia, h=5, $fn=30);
        translate([hd_width-5,129.8,6.40]) rotate([0,90,0]) cylinder(d=screw_dia, h=5, $fn=30);

    }
        
}

module hoole(d=screw_dia, h=5) {
    hull() {
        translate([0,-1,0]) rotate([0,90,0]) cylinder(d=d, h=h, $fn=30);
        translate([0,1,0]) rotate([0,90,0]) cylinder(d=d, h=h, $fn=30);
    }
}

module rack() {
    height = 4*26+4*3;
    module main () {
        intersection () {
            difference() {
                translate([(hd_width+4)/2,87,0]) rotate([0,0,45]) cube([200,200,height]);
                translate([(hd_width+4)/2,90.5,0]) rotate([0,0,45]) cube([196,196,height]);
            }
            translate([-(124-(hd_width+4))/2,140,0])  cube([124,22,height]);
        }
        
        cube([hd_width+4,140,height]);
        difference() {
            translate([-(124-(hd_width+4))/2,149,0]) cube([124,12,height]);
            translate([-(120.1-(hd_width+4))/2,148,0]) cube([120.1,16,height]);
        }
        difference() {
            translate([-(140-(hd_width+4))/2,160,0]) cube([140,2,height]);
            translate([-(120.1-(hd_width+4))/2,160,0]) cube([120.1,2,height]);
        }
    }
    
    
    difference() {
        
        main();
        translate([1.9,0,1]) cube([hd_width+0.2, 160, height]);

        for (i=[0:3]) {
            z = i*(26+3)+(26-6.40)+3;
            translate([0,18.3,z]) hoole();
            translate([-4.2,18.3,z]) hoole(d=6.5);
            translate([0,59.8,z]) hoole();
            translate([-4.2,59.8,z]) hoole(d=6.5);
            translate([0,119.8,z]) hoole();
            translate([-4.2,119.8,z]) hoole(d=6.5);

            translate([hd_width,18.3,z]) hoole();
            translate([hd_width+3.1,18.3,z]) hoole(d=6.5);
            translate([hd_width,59.8,z]) hoole();
            translate([hd_width+3.1,59.8,z]) hoole(d=6.5);
            translate([hd_width,119.8,z]) hoole();
            translate([hd_width+3.1,119.8,z]) hoole(d=6.5);
        }
        
        translate([-(132-(hd_width+4))/2,160,10]) rotate([-90,0,0]) cylinder(d=4, h=5, $fn=30);
        translate([-(132-(hd_width+4))/2,160,height-10]) rotate([-90,0,0]) cylinder(d=4, h=5, $fn=30);
        translate([132-(132-(hd_width+4))/2,160,10]) rotate([-90,0,0]) cylinder(d=4, h=5, $fn=30);
        translate([132-(132-(hd_width+4))/2,160,height-10]) rotate([-90,0,0]) cylinder(d=4, h=5, $fn=30);
        
        translate([-(132-(hd_width+4))/2,145,10]) rotate([-90,0,0]) cylinder(d=9, h=15, $fn=30);
        translate([-(132-(hd_width+4))/2,145,height-10]) rotate([-90,0,0]) cylinder(d=9, h=15, $fn=30);
        translate([132-(132-(hd_width+4))/2,145,10]) rotate([-90,0,0]) cylinder(d=9, h=15, $fn=30);
        translate([132-(132-(hd_width+4))/2,145,height-10]) rotate([-90,0,0]) cylinder(d=9, h=15, $fn=30);
    }
}

module fix_it() {
    $fn=40;
    difference() {
        cube([80,15,9]);
        translate([0,0,7]) cube([80,10,3]);
        translate([8,15/2,0]) cylinder(d=4, h=12);
        translate([80-8,15/2,0]) cylinder(d=4, h=12);
        translate([80/2,15/2,0]) cylinder(d=4, h=12);
    }
}

//translate([hd_width + 1.9,-10,29]) rotate([0,180,0]) %HD();

//rack();

fix_it();