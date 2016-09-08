
$fn=40;
motor_side_length = 43.2;
motor_corner_to_corner_length = sqrt(2*(motor_side_length*motor_side_length));


module arms() {
    height=7;
    
    rotate([0,0,45]) difference() {
        translate([0,0,height/2]) cube([motor_side_length + 4.5, motor_side_length + 4.5, height], center=true);
        translate([0,0,height/2]) cube([motor_side_length-1.5, motor_side_length-1.5, height+1], center=true);
        translate([-8,-8,-0.5]) cube([40,40,height+1]);
        rotate([0,0,45]) translate([-53.9,0,height/2]) cube([44.8,44.8,height+1], center=true);
    }
    translate([-19.4, -motor_corner_to_corner_length/2,0]) cube([2.5,17.60,height]);
    translate([16.9, -motor_corner_to_corner_length/2,0]) cube([2.5,17.60,height]);
}

module fan_mount() {
    bolt_hole_offset = (35-29)/2;
    bolt_hole_position = 35/2 - bolt_hole_offset;
    rotate([90,0,0]) difference() {
        cube([39,39,2], center=true);
        translate([0,0,-1.5]) cylinder(d=34, h=5);
        #translate([bolt_hole_position, bolt_hole_position, -1.5]) cylinder(d=2.5, h=3);
        #translate([-bolt_hole_position, bolt_hole_position, -1.5]) cylinder(d=2.5, h=3);
        #translate([-bolt_hole_position, -bolt_hole_position, -1.5]) cylinder(d=2.5, h=3);
        #translate([bolt_hole_position, -bolt_hole_position, -1.5]) cylinder(d=2.5, h=3);
    }
    
}

module stepper_fan_attachment() {
    rotate([90,0,0]) {
        arms();
        translate([0,-motor_corner_to_corner_length/2,1]) fan_mount();
    }
}

stepper_fan_attachment();
