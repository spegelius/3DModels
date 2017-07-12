
$fn=40;
motor_side_length = 43.2;
motor_corner_to_corner_length = sqrt(2*(motor_side_length*motor_side_length));
//fan_side=35;
//bolt_hole_distance=29;
fan_side=40;
bolt_hole_distance=32;

arm_width=7;

module arms() {

    
    rotate([0,0,45]) difference() {
        translate([0,0,arm_width/2]) cube([motor_side_length + 4.5, motor_side_length + 4.5, arm_width], center=true);
        translate([0,0,arm_width/2]) cube([motor_side_length-1.5, motor_side_length-1.5, arm_width+1], center=true);
        translate([-8,-8,-0.5]) cube([40,40,arm_width+1]);
        rotate([0,0,45]) translate([-53.9,0,arm_width/2]) cube([44.8,44.8,arm_width+1], center=true);
    }
    translate([0,-motor_corner_to_corner_length/2-0.96,arm_width/2]) rotate([-90,0,0]) cylinder(d=10,h=4);
    translate([-(fan_side+4)/2, -motor_corner_to_corner_length/2,0]) cube([2.5,(fan_side)/2,arm_width]);
    translate([(fan_side+4)/2-2.5, -motor_corner_to_corner_length/2,0]) cube([2.5,(fan_side)/2,arm_width]);
}

module fan_mount() {
    bolt_hole_offset = (35-bolt_hole_distance)/2;
    bolt_hole_position = 35/2 - bolt_hole_offset;
    rotate([90,0,0]) difference() {
        cube([fan_side+4,fan_side+4,2], center=true);
        translate([0,0,-1.5]) cylinder(d=fan_side-1, h=5);
        #translate([bolt_hole_position, bolt_hole_position, -1.5]) cylinder(d=2.5, h=3);
        #translate([-bolt_hole_position, bolt_hole_position, -1.5]) cylinder(d=2.5, h=3);
        #translate([-bolt_hole_position, -bolt_hole_position, -1.5]) cylinder(d=2.5, h=3);
        #translate([bolt_hole_position, -bolt_hole_position, -1.5]) cylinder(d=2.5, h=3);
    }
    
}

module stepper_fan_attachment() {
    rotate([90,0,0]) {
        translate([0,0,-arm_width/2]) arms();
        translate([0,-motor_corner_to_corner_length/2,1]) fan_mount();
    }
}

stepper_fan_attachment();

