
length=30;
width=20;
height=5;

slop=0.15;

$fn=6;

module _rail(length, width, height) {
    side=sqrt(height*height/2);
    rotate([-90,0,0]) hull() {
        translate([-(width/2),0,0]) rotate([0,0,-45]) cube([side,side,length]);
        translate([width/2-height,0,0]) rotate([0,0,-45]) cube([side,side,length]);
    }
}

module rail(length, width, height) {
    intersection() {
        difference() {
            _rail(length, width, height);
            translate([-(3+4*slop)/2,0,-slop]) cube([3+4*slop, length, height/2+slop]);
        }
        translate([-(width-2)/2,0,-height/2]) cube([width-2, length, height]);
    }
}


module slide() {
    difference() {
        translate([-(width+5)/2,0,-(height)/2]) cube([width+5, length, height+2]);
        translate([0,-1,2]) _rail(length+2, width+6*slop, height+1+3*slop);
    }
    translate([0,length/2,-height/2+1]) rotate([90,0,90]) _rail(height/2+1, length, 3, $fn=30);
}


rail(length,width,height);
translate([25,0,0]) slide();