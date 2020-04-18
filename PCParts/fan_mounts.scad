use <common.scad>;

module fan_mount_pcb_top_80mm() {
    difference() {
        intersection() {
            translate([0,83/2,0]) union() {
                cube([80,80,3],center=true);
                cylinder(d=83,h=3,center=true,$fn=90);
                hull() {
                    translate([80/2-3,-80/2+25-5,-3/2]) cube([7,7,8]);
                    translate([80/2-3,-80/2+20-5,-3/2]) cube([1,1,1]);
                }
                hull() {
                    translate([-80/2-4,-80/2+25-5,-3/2]) cube([7,7,18]);
                    translate([-80/2+3,-80/2+25-14,-3/2]) cube([1,7,1]);
                }
            }
            translate([0,27/2,0]) cube([90,27,63],center=true);
        }
        translate([0,83/2]) cylinder(d=80,h=77,center=true,$fn=80);
        translate([-72/2,4+1.5,0]) cylinder(d=4,h=7,center=true,$fn=30);
        translate([72/2,4+1.5,0]) cylinder(d=4,h=7,center=true,$fn=30);
        
        translate([-55,23,12]) rotate([0,7,0]) cube([110,1.8,50]);
    }
    
}

module debug() {
    %translate([0,83/2,25/2+3/2]) mock_fan_80mm();
    %translate([-55,23,-49]) rotate([0,7,0]) cube([110,2,50]);
    rotate([0,180,0]) fan_mount_pcb_top_80mm();
}

//debug();

fan_mount_pcb_top_80mm();