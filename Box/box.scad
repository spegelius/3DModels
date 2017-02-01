
width = 240;
length = 200;
height = 190;

nozzle = 0.45;
wall = 3*nozzle;

corder_dia = 15;

module main() {
    difference() {
        hull() {
            translate([width/2-corder_dia/2, length/2-corder_dia/2, 0]) cylinder(d=corder_dia, h=height);
            translate([-(width/2-corder_dia/2), length/2-corder_dia/2, 0]) cylinder(d=corder_dia, h=height);
            translate([width/2-corder_dia/2, -(length/2-corder_dia/2), 0]) cylinder(d=corder_dia, h=height);
            translate([-(width/2-corder_dia/2), -(length/2-corder_dia/2), 0]) cylinder(d=corder_dia, h=height);
        }
        
        hull() {
            translate([width/2-corder_dia/2-wall, length/2-corder_dia/2-wall, 4]) cylinder(d=corder_dia-wall, h=height);
            translate([-(width/2-corder_dia/2-wall), length/2-corder_dia/2-wall, 4]) cylinder(d=corder_dia, h=height);
            translate([width/2-corder_dia/2-wall, -(length/2-corder_dia/2-wall), 4]) cylinder(d=corder_dia, h=height);
            translate([-(width/2-corder_dia/2-wall), -(length/2-corder_dia/2-wall), 4]) cylinder(d=corder_dia, h=height);
        }
    }
    
}

module box() {
    
    crevices = 12;
    distance = length/crevices;
    start = length/2 - distance/2;
    
    module crevice() {
        rotate([45,0,0]) cube([width, 5, 5], center=true);
    }
    difference() {
        main();
        for(i=[0:11]) {
            translate([0, start - i*distance, 0]) crevice();
        }
    }
}

box();