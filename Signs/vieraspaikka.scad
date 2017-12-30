
w=240;
h=100;
thickness=0.8;

rim_thickness = 0.6;

module plate(w=240, l=100, thickness=1) {
    
    hole_distance = 8;
    hole_w = w/2-hole_distance;
    hole_h = h/2-hole_distance;
    
    difference() {
        translate([0,0,thickness/2]) cube([w, h, thickness], center=true);
        translate([hole_w, hole_h,0]) cylinder(d=3, h=thickness+1, $fn=30);
        translate([-hole_w, hole_h,0]) cylinder(d=3, h=thickness+1, $fn=30);
        translate([hole_w, -hole_h,0]) cylinder(d=3, h=thickness+1, $fn=30);
        translate([-hole_w, -hole_h,0]) cylinder(d=3, h=thickness+1, $fn=30);
    }
    color("black") translate([0,0,thickness+rim_thickness/2]) {
        difference() {
            cube([w-1,h-1,rim_thickness],center=true);
            cube([w-1-4,h-1-4,2],center=true);
        }
    }
    translate([-(w/2-40),-(h/2-25),thickness]) slot();
}

module main_text() {
    translate([0,15,thickness]) color("black") {
        linear_extrude(height=1)
            text(text="Vieraspaikka", halign="center", valign="center", size=29);
    }
}

module slot() {
    intersection() {
        union() {
            rotate([90,45,0]) difference() {
                cube([38,38,40], center=true);
                cube([33,33,40], center=true);
            }
            translate([0,-19.4,2/2]) rotate([-45,0,0]) cube([47,2,3],center=true);
        }
        translate([0,0,1.4/2]) cube([70,40,1.4], center=true);
    }
    
}

module num_card_text(number_text){
    linear_extrude(height=1)
        text(text=number_text, halign="center", valign="center", size=26);
}

module num_card(number_text) {
    
    difference() {
        intersection() {
            rotate([90,45,0]) cube([33,33,40], center=true);
            translate([0,0,1/2]) cube([70,40,1], center=true);
        }
        num_card_text(number_text);
    }
}

plate(w=w,h=h,thickness=thickness);
main_text();

//num_card("1");
//num_card_text("1");