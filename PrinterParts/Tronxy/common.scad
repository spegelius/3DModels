module mock_bearing() {
    d = 18;
    h = 11;
    $fn = 40;
    difference() {
        union() {
            cylinder(d=d+3,h=1);
            cylinder(d=d,h=h);
            translate([0,0,h-1]) cylinder(d=d+3,h=1);
        }
        cylinder(d=5,h=h*3,center=true);
    }
}