nozzle = 0.49;

flap_width = 9;

difference() {
    union() {
        cube([15+2*nozzle,19.2+2*nozzle,2], center=true);
        translate([0,(19.2+2*nozzle)/2,0]) cube([3.8,2,2], center=true);
    }
    union() {
        translate([0,0,nozzle]) cube([15,19.2,2], center=true);
        translate([0,(19.2)/2,nozzle]) cube([3.8-2*nozzle,2,2], center=true);
    }
    cube([15-3,19.2-3,2], center=true);
    translate([(15+2*nozzle)/2,(19.2+2*nozzle)/2-flap_width/2,nozzle]) cube([2*nozzle,flap_width,2], center=true);
}

difference() {
    translate([(15+2*nozzle)/2, (19.2+2*nozzle)/2-flap_width,-2/2]) hull() {
        difference() {
            cube([1.5, flap_width,nozzle]);
            //translate([0,0,nozzle/2]) cube([nozzle, flap_width, nozzle]);
        }
        
        translate([45.5, 4+nozzle,0]) cylinder(d=6,h=nozzle, $fn=30);
    }
        
    translate([(15+2*nozzle)/2+45.5, (19.2+2*nozzle)/2+nozzle+4-flap_width,-2/2]) cylinder(d=4,h=2, $fn=30);
}