include <../Dollo/NEW_long_ties/include.scad>;

//chick();
//debug_sobules();

solubles();
//supports1();
//supports2();

module chick() {
    union() {
        import("../_downloaded/Easter_chick_for_multi/legs.stl");
        translate([0,0,-0.01]) {
            import("../_downloaded/Easter_chick_for_multi/body.stl");
            import("../_downloaded/Easter_chick_for_multi/beak.stl");
            import("../_downloaded/Easter_chick_for_multi/eyes.stl");
        }
    }
}

module chick_no_legs() {
    import("../_downloaded/Easter_chick_for_multi/body.stl");;
    import("../_downloaded/Easter_chick_for_multi/beak.stl");
}

module supports1() {
    difference() {
        translate([0,3,0]) scale([1,1.6,1]) cylinder(d=30,h=14);
        //translate([0,0,0]) chick();
        
        translate([0,3,13]) scale([0.9,1.5,0.9]) cylinder(d=30,h=14);
        translate([7,20,29]) rotate([-90,0,0]) cylinder(d=9,h=7);
        translate([-7,20,29]) rotate([-90,0,0]) cylinder(d=9,h=7);
        
        translate([9,5,0]) cylinder(d=7.1,h=25);
        translate([18,13.5,0]) rotate([0,45,-10]) cube([20,60,60],center=true);
        translate([8,-1,0]) rotate([-35,0,-8]) cylinder(d1=9,d2=7,h=10);
        translate([9+10/2,3.7,8.4]) rotate([45,0,0]) cube([10,5,4],center=true);
        
        
        translate([-9,5,0]) cylinder(d=7.1,h=25);
        translate([-18,13.5,0]) rotate([0,-45,10]) cube([20,60,60],center=true);
        translate([-8,-1,0]) rotate([-35,0,8]) cylinder(d1=9,d2=7,h=10);
        translate([-9-10/2,3.7,8.4]) rotate([45,0,0]) cube([10,5,4],center=true);
        
        translate([0,4,0]) cube([60,0.5,60],center=true);
        
        //translate([0,28,0]) cube([50,20,20],center=true);
        translate([0,29,0]) rotate([45,0,0]) cube([50,20,20],center=true);
        
        //translate([0,-21.5,5]) rotate([45,0,0]) cube([50,8,8],center=true);
    }
    difference() {
        translate([0,-31,0]) cylinder(d=10,h=13);
        translate([0,-31,0]) cylinder(d=9,h=42);
    }
    
    //%chick();
}

module supports2() {
    difference() {
        translate([0,-31,13]) cylinder(d=10,h=47.5-13);
        translate([0,-31,0]) cylinder(d=9,h=42);
        translate([0,-31,42]) cylinder(d1=9,d2=0,h=4.5);
    }
}

module solubles() {
    difference() {
        union() {
            translate([0,4,0]) scale([1,1.45,1]) cylinder(d=30,h=28);
            translate([0,-31,0]) cylinder(d=10,h=50.5);
        }
        chick();
        difference() {
            union() {
                translate([0,4,0]) scale([1,1.45,1]) cylinder(d=30,h=28);
                translate([0,-31,0]) cylinder(d=10,h=49);
            }
            translate([0,0,-1.5]) chick_no_legs();
        }
    }
    //%chick();
}

module debug_sobules() {
    intersection() {
        solubles();
        //translate([0,-100/2,0]) cube([100,100,100]);
    }
}
