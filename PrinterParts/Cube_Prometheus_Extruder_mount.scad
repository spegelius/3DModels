slop = 0.15;

module frame(height=40) {
    translate([0,0,4/2]) cube([66,30,4], center=true);
    translate([-66/2,-30/2+3,4]) rotate([90,0,0]) linear_extrude(3) polygon(points=[[66-2,0], [66-2,height-4], [0,0]]);
    translate([(66-2*2)/2,-30/2,0]) cube([3,28,height]);
    translate([(66-2*2)/2,-12,0]) cube([18+3,3,height]);
}

module single_mount(height=40) {
    difference() {
        frame(height=height);
        cylinder(d=20,h=5, $fn=40);
        translate([25,0,0]) cylinder(d=4+2*slop,h=5, $fn=40);
        translate([-25,0,0]) cylinder(d=4+2*slop,h=5, $fn=40);
        
        translate([(66-2*2+3*2)/2+18/2,-2,6]) rotate([-90,0,0]) cylinder(d=4,h=5,$fn=40);
        translate([(66-2*2+3*2)/2+18/2,-2,height-6]) rotate([-90,0,0]) cylinder(d=4,h=5,$fn=40);

        translate([(66-2*2+3*2)/2,-2,height-6]) rotate([0,-90,0]) cylinder(d=4,h=5,$fn=40);
        
        //translate([66/2,30/2,0]) rotate([0,0,45]) cube([15,15,10],center=true);
        translate([-66/2,30/2,0]) rotate([0,0,-45]) cube([15,15,10],center=true);
    }
}

module mock_extruder() {
    cube([66, 32.8, 50]);
    translate([(43-2*2.9)/2+11.9, 0,50/2]) rotate([90,0,0]) cylinder(d=43-2*2.9, h=66.5-40);
    translate([(43-2*2.9)/2+11.9,-(66.5-40)-40/2, 50/2]) cube([42,40,42], center=true);
    
    translate([11.9+54,-(66.5-40)-40, 50/2+5]) rotate([0,-45,0]) cube([20,40,40]);
}

module mock_printer_frame() {
    translate([-20,-80,-100]) {
        cube([20,100,200]);
        translate([252+20,0,0]) cube([20,100,200]);
    }
}

module _beam(left=true){
    //translate([0,0,50]) cube([252,20,30]);
    
    width = 256;
    
    bolt_dia = 3.5;
    difference() {
        cube([width/2, 70, 30]);
        translate([1,20,0]) rotate([0,0,45]) cube([200,200,30]);
        translate([150,0,0]) rotate([0,0,45]) translate([-140,0,0]) cube([200,100,30]);
    }
    
    translate([width/2-70,50,0]) difference() {
        union() {
            cube([70,20,30]);
            if (left) {
                translate([70, 15, 30/2]) rotate([0,0,45]) cube([5.8,5.8,30],center=true);
            } else {
                translate([70, 5, 30/2]) rotate([0,0,45]) cube([5.8,5.8,30],center=true);
            }
        }
        if (left) {
            translate([70, 5, 30/2]) rotate([0,0,45]) cube([6,6,30],center=true);
            translate([70,20/2,7]) rotate([0,90,20]) translate([0,0,-80/2]) cylinder(d=bolt_dia,h=80, $fn=60);
            translate([70,20/2,30-7]) rotate([0,90,-20]) translate([0,0,-80/2]) cylinder(d=bolt_dia,h=80, $fn=60);
            translate([70,20/2,7]) rotate([0,90,20]) translate([0,0,-80/2]) cylinder(d=8,h=23, $fn=60);
            translate([70,20/2,30-7]) rotate([0,90,-20]) translate([0,0,-80/2]) cylinder(d=8,h=23, $fn=60);
            
        } else {
            translate([70, 15, 30/2]) rotate([0,0,45]) cube([6,6,30],center=true);
            translate([70,20/2,30-7]) rotate([0,90,20]) translate([0,0,-80/2]) cylinder(d=bolt_dia,h=80, $fn=60);
            translate([70,20/2,7]) rotate([0,90,-20]) translate([0,0,-80/2]) cylinder(d=bolt_dia,h=80, $fn=60);
            translate([70,20/2,30-7]) rotate([0,90,20]) translate([0,0,-80/2]) cylinder(d=8,h=23, $fn=60);
            translate([70,20/2,7]) rotate([0,90,-20]) translate([0,0,-80/2]) cylinder(d=8,h=23, $fn=60);
        }
        
    }

    // left extruder
    translate([-9,66/2+21,0]) rotate([0,0,90]) mirror([1,0,0]) single_mount();
    translate([5,20,0]) difference() {
        cube([30,30,4]);
        rotate([0,0,-45]) cube([30,30,4]);
    }
    
    //middle extruder
    translate([38,66/2+61,0]) difference() {
        rotate([0,0,90]) mirror([1,0,0]) single_mount(height=30);
        translate([-58,-66/2-2,0]) rotate([0,45,0]) cube([30,10,80]);
    }
    translate([14,31,0]) rotate([0,0,45]) cube([40,21,4]);
    
}

module beam(left=true) {
    
    function to_mirror(left=true) = (left) ? 0 : 1;
    
    mirror([to_mirror(left),0,0]) difference() {
        _beam(left=left);
        translate([-1,10,6]) rotate([0,90,0]) cylinder(d=4,h=26, $fn=40);
        translate([10,10,6]) rotate([0,90,0]) cylinder(d=8,h=26, $fn=40);
        translate([-1,10,40-6]) rotate([0,90,0]) cylinder(d=4,h=26, $fn=40);
    }
    
}

//%mock_printer_frame();

//%translate([252+25, 20, 0]) rotate([0,0,90]) mock_extruder();
//%translate([-25, 20, 0]) mirror([10,0,0]) rotate([0,0,90]) mock_extruder();
//%translate([55, 60, 0]) rotate([0,0,90]) mock_extruder();
//%translate([195, 60, 0]) mirror([10,0,0]) rotate([0,0,90]) mock_extruder();

// view
//intersection() {
//    translate([100,0,0]) cube([80,90,90]);
//    union() {
//        translate([0,0,50]) beam();
//        translate([252,0,50]) mirror([1,0,0]) beam(left=false);
//    }
//}

//translate([-80,0,0]) beam(left=true);
//translate([80,0,0]) beam(left=false);


rotate([0,-90,0]) difference() {
    cube([2.1,18,40]);
    translate([-1,8,6]) rotate([0,90,0]) cylinder(d=4,h=5, $fn=40);
    translate([-1,8,40-6]) rotate([0,90,0]) cylinder(d=4,h=5, $fn=40);
}

translate([0,25,0]) rotate([0,-90,0]) difference() {
    cube([3,18,40]);
    translate([2.1,0,0]) cube([0.9,20,26]);
    translate([-1,8,6]) rotate([0,90,0]) cylinder(d=4,h=5, $fn=40);
    translate([-1,8,40-6]) rotate([0,90,0]) cylinder(d=4,h=5, $fn=40);
}