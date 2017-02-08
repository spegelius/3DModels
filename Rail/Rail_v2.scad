
length=130;
width=20;

nozzle=0.6;
spring_width=1*nozzle+0.05;

slop=0.15;

module wiggly(d, h) {
    //z_step = h/(ceil(h/2));
    z_step = h/4;
    echo(z_step);
    
    for (i = [0:4]) {
        translate([0,0,i*z_step]) linear_extrude(height=z_step, center=true, convexity = 10, twist = 360, $fn = 30) translate([0.2, 0, 0]) circle(d=d-0.4);
    }
}

module hexagon(inner_diameter, height) {
    $fn=6;
    dia = sqrt(((inner_diameter/2)*(inner_diameter/2))/0.75) * 2;
    echo (dia);
    cylinder(d=dia, h=height);
}

module _rail(length, width) {
    rotate([-90,0,0]) hexagon(width, length);
}

module rail(length, width) {
    difference() {
        _rail(length, width);
        #translate([0,length/2,0]) rotate([0,45,0]) cube([width/2, length, width/2], center=true);
    }
}


module slide(height) {
    
    module spring() {
        $fn=60;
        intersection() {
            difference() {
                wiggly(d=11, h=height);
                wiggly(d=11-2*spring_width, h=height);
            }
            translate([-13,2.5,height/2]) rotate([0,0,-65]) cube([20,20,height], center=true);
        }
    }

    rotate([90,0,0]) difference() {
        _rail(height, width*1.55);
        _rail(height+1, width*1.25);
    }
    
    for (i = [1:6]) {
        angle = 360/6*i;
        rotate([0,0,angle]) translate([0,15.5,0]) rotate([0,0,65]) spring();
    }

}


//translate([32,0,0]) rotate([90,0,0]) rail(length,width);
translate([0,-length/2,width/2]) rail(length,width);
//translate([32,0,0]) slide(15);
//translate([-25,0,0]) wiggly(11,10);
translate([-25,-length/2,0]) cube([width/2-slop, length/2,width/2-slop]);

