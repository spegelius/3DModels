
include <common.scad>;

module hoole(d=screw_dia, h=5) {
    hull() {
        translate([0,-1,0]) rotate([0,90,0]) cylinder(d=d, h=h, $fn=30);
        translate([0,1,0]) rotate([0,90,0]) cylinder(d=d, h=h, $fn=30);
    }
}

module hd_rack(disks, spacing=3, closed=false, ) {
    height = disks*hd_height + disks*spacing + 1;
    
    hoole_d = 7;

    function get_height(h) = closed ? h+2 : h;

    difference() {
        
        cube([hd_width+4,130,get_height(height)]);
        translate([1.9,0,1]) cube([hd_width+0.2, 160, height]);

        for (i=[0:disks-1]) {
            z = i*(hd_height+spacing) + (hd_height-6.40) + 2;
            translate([0,18.3,z]) hoole();
            translate([-4.2,18.3,z]) hoole(d=hoole_d);
            translate([0,59.8,z]) hoole();
            translate([-4.2,59.8,z]) hoole(d=hoole_d);
            translate([0,119.8,z]) hoole();
            translate([-4.2,119.8,z]) hoole(d=hoole_d);

            translate([hd_width,18.3,z]) hoole();
            translate([hd_width+3.1,18.3,z]) hoole(d=hoole_d);
            translate([hd_width,59.8,z]) hoole();
            translate([hd_width+3.1,59.8,z]) hoole(d=hoole_d);
            translate([hd_width,119.8,z]) hoole();
            translate([hd_width+3.1,119.8,z]) hoole(d=hoole_d);
        }
    }
    %for (i=[0:disks-1]) {
        z = i*(hd_height+spacing)+(hd_height-6.40)+2;
    
        translate([102+2,-10,z+6.5]) rotate([0,180,0]) mock_hd();
    }
}
rotate([90,0,0]) {
    hd_rack(6, spacing=1.5, closed=true);
}