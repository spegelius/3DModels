
include <common.scad>;


//debug();

rotate([90,0,0]) {
    hd_rack(6, spacing=1.5, closed=true);
}

//fan_adapter_92mm(6, spacing=1.5);


module hoole(d=screw_dia, h=5) {
    hull() {
        translate([0, -1, 0])
        rotate([0,90,0])
        cylinder(d=d, h=h, $fn=30);

        translate([0, 1, 0])
        rotate([0, 90, 0])
        cylinder(d=d, h=h, $fn=30);
    }
}

function get_height(
    disks, spacing, wall) = disks * hd_height + disks * spacing + 2*wall;

function get_hole_z(
    i, spacing, wall) = i * (hd_height + spacing) + (hd_height - 6.40) + wall + spacing/2;

module hd_rack(disks, spacing=3, closed=false) {
   
    hoole_d = 7;

    wall = 1.8;
    
    w = hd_width + 0.2 + 2*wall;
    
    height = get_height(disks, spacing, wall);

    difference() {
        
        cube([w, 130, height]);

        translate([wall, 0, wall])
        cube([hd_width + 0.2, 160, height - 2*wall]);

        for (i = [0:disks - 1]) {
            z = get_hole_z(i, spacing, wall);

            translate([0, 18.3, z])
            hoole();

            translate([-4.2, 18.3, z])
            hoole(d=hoole_d);

            translate([0, 59.8, z])
            hoole();

            translate([-4.2, 59.8, z])
            hoole(d=hoole_d);

            translate([0, 119.8, z])
            hoole();

            translate([-4.2, 119.8, z])
            hoole(d=hoole_d);

            translate([hd_width, 18.3, z])
            hoole();

            translate([hd_width + 3.1, 18.3, z])
            hoole(d=hoole_d);

            translate([hd_width, 59.8, z])
            hoole();

            translate([hd_width + 3.1, 59.8, z])
            hoole(d=hoole_d);

            translate([hd_width, 119.8, z])
            hoole();

            translate([hd_width + 3.1, 119.8, z])
            hoole(d=hoole_d);
        }
    }
    %for (i = [0:disks - 1]) {
        z = i * (hd_height + spacing) + (hd_height - 6.40) + wall + spacing/2;
    
        translate([102 + 2, -10, z + 6.5])
        rotate([0, 180, 0])
        mock_hd();
    }
}

module fan_adapter_92mm(disks, spacing=3) {

    wall = 1.8;
    w = hd_width + 4 + 4;
    l = get_height(disks, spacing, wall);
    h = (l - fan_92mm)/2;

    difference() {
        union() {
            difference() {
                hull() {
                    translate([0, 0, 1/2])
                    cube([fan_92mm, fan_92mm, 1], center=true);

                    translate([0, 0, h + 1/2])
                    cube([w, l, 8], center=true);
                }
                translate([0, 0, 2])
                scale([(w - 3)/w, (l - 3)/l, 1])
                hull() {
                    translate([0, 0, 1/2])
                    cube([fan_92mm, fan_92mm, 1], center=true);

                    translate([0, 0, h + 1/2])
                    cube([w, l, 8], center=true);
                }
                cylinder(d=90, h=5, $fn=100, center=true);
            }
            translate([w/2 - wall/2, l/2 - 9, h + 10])
            difference() { 
                cube([wall, 12, 22], center=true);

                translate([-wall/2, 0, 5])
                rotate([90, 0, 0])
                hoole();
            }
            translate([w/2 - wall/2, -l/2 + 22.5, h + 10])
            difference() { 
                cube([wall, 12, 22], center=true);

                translate([-wall/2, 0, 5])
                rotate([90, 0, 0])
                hoole();
            }

            translate([-w/2 + wall/2, l/2 - 9, h + 10])
            difference() { 
                cube([wall, 12, 22], center=true);

                translate([-wall/2, 0, 5])
                rotate([90, 0, 0])
                hoole();
            }
            translate([-w/2 + wall/2, -l/2 + 22.5, h + 10])
            difference() { 
                cube([wall, 12, 22], center=true);

                translate([-wall/2, 0, 5])
                rotate([90, 0, 0])
                hoole();
            }
        }
        for (i = [0:3]) {
            rotate([0, 0, i * 360/4])
            translate(
                [fan_92mm_bolt_offset, fan_92mm_bolt_offset])
            cylinder(d=5.2, h=6, $fn=30);
        }
    }
}

module debug() {
    hd_rack(6, spacing=1.5, closed=true);
    translate([(hd_width+4)/2,173.5,84.5]) rotate([90,0,0]) fan_adapter_92mm(6, spacing=1.5);
}

