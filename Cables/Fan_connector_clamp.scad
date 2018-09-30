
include <../PCParts/common.scad>;

connector_spacing = 10;

connectors = 4;
connector_offset = (connector_spacing - fan_connector_width)/2 + 1;

width=connectors * connector_spacing + 3;
length=29;
height=6;

module cone() {
    hull() {
        translate([0,0,1.9]) cylinder(d=3.3, h=1, $fn=30);
        cylinder(d=7.3, h=0.1, $fn=30);
    }
}

difference() {
    cube([width,length,height]);
    translate([2, (length-13)/2, 2]) cube([width-4,13,height]);
    
    translate([connector_offset, length/2-7.6/2+0.3, 0]) for (i = [0:connectors-1]) {
        translate([i*10,0, 0]) cube([fan_connector_width,fan_connector_length, 5]);
    }
    
    translate([width-3, length/2, 5]) rotate([0,90,0]) cylinder(d=4, h=5, $fn=30);
    
    translate([width/2, 3.3/2+2,-0.1]) cylinder(d=3.3, h=height+1, $fn=30);
    translate([width/2, length-3.3/2-2,-0.1]) cylinder(d=3.3, h=height+1, $fn=30);
    
    translate([width/2, 3.3/2+2,-0.2]) cone();
    translate([width/2, length-3.3/2-2,-0.1]) cone();
}