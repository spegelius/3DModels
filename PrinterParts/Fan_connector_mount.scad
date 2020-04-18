include <../PCParts/common.scad>;

w = 17.03*2.54;
l = 4.02*2.54;

row1_x = 0.8+2.54*2;
row1_y = 2.54*2;
    
spacing = 2.54*3;

module mock_connector_pcb() {

    echo(w);
    


    union() {
        pcb_with_holes(w,l,h=1.6);

        translate([row1_x,row1_y,1.78]) mock_fan_connector_male();
        translate([row1_x+spacing,row1_y,1.78]) mock_fan_connector_male();
        translate([row1_x+2*spacing,row1_y,1.78]) mock_fan_connector_male();
        translate([row1_x+3*spacing,row1_y,1.78]) mock_fan_connector_male();
        translate([row1_x+4*spacing,row1_y,1.78]) mock_fan_connector_male();

    }
}

module fan_connector_mount() {
    difference() {
        cube([w+13,l+3,7]);
        translate([0,1.5,6]) cube([w+13,l,3]);
        translate([13/2,1.5,1.4]) cube([w,l,13]);
        for (i = [0:4]) {
            translate([13/2+row1_x+i*spacing,1.5+row1_y,-0.1]) scale([1.05,1.04,1]) mock_fan_connector_male();
        }
        translate([3,(l+3)/2,0]) cylinder(d=3.2,h=15,$fn=30);
        translate([w+13-3,(l+3)/2,0]) cylinder(d=3.2,h=15,$fn=30);
        translate([0,1.5,3]) cube([13,1.8,7]);
        translate([0,(l+3)-1.8-1.5,3]) cube([13,1.8,7]);
    }
    %translate([13/2,1.5+l,3]) rotate([180,0,0]) mock_connector_pcb();
}

module fan_connector_mount_bottom() {
    difference() {
        union() {
            cube([w+13,l-0.3,1]);
            translate([13/2+0.2,2,0]) cube([2,(l-0.3)-4,3.2]);
            translate([w+13-13/2-2.2,2,0]) cube([2,(l-0.3)-4,3.2]);
        }
        translate([3,(l-0.3)/2,0]) cylinder(d=3.2,h=15,$fn=30);
        translate([w+13-3,(l-0.3)/2,0]) cylinder(d=3.2,h=15,$fn=30);
    }
}

//mock_connector_pcb();

fan_connector_mount();
translate([0,15,0]) fan_connector_mount_bottom();