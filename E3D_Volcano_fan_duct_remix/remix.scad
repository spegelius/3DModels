
//import("../_downloaded/E3D_v6_Micro_Cooling_Fan_Duct/e3d-v6-5015-fan-duct-right-r4.STL");
//translate([-6.5,-48.8,0]) import("../_downloaded/E3D_Volcano_5015_fan_shroud/e3d-5015volcano.stl");

module volcano_fan_shroud() {
    
    module _main() {
        translate([-11.4,-44]) intersection() {
            rotate([-14,0,0]) cube([36.45,20.4,17.95]);
            cube([40,40,40]);
        }
    }
    
    module _delete() {
        translate([-8.26,-49.1,11.95]) rotate([-14,0,0]) cube([30.18,20,22.8]);
        translate([-8.26,-48,0]) rotate([-14,0,0]) cube([30.18,8,22.8]);
        translate([30.2/2-8.25,-42,-1]) rotate([-14,0,0]) hull() {
            cylinder(d=20,h=30,$fn=30);
            translate([-20,-20,0]) cube([40,1,30]);
        }
        
        translate([30.2-8.25-3.1,-35,-1]) rotate([-14,0,0]) hull() {
            translate([0,0,7]) cylinder(d=3.5, h=20,$fn=20);
            translate([0,-2,7]) cylinder(d=3.5, h=20,$fn=20);
        }
        
        translate([-8.25+3.1,-35,-1]) rotate([-14,0,0]) hull() {
            translate([0,0,7]) cylinder(d=3.5, h=20,$fn=20);
            translate([0,-2,7]) cylinder(d=3.5, h=20,$fn=20);
        }
        
        translate([30.2-8.25-3.1,-35,-1]) rotate([-14,0,0]) hull() {
            cylinder(d=5.5, h=13.6,$fn=20,center=true);
            translate([0,-2,0]) cylinder(d=5.5, h=13.6,$fn=20,center=true);
        }
        
        translate([-8.25+3.1,-35,-1]) rotate([-14,0,0]) hull() {
            cylinder(d=5.5, h=13.6,$fn=20,center=true);
            translate([0,-2,0]) cylinder(d=5.5, h=13.6,$fn=20,center=true);
        }
        
        translate([-12,-50,0]) rotate([-45,0,0]) cube([40,20,10]);
    }

    union() {
        difference() {
            union() {
                render() translate([0,0,0]) import("temp_fixed.stl", convexity=30);
                _main();
            }
            _delete();
        }
        //difference() {
        //    _main();
        //    _delete();
        //}
    }
}

translate([0,7.5,0]) volcano_fan_shroud();
