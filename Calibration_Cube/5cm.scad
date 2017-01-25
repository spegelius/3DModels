
nozzle = 0.4;

difference() {
    cube([50,50,0.2], center=true);
    cube([50-2*nozzle,50-2*nozzle,0.3], center=true);
}