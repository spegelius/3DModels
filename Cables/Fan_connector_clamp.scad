
fan_connector_width = 6.1;
fan_connector_length = 7.9;

width=40;
length=28;
height=6;

module cone() {
    hull() {
        translate([0,0,1.9]) cylinder(d=3.3, h=1, $fn=30);
        cylinder(d=7.3, h=0.1, $fn=30);
    }
}

difference() {
    cube([width,length,height]);
    translate([(width-36.2)/2, (length-16)/2, 2]) cube([36.2,16,height]);
    translate([(width-36.2)/2+2.6, length/2-7.6/2+0.3, 0]) cube([fan_connector_width,fan_connector_length, 5]);
    translate([(width-36.2)/2+13.05, length/2-7.6/2+0.3, 0]) cube([fan_connector_width,fan_connector_length,5]);
    translate([(width-36.2)/2+23.05, length/2-7.6/2+0.3, 0]) cube([fan_connector_width,fan_connector_length,5]);
    
    translate([width-3, 26/2, 5]) rotate([0,90,0]) cylinder(d=4, h=5, $fn=30);
    
    translate([width/2, 3.3/2+2,-0.1]) cylinder(d=3.3, h=height+1, $fn=30);
    translate([width/2, length-3.3/2-2,-0.1]) cylinder(d=3.3, h=height+1, $fn=30);
    
    translate([width/2, 3.3/2+2,-0.2]) cone();
    translate([width/2, length-3.3/2-2,-0.1]) cone();
}