atx_psu_width = 150;
atx_psu_height = 86;

card_spacing = 20.32;

fan_connector_width = 6.1;
fan_connector_length = 7.9;

module mock_mobo() {
    $fn=50;
    difference() {
        cube([350, 193, 2]);
        translate([350-16.5,10,0]) cylinder(d=4, h=3);
        translate([350-16.5,193-27.7,0]) cylinder(d=4, h=3);

        translate([350-95.2,10,0]) cylinder(d=4, h=3);

        translate([350-141,10,0]) cylinder(d=4, h=3);
        translate([350-141,193-27.7,0]) cylinder(d=4, h=3);

        translate([6.3,33.2,0]) cylinder(d=4, h=3);
        translate([6.3,193-27.7,0]) cylinder(d=4, h=3);
    }
}

module mock_card() {
    $fn=50;
    cube([200, 2, 106.7]);
    translate([-12.3, -15.8+22-19.4, -18.8+119.2]) difference() {
        cube([12.3,19.4,1]);
        translate([6.3, 19.4-1-4.8/2,0]) hull() {
            cylinder(d=4.8,h=2, $fn=40);
            translate([0,5,0]) cylinder(d=4.8,h=2, $fn=40);
        }
    }
    difference() {
        translate([-1,-15.8, -18.8]) cube([1,22, 120.2]);
        translate([-1.3,-15.8, -18.8]) cube([2,(18.8-10.6)/2, 11.2]);
        translate([-1.3,-15.8+10.6+(18.8-10.6)/2, -18.8]) cube([2,(18.8-10.6)/2, 11.2]);
        translate([-1.3,-15.8+18.8, -18.8]) cube([2,5, 116.2]);
        translate([-1.3,-15.8, -18.8+116.2]) cube([2,22-18.8, 5]);
    }
    
}

module mock_mobo_card() {
    
    mock_mobo();
    translate([350-142,-1.2,18.8-10.4]) rotate([0,0,90]) mock_card();
    translate([350-142+card_spacing,-1.2,18.8-10.4]) rotate([0,0,90]) mock_card();
    translate([350-142+2*card_spacing,-1.2,18.8-10.4]) rotate([0,0,90]) mock_card();
    translate([350-142+3*card_spacing,-1.2,18.8-10.4]) rotate([0,0,90]) mock_card();
    translate([350-142+4*card_spacing,-1.2,18.8-10.4]) rotate([0,0,90]) mock_card();
    translate([350-142+5*card_spacing,-1.2,18.8-10.4]) rotate([0,0,90]) mock_card();
    translate([350-142+6*card_spacing,-1.2,18.8-10.4]) rotate([0,0,90]) mock_card();
}

module mock_ssd() {
    difference() {
        cube([70, 100, 7.1]);
        translate([9.4,0,6.5]) cube([41.4,7,1]);
        translate([10.4,0,0]) cube([39.4,7,2]);
    }
    translate([0,13.6,3]) rotate([0,-90,0]) cylinder(d=2.5, h=5, $fn=30);
    translate([0,100-9.2,3]) rotate([0,-90,0]) cylinder(d=2.5, h=5, $fn=30);

    translate([70+5,13.6,3]) rotate([0,-90,0]) cylinder(d=2.5, h=5, $fn=30);
    translate([70+5,100-9.2,3]) rotate([0,-90,0]) cylinder(d=2.5, h=5, $fn=30);

}


hd_width = 102;
hd_height = 26.1;

screw_dia = 3.6;

module mock_hd() {
    color("white") difference() {
        cube([hd_width,146,26]);
        translate([0,28.3,6.40]) rotate([0,90,0]) cylinder(d=screw_dia, h=5, $fn=30);
        translate([0,69.8,6.40]) rotate([0,90,0]) cylinder(d=screw_dia, h=5, $fn=30);
        translate([0,129.8,6.40]) rotate([0,90,0]) cylinder(d=screw_dia, h=5, $fn=30);

        translate([hd_width-5,28.3,6.40]) rotate([0,90,0]) cylinder(d=screw_dia, h=5, $fn=30);
        translate([hd_width-5,69.8,6.40]) rotate([0,90,0]) cylinder(d=screw_dia, h=5, $fn=30);
        translate([hd_width-5,129.8,6.40]) rotate([0,90,0]) cylinder(d=screw_dia, h=5, $fn=30);

    }
        
}

module minus_atx_psu_holes(hole=3.2) {
    difference() {
        children();
        translate([-138/2,0,6]) rotate([-90,0,0]) cylinder(d=hole, h=5, $fn=30);
        translate([138/2,0,6]) rotate([-90,0,0]) cylinder(d=hole, h=5, $fn=30);
        translate([138/2,0,6+64]) rotate([-90,0,0]) cylinder(d=hole, h=5, $fn=30);
        translate([-150/2+30,0,atx_psu_height-6]) rotate([-90,0,0]) cylinder(d=hole, h=5, $fn=30);
    }
}

module mock_atx_psu(holes=true, slop=0) {
    w = atx_psu_width+2*slop;
    h = atx_psu_height+2*slop;
    if (holes) {
        minus_atx_psu_holes() {
            translate([-w/2,0,0]) cube([w, 140, h]);
        }
    } else {
        translate([-w/2,0,0]) cube([w, 140, h]);
    }
}


module mock_fan_connector_male(slop=0.2) {
    
    module pin() {
        color("grey") cube([0.75,0.75,14.3],center=true);
    }
    
    w = fan_connector_width + slop;
    l = fan_connector_length + slop;
    
    pin_offset = (5.8-0.75)/2;
    union() {
        color("white") {
            translate([0,0,3.2/2]) cube([w, l,3.2], center=true);
            translate([-w/2+0.9/2,0,3.2+8.5/2]) cube([0.9,5,8.5],center=true);
            translate([-w/2+0.9+0.3/2,0,1.7/2+5.7]) cube([0.3,5,1.7],center=true);
        }
        
        translate([-w/2+2.4,0,14.3/2-3.6]) pin();
        translate([-w/2+2.4,pin_offset,14.3/2-3.6]) pin();
        translate([-w/2+2.4,-pin_offset,14.3/2-3.6]) pin();
    }
}


//mock_mobo();
//mock_card();
//mock_mobo_card();
//mock_ssd();
//mock_atx_psu();
//mock_fan_connector_male();