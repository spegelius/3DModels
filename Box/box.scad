
width = 180;
length = 180;
height = 200;

nozzle = 0.65;
layer = 0.3;
wall = 2*nozzle;

corner_dia = 15;

module rounded_box(x, y, z, corner_dia=15) {
    $fn=60;
    hull() {
        translate([x/2-corner_dia/2, y/2-corner_dia/2, 0]) cylinder(d=corner_dia, h=z);
        translate([-(x/2-corner_dia/2), y/2-corner_dia/2, 0]) cylinder(d=corner_dia, h=z);
        translate([x/2-corner_dia/2, -(y/2-corner_dia/2), 0]) cylinder(d=corner_dia, h=z);
        translate([-(x/2-corner_dia/2), -(y/2-corner_dia/2), 0]) cylinder(d=corner_dia, h=z);
    }   
}

module main_body(crevices=false) {
    difference() {
        rounded_box(width, length, height, corner_dia=10);
        if (crevices == true) {
            translate([0,0,2.5]) rounded_box(width-2*wall, length-2*wall, height, corner_dia=10-2*wall);
        } else {
            translate([0,0,1]) rounded_box(width-2*wall, length-2*wall, height, corner_dia=10-2*wall);
        }
    }
}

module slot() {

    difference() {
        union() {
            difference() {
                intersection () {
                    rounded_box(width*0.8, 10, 40, 5);
                    translate([0,10,26.45]) rotate([-45,0,0]) cube([width,50,50],center=true);
                }
                rounded_box(width*0.8-4, 6, 40, 2);
            }
            translate([0,0,2.5]) rotate([-45,0,0]) cube([width*0.8-2,10,2],center=true);
        }
        translate([0,6,0]) cube([width, 10,100], center=true);
        cube([width*0.8-14, 20,100], center=true);
    }
}

module fastener_slot() {
    difference() {
        union() {
            difference() {
                hull() {
                    rotate([0,90,0]) cylinder(d=6, h=6,$fn=30);
                    cube([6,6/2,6/2]);
                    translate([6/2,0,-4/2-1/2-1]) cube([6,6,1],center=true);
                    translate([6/2,6/2-0.1/2,-4/2-1/2-12]) cube([6,0.1,0.1],center=true);
                }
                hull() {
                    translate([1.5,1,-1]) rotate([0,90,0]) cylinder(d=4.5,h=5, $fn=30);
                    translate([4.5/2+1.5,1,-3/2-13]) cube([4.5,5,1],center=true);
                }
            }
            translate([1.5,-1.8,-2.2]) intersection() {
                rotate([0,90,0]) cylinder(d=2,h=5,$fn=20);
                translate([0,0,-4/2]) cube([4.5,4,4]);
            }
        }
        translate([4/2+3.75,-4/2,-5.51]) rotate([0,45,0]) cube([4,4,8],center=true);
    }
       
}

module box(crevices=false) {

    crevices = 12;
    distance = length/crevices;
    start = length/2 - distance/2;

    module crevice() {
        rotate([45,0,0]) cube([width, 2, 2], center=true);
    }    

    union() {
        
        if (crevices == true) {
            difference() {
                main_body(crevices=crevices);
                for(i=[0:11]) {
                    translate([0, start - i*distance, 0]) crevice();
                }
            }
        } else {
            main_body(crevices=crevices);
        }
        translate([0,-length/2, height-40-10]) slot();

        translate([width/2+6/2, -length*0.7/2+0.1, height-10]) rotate([0,0,90]) fastener_slot();
        mirror([0,1,0]) translate([width/2+6/2, -length*0.7/2+0.1, height-10]) rotate([0,0,90]) fastener_slot();
        mirror([1,0,0]) translate([width/2+6/2, -length*0.7/2+0.1, height-10]) rotate([0,0,90]) fastener_slot();
        mirror([0,1,0]) mirror([1,0,0]) translate([width/2+6/2, -length*0.7/2+0.1, height-10]) rotate([0,0,90]) fastener_slot();
    }
}

