
card_spacing = 20.32;

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

//mock_mobo();
//mock_card();
//mock_mobo_card();
//mock_ssd();