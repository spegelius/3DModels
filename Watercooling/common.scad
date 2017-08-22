pump_width = 45.5;
pump_height = 63.5;
pump_depth = 63;

tube1_outer_dia = 12.15; // copper
tube1_inner_dia = 10;

tube2_outer_dia = 10;
tube2_inner_dia = 8.5;

fitting_thread_dia = 12.9;

passthrough_thread_dia = 15.8;

wire_pass_thread_dia = 10;

module mock_pump() {
    difference() {
        translate([0,0,6])cube([pump_width, pump_depth, pump_height]);
        translate([0,63,45+6]) rotate([30,0,0]) cube([50,pump_depth-23,pump_height-23.5]);
    }
    translate([pump_width/2, 41.6+13.1/2, pump_height - (20-14.3)+6]) cylinder(d=13.1, h=20, $fn=30);
    
    module foot() {
        hull() {
            cylinder(d=20,h=0.1);
            translate([0,0,5.9]) cylinder(d=11,h=0.1);
        }
    }
    translate([6.7, 15.4, 0]) foot();
    translate([pump_width - 6.7, 15.4, 0]) foot();
    translate([6.7, 48.3, 0]) foot();
    translate([pump_width - 6.7, 48.3, 0]) foot();

}