module lid() {
    
    union() {
        difference() {
            rounded_box(width+2*wall+0.2, length+2*wall+0.2, 1, corner_dia=10+2*wall+0.2);
            translate([width/2-2*wall-3/2, -length*0.7/2, -0.5]) rotate([-90,0,0]) cylinder(d=3,h=length*0.7,$fn=30);
            translate([-(width/2-2*wall-3/2), -length*0.7/2, -0.5]) rotate([-90,0,0]) cylinder(d=3,h=length*0.7,$fn=30);

        }
        translate([0,0,1]) difference() {
            rounded_box(width-2*wall-0.2, length-2*wall-0.2, 2,corner_dia=10-2*wall-0.2);
            rounded_box(width-2*wall-4, length-2*wall-4, 3,corner_dia=10-2*wall-4);
        }
        translate([0,0,1]) difference() {
            rounded_box(width+2*wall+0.2, length+2*wall+0.2, 2,corner_dia=10+2*wall+0.2);
            rounded_box(width+0.2, length+0.2, 3,corner_dia=10);
        }
        translate([width/2-2*wall-3/2, 0, 1+0.5/2]) cube([4,length*0.7+2,0.5],center=true);
        translate([-(width/2-2*wall-3/2), 0, 1+0.5/2]) cube([4,length*0.7+2,0.5],center=true);
    }
}

module fastener(){
    difference() {
        union() {
            cylinder(d=4.1, h=length*0.7-3.5,$fn=30);
            translate([0,0,13/2-3.5/2]) cube([wall,4.5,length*0.7-13]);
            translate([0,4.5,0]) cube([wall,4.6,length*0.7-3.5]);
            translate([-2.7,10.5,0]) difference() {
                cylinder(d=8.5, h=length*0.7-3.5,$fn=40);
                cylinder(d=8.5-2*wall, h=length*0.7-3.5,$fn=40);
                translate([-(10-(4-wall)),-9.5,0]) cube([10,10,length*0.7]);
                translate([-5,-8,0]) cube([5,10,length*0.7]);
            }
            translate([-5.8,12,0]) cylinder(d=2, h=length*0.7-3.5, $fn=20);
            translate([-7,4,(length*0.7-3.5)/2]) difference() {
                rotate([-90,0,60]) cylinder(d=20,h=6,$fn=50);
                translate([1.7,-1.1,-30/2]) cube([4,10.1,30]);
                translate([1,-2.1,-30/2]) cube([4,10.1,30]);
                translate([-7,0.8,-30/2]) rotate([0,0,-30]) cube([5,10,30]);
                translate([-13,-10,-30/2]) cube([15,15,30]);
                
                translate([-6.5,10,20/2-5/2-0.5]) rotate([0,45,-30]) cube([5,5,5]);
                translate([-6.5,10,-20/2+5/2+0.5]) rotate([0,45,-30]) cube([5,5,5]);
            }
        }
        translate([-7,4,(length*0.7-2.2)/2]) rotate([-90,0,60]) cylinder(d=20-2*wall,h=10,$fn=50);
    }
}

module plate(text) {
    if (layer == 0.3) {
        rounded_box(width*0.8-6,40,1.5, corner_dia=5);
    } else {
        rounded_box(width*0.8-6,40,1.4, corner_dia=5);
    }
    translate([0,0,1.5]) linear_extrude(1) text(size=14, text="Crap", halign="center", valign="center");
}

module view_proper() {
    %box();
    %translate([0,0,height+1]) rotate([180,0,0]) lid();
    translate([width/2+4/2,(length*0.7-3.5)/2,height-11]) rotate([90,0,0]) fastener();
}


//view_proper();

//intersection() {
//    box();
//    cube([100,100,100]);
//}

box();
//lid();
//fastener();
//plate();