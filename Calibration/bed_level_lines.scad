bed_x = 200-10;
bed_y = 200-10;

nozzle = 0.66;

layer = 0.2;

y = bed_y/6;

cube([bed_x, nozzle, layer]);
translate([bed_x-nozzle,0,0]) cube([nozzle, y, layer]);
translate([0,y,0]) cube([bed_x,nozzle,layer]);
translate([0,y,0]) cube([nozzle, y, layer]);
translate([0,2*y,0]) cube([bed_x,nozzle,layer]);
translate([bed_x-nozzle,2*y,0]) cube([nozzle, y, layer]);
translate([0,3*y,0]) cube([bed_x,nozzle,layer]);
translate([0,3*y,0]) cube([nozzle, y, layer]);
translate([0,4*y,0]) cube([bed_x,nozzle,layer]);
translate([bed_x-nozzle,4*y,0]) cube([nozzle, y, layer]);
translate([0,5*y,0]) cube([bed_x,nozzle,layer]);
translate([0,5*y,0]) cube([nozzle, y, layer]);
translate([0,6*y,0]) cube([bed_x,nozzle,layer]